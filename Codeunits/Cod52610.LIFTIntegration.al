codeunit 52610 "ORB LIFT Integration"
{
    procedure ParseData(APIURLPar: Text[1024]; APICodePar: code[20])
    var
        JsonResponse: text;
    begin
        if GetRequest(APIURLPar, APICodePar, JsonResponse) then begin
            ProcessRequest(APICodePar, JsonResponse);
        end;
    end;

    procedure GetRequest(APIURLPar: text[1024]; APICodePar: code[20]; var ResponseTextPar: Text): Boolean
    var
        httpClient: HttpClient;
        httpResponseMessage: HttpResponseMessage;
        httpStatusCode: Integer;
    begin
        httpClient.Get(APIURLPar, httpResponseMessage);
        httpResponseMessage.Content().ReadAs(ResponseTextPar);
        httpStatusCode := httpResponseMessage.HttpStatusCode();
        if not httpResponseMessage.IsSuccessStatusCode() then
            Error('%1 - %2', httpStatusCode, ResponseTextPar);
        exit(true);
    end;

    local procedure CreateSalesOrder(var SalesHeader: Record "Sales Header"; jsonOrderObject: JsonObject)
    var
        JsonOrderToken: JsonToken;
    begin
        JsonOrderToken := jsonOrderObject.AsToken();
        SalesHeader.Init();
        SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
        SalesHeader."No." := GetValueAsCode(JsonOrderToken, 'ORDER_NUMBER');
        SalesHeader.Insert(true);
        SalesHeader.Validate("Sell-to Customer No.", GetValueAsCode(JsonOrderToken, 'SELL_TO_CUSTOMER'));
        SalesHeader.Validate("Bill-to Customer No.", GetValueAsCode(JsonOrderToken, 'BILL_TO_CUSTOMER'));
        SalesHeader.Validate("Document Date", DT2Date(EvaluateUTCDateTime(GetValueAstext(JsonOrderToken, 'DOCUMENT_DATE'))));
        SalesHeader.Validate("Posting Date", DT2Date(EvaluateUTCDateTime(GetValueAstext(JsonOrderToken, 'POSTING_DATE'))));
        SalesHeader."In-Hands Date" := DT2Date(EvaluateUTCDateTime(GetValueAstext(JsonOrderToken, 'IN_HAND_DATE')));
        SalesHeader."ORB Lift Order" := true;
        SalesHeader.Modify(true);
    end;

    local procedure CreateSalesLines(var SalesHeader: Record "Sales Header"; jsonOrderObject: JsonObject)
    var
        SalesLine: Record "Sales Line";
        JsonOrderLineToken: JsonToken;
    begin
        JsonOrderLineToken := jsonOrderObject.AsToken();
        SalesLine.init();
        SalesLine."Document Type" := SalesHeader."Document Type";
        SalesLine."Document No." := SalesHeader."No.";

        SalesLine."Line No." := GetLastLineNo(SalesHeader);
        //SalesLine."Line No." := GetValueAsDecimal(JsonOrderLineToken, 'LINE_NUMBER');
        SalesLine.Insert(true);
        if GetValueAsText(JsonOrderLineToken, 'TYPE') = 'Comment' then
            SalesLine.Type := SalesLine.Type::" ";
        if GetValueAsText(JsonOrderLineToken, 'TYPE') = 'Item' then
            SalesLine.Type := SalesLine.Type::Item;
        if SalesLine.Type = SalesLine.Type::Item then begin
            if (GetValueAsCode(JsonOrderLineToken, 'VARIANT_CODE') <> '') then begin
                SalesLine.Validate(SalesLine."No.", GetValueAsCode(JsonOrderLineToken, 'VARIANT_CODE'));
                SalesLine.Validate(Quantity, GetValueAsDecimal(JsonOrderLineToken, 'QUANTITY'));
            end;
        end;
        SalesLine.Modify(true);

        InsertIntergationDataLog(Database::"Sales Header", 1, SalesLine."Document No.", SalesLine."Line No.");
    end;

    procedure InsertIntergationDataLog(SourceType: Integer; SourceSubType: Integer; SourceNo: Code[20]; SourceLineNo: Integer)
    var
        LIFTIntegrationDataLogRecLcl: Record "ORB LIFT Integration Data Log";
        EntryNoVarLcl: Integer;
    begin
        LIFTIntegrationDataLogRecLcl.Reset();
        //LIFTIntegrationDataLogRecLcl.SetCurrentKey("Source Type","Source Subtype","Source No.");
        if LIFTIntegrationDataLogRecLcl.FindLast() then
            EntryNoVarLcl := LIFTIntegrationDataLogRecLcl."Entry No." + 1
        else
            EntryNoVarLcl := 1;


        LIFTIntegrationDataLogRecLcl.Init();
        LIFTIntegrationDataLogRecLcl."Entry No." := EntryNoVarLcl;
        LIFTIntegrationDataLogRecLcl."Source Type" := SourceType;
        LIFTIntegrationDataLogRecLcl."Source Subtype" := SourceSubType;
        LIFTIntegrationDataLogRecLcl."Source No." := SourceNo;
        LIFTIntegrationDataLogRecLcl."Source Line No." := SourceLineNo;
        LIFTIntegrationDataLogRecLcl.Insert();

    end;

    procedure SelectJsonToken(JObject: JsonObject; Path: Text): Text
    var
        JToken: JsonToken;
    begin
        if JObject.SelectToken(Path, JToken) then
            if NOT JToken.AsValue().IsNull() then
                exit(JToken.AsValue().AsText());
    end;

    procedure SelectJsonTokenasDecimal(JObject: JsonObject; Path: Text): Decimal
    var
        JToken: JsonToken;
    begin
        if JObject.SelectToken(Path, JToken) then
            if NOT JToken.AsValue().IsNull() then
                exit(JToken.AsValue().AsDecimal());
    end;



    procedure GetValueAsText(JToken: JsonToken; ParamString: Text): Text
    var
        JObject: JsonObject;
    begin
        JObject := JToken.AsObject();
        exit(SelectJsonToken(JObject, ParamString));
    end;

    procedure GetValueAsDecimal(JToken: JsonToken; ParamString: Text): Decimal
    var
        JObject: JsonObject;
    begin
        JObject := JToken.AsObject();
        exit(SelectJsonTokenasDecimal(JObject, ParamString));
    end;

    procedure GetValueAsCode(JToken: JsonToken; ParamString: Text): Code[20]
    var
        JObject: JsonObject;
    begin
        JObject := JToken.AsObject();
        exit(SelectJsonToken(JObject, ParamString));
    end;


    local procedure EvaluateUTCDateTime(DataTimeText: Text) EvaluatedDateTime: DateTime;
    var
        TypeHelper: Codeunit "Type Helper";
        ValueTest: Variant;
    begin
        ValueTest := EvaluatedDateTime;
        IF TypeHelper.Evaluate(ValueTest, DataTimeText, '', TypeHelper.GetCultureName()) THEN
            EvaluatedDateTime := ValueTest;
    end;

    local procedure GetLastLineNo(SalesHeader: Record "Sales Header"): Integer
    var
        salesline: Record "Sales Line";
    begin
        salesline.SetRange("Document Type", SalesHeader."Document Type");
        salesline.SetRange("Document No.", SalesHeader."No.");
        if salesline.FindLast() then
            exit(salesline."Line No." + 10000);
        exit(10000);
    end;

    procedure ProcessRequest(APICode: Code[20]; ResponsePar: Text)
    var

    begin
        Case APICode of
            'SALESORDERS':
                SalesOrderDataRead(ResponsePar);
            'CUSTOMERS':
                SalesOrderDataRead(ResponsePar);
            'ITEMS':
                SalesOrderDataRead(ResponsePar);
        End;
    end;

    procedure SalesOrderDataRead(ResponsePar: text)
    var
        Salesheader: Record "Sales Header";
        JsonObject: JsonObject;
        JsonArray: JsonArray;
        JsonToken: JsonToken;
        JsonTokenLines: JsonToken;
        JsonObjectOrder: JsonObject;
        JsonArrayLines: JsonArray;
        JsonTokenLine: JsonToken;
        JsonOrderToken: JsonToken;
        i: Integer;
    begin
        if not JsonObject.ReadFrom(ResponsePar) then
            Error('Not valid Json');
        if not JsonObject.Get('rowset', JsonToken) then
            Error('Not Valid data');
        JsonArray := JsonToken.AsArray();
        for i := 0 to JsonArray.Count - 1 do begin
            JsonArray.Get(i, JsonToken);
            JsonObjectOrder := JsonToken.AsObject();
            CreateSalesOrder(Salesheader, JsonObjectOrder);
            JsonObjectOrder.Get('LINES', JsonTokenLines);
            JsonArrayLines := JsonTokenLines.AsArray();
            foreach jsontokenLine in JsonArrayLines do begin
                CreateSalesLines(Salesheader, JsonTokenLine.AsObject());
            end;
        end;
    end;
}
