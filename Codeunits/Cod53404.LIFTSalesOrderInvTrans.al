codeunit 53404 "LIFT Sales Order Inv. Trans"
{

    procedure RunForSalesOrder(SalesOrderNo: Code[20])
    var
        LIFTERPSetup: Record "ORB LIFT ERP Setup";
        APIURL: Text[1024];
        APICode: Code[20];
        JsonResponse: Text;
    begin
        LIFTERPSetup.Get();
        APIURL := LIFTERPSetup."Inventory Journal API" + '&p2=' + SalesOrderNo;
        APICode := 'INVENTORYJOURNALS';
        if GetRequest(APIURL, APICode, JsonResponse) then
            ProcessRequest(SalesOrderNo, APICode, JsonResponse);
    end;

    local procedure ProcessRequest(SalesOrderNo: Code[20]; APICode: Code[20]; JsonText: Text)
    var
        JsonObject: JsonObject;
        JsonArray: JsonArray;
        JsonToken: JsonToken;
        JsonEntry: JsonToken;
        WhseJnlLine: Record "Warehouse Journal Line";
        BatchName: Code[20];
        i: Integer;
    begin
        BatchName := 'SO' + DelChr(SalesOrderNo, '=', '-');
        CreateWhseBatch(BatchName);

        if not JsonObject.ReadFrom(JsonText) then
            Error('Invalid JSON Response');
        if not JsonObject.Get('rowset', JsonToken) then
            Error('Missing "rowset" in response');

        JsonArray := JsonToken.AsArray();
        for i := 0 to JsonArray.Count() - 1 do begin
            JsonArray.Get(i, JsonEntry);
            CreateJournalLine(WhseJnlLine, JsonEntry.AsObject(), BatchName);
        end;

        PostWarehouseJournal(BatchName);

        DeleteWhseBatch(BatchName);
    end;

    local procedure CreateWhseBatch(BatchName: Code[20])
    var
        JnlBatch: Record "Warehouse Journal Batch";
        Template: Record "Warehouse Journal Template";
    begin
        Template.Get('ITEM');
        if not JnlBatch.Get('ITEM', BatchName) then begin
            JnlBatch.Init();
            JnlBatch."Journal Template Name" := 'ITEM';
            JnlBatch.Name := BatchName;
            JnlBatch.Description := 'Auto from SO';
            JnlBatch.Insert();
        end;
    end;

    local procedure DeleteWhseBatch(BatchName: Code[20])
    var
        JnlBatch: Record "Warehouse Journal Batch";
    begin
        if JnlBatch.Get('ITEM', BatchName) then
            JnlBatch.Delete();
    end;

    local procedure PostWarehouseJournal(BatchName: Code[20])
    var
        WhseJnlLine: Record "Warehouse Journal Line";
        WhseRegister: Codeunit "Whse. Jnl.-Register";
    begin
        WhseJnlLine.SetRange("Journal Template Name", 'ITEM');
        WhseJnlLine.SetRange("Journal Batch Name", BatchName);
        CODEUNIT.Run(CODEUNIT::"Whse. Jnl.-Register", WhseJnlLine);
    end;

    local procedure CreateJournalLine(var Line: Record "Warehouse Journal Line"; JObject: JsonObject; BatchName: Code[20])
    var
        EntryNo: Integer;
        Template: Record "Warehouse Journal Template";
        EntryTypeText: Text;
    begin
        Line.Reset();
        Line.SetRange("Journal Template Name", 'ITEM');
        Line.SetRange("Journal Batch Name", BatchName);
        if Line.FindLast() then
            EntryNo := Line."Line No." + 10000
        else
            EntryNo := 10000;

        Template.Get('ITEM');

        Line.Init();
        Line."Journal Template Name" := 'ITEM';
        Line."Journal Batch Name" := BatchName;
        Line."Line No." := EntryNo;
        Line.Validate("Location Code", GetValueAsCode(JObject, 'LOCATION_CODE'));
        Line.Validate("Registering Date", DT2Date(EvaluateUTCDateTime(GetValueAsText(JObject, 'POSTING_DATE'))));
        Line.Validate("Bin Code", 'WR-LIFT');
        Line.Validate("Item No.", GetValueAsText(JObject, 'MATERIAL_BARCODE'));
        Line.Validate("Whse. Document No.", GetValueAsText(JObject, 'DOCUMENT_NUMBER'));
        Line.Validate(Quantity, GetValueAsDecimal(JObject, 'QUANTITY'));
        Line.Validate("Unit of Measure Code", GetValueAsCode(JObject, 'UNIT_OF_MEASURE'));

        EntryTypeText := GetValueAsText(JObject, 'ENTRY_TYPE');
        if EntryTypeText = 'NEGATIVE' then
            Line.Validate("Entry Type", Line."Entry Type"::"Negative Adjmt.")
        else
            Line.Validate("Entry Type", Line."Entry Type"::"Positive Adjmt.");

        Line."ORB LIFT Inv. Transaction ID" := GetValueAsInteger(JObject, 'INVENTORY_TRANSACTION_ID');
        Line."ORB LIFT Order Line ID" := GetValueAsInteger(JObject, 'ORDER_LINE_ID');
        Line."Source Code" := Template."Source Code";
        Line.Insert(true);
        Line.SetUpAdjustmentBin();

        IntegrationLog(Database::"Warehouse Journal Line", 0, Line."Item No.", Line."ORB LIFT Inv. Transaction ID");
    end;

    local procedure IntegrationLog(SourceType: Integer; Subtype: Integer; SourceNo: Code[20]; SourceLineNo: Integer)
    var
        Log: Record "ORB LIFT Integration Data Log";
    begin
        if Log.FindLast() then
            Log."Entry No." := Log."Entry No." + 1
        else
            Log."Entry No." := 1;
        Log.Init();
        Log."Source Type" := SourceType;
        Log."Source Subtype" := Subtype;
        Log."Source No." := SourceNo;
        Log."Source Line No." := SourceLineNo;
        Log."Transaction ID" := SourceLineNo;
        Log.Insert();
    end;

    local procedure GetRequest(URL: Text; APICode: Code[20]; var ResponseText: Text): Boolean
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
    begin
        Client.Get(URL, Response);
        Response.Content().ReadAs(ResponseText);
        if not Response.IsSuccessStatusCode() then
            Error('%1 - %2', Response.HttpStatusCode(), ResponseText);
        exit(true);
    end;

    local procedure GetValueAsText(JObject: JsonObject; Path: Text): Text
    var
        JToken: JsonToken;
    begin
        if JObject.SelectToken(Path, JToken) and not JToken.AsValue().IsNull() then
            exit(JToken.AsValue().AsText());
        exit('');
    end;

    local procedure GetValueAsDecimal(JObject: JsonObject; Path: Text): Decimal
    var
        JToken: JsonToken;
    begin
        if JObject.SelectToken(Path, JToken) and not JToken.AsValue().IsNull() then
            exit(JToken.AsValue().AsDecimal());
        exit(0);
    end;

    local procedure GetValueAsInteger(JObject: JsonObject; Path: Text): Integer
    var
        JToken: JsonToken;
    begin
        if JObject.SelectToken(Path, JToken) and not JToken.AsValue().IsNull() then
            exit(JToken.AsValue().AsInteger());
        exit(0);
    end;

    local procedure GetValueAsCode(JObject: JsonObject; Path: Text): Code[20]
    begin
        exit(CopyStr(GetValueAsText(JObject, Path), 1, 20));
    end;

    local procedure EvaluateUTCDateTime(DateTimeText: Text): DateTime
    var
        TypeHelper: Codeunit "Type Helper";
        TempVar: Variant;
    begin
        TempVar := DateTimeText;
        if TypeHelper.Evaluate(TempVar, DateTimeText, '', TypeHelper.GetCultureName()) then
            exit(TempVar);
        exit(0DT);
    end;
}
