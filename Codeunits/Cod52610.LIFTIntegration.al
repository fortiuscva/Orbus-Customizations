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
        if SalesHeader.Insert(true) then begin
            SalesHeader.Validate("Sell-to Customer No.", GetValueAsCode(JsonOrderToken, 'SELL_TO_CUSTOMER'));
            SalesHeader.Validate("Bill-to Customer No.", GetValueAsCode(JsonOrderToken, 'BILL_TO_CUSTOMER'));
            SalesHeader.Validate("Ship-to Code", GetValueAsText(JsonOrderToken, 'SHIP_TO_CODE'));
            SalesHeader.Validate("Order Date", DT2Date(EvaluateUTCDateTime(GetValueAstext(JsonOrderToken, 'ORDER_DATE'))));
            SalesHeader.Validate("Posting Date", DT2Date(EvaluateUTCDateTime(GetValueAstext(JsonOrderToken, 'POSTING_DATE'))));
            SalesHeader.Validate("Document Date", DT2Date(EvaluateUTCDateTime(GetValueAstext(JsonOrderToken, 'SHIPMENT_DATE'))));
            SalesHeader.Validate("Due Date", DT2Date(EvaluateUTCDateTime(GetValueAstext(JsonOrderToken, 'DUE_DATE'))));
            SalesHeader.Validate("Location Code", GetValueAsCode(JsonOrderToken, 'LOCATION_CODE'));
            SalesHeader.Validate("Salesperson Code", GetValueAsCode(JsonOrderToken, 'SALESPERSON_CODE'));
            SalesHeader.Validate("Document Date", DT2Date(EvaluateUTCDateTime(GetValueAstext(JsonOrderToken, 'DOCUMENT_DATE'))));
            SalesHeader.Validate("External Document No.", GetValueAsText(JsonOrderToken, 'EXTERNAL_DOCUMENT_NUMBER'));
            SalesHeader.Validate("Payment Method Code", GetValueAsText(JsonOrderToken, 'PAYMENT_METHOD_CODE'));
            //SalesHeader.Validate("Order Status", GetValueAsCode(JsonOrderToken, 'ORDER_STATUS'));
            SalesHeader.Validate("ORB Declared Value", GetValueAsText(JsonOrderToken, 'DECLARED_VALUE'));
            SalesHeader.Validate("ORB International Contact", GetValueAsText(JsonOrderToken, 'INTERNATIONAL_CONTACT'));
            SalesHeader.Validate("ORB Magento Order #", GetValueAsText(JsonOrderToken, 'MAGENTO_ORDER_NUMBER'));
            SalesHeader.Validate(Rush, GetValueAsBoolean(JsonOrderToken, 'RUSH'));
            SalesHeader."In-Hands Date" := DT2Date(EvaluateUTCDateTime(GetValueAstext(JsonOrderToken, 'IN_HAND_DATE')));
            SalesHeader.Validate("Shipping Agent Code", GetValueAsCode(JsonOrderToken, 'SHIPPING_AGENT_CODE'));
            SalesHeader.Validate("Shipping Agent Service Code", GetValueAsCode(JsonOrderToken, 'SHIPPING_AGENT_SERVICE_CODE'));
            SalesHeader.Validate("Shortcut Dimension 1 Code", GetValueAsCode(JsonOrderToken, 'SHORTCUT_DIMENSION_1_CODE'));
            SalesHeader.Validate("Shortcut Dimension 2 Code", GetValueAsCode(JsonOrderToken, 'SHORTCUT_DIMENSION_2_CODE'));
            SalesHeader.Validate("Ship-to Name", GetValueAsText(JsonOrderToken, 'LOCATION_NAME'));
            SalesHeader.Validate("Ship-to Address", GetValueAsText(JsonOrderToken, 'ADDRESS_LINE1'));
            SalesHeader.Validate("Ship-to Address 2", GetValueAsText(JsonOrderToken, 'ADDRESS_LINE2'));
            SalesHeader.Validate("Ship-to City", GetValueAsText(JsonOrderToken, 'CITY'));
            SalesHeader.Validate("Ship-to County", GetValueAsText(JsonOrderToken, 'STATE'));
            SalesHeader.Validate("Ship-to Post Code", GetValueAsCode(JsonOrderToken, 'ZIP'));
            SalesHeader.Validate("Shipment Date", DT2Date(EvaluateUTCDateTime(GetValueAsText(JsonOrderToken, 'SHIP_DATE'))));
            SalesHeader.Validate("Ship-to Contact", GetValueAsText(JsonOrderToken, 'ATTENTION_TO'));

            SalesHeader."ORB Lift Order" := true;
            SalesHeader.Modify(true);
        end;
    end;

    local procedure CreateSalesLines(var SalesHeader: Record "Sales Header"; jsonOrderObject: JsonObject)
    var
        SalesLine: Record "Sales Line";
        ItemRec: Record Item;
        JsonOrderLineToken: JsonToken;
    begin
        JsonOrderLineToken := jsonOrderObject.AsToken();
        if ItemRec.get(GetValueAsCode(JsonOrderLineToken, 'VARIANT_CODE')) then begin
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
                    SalesLine.Validate("Unit of Measure Code", GetValueAsText(JsonOrderLineToken, 'UNIT_OF_MEASURE_CODE'));
                    SalesLine.Validate("Unit Price", GetValueAsDecimal(JsonOrderLineToken, 'UNIT_PRICE'));
                    SalesLine.Validate("Height", GetValueAsDecimal(JsonOrderLineToken, 'HEIGHT'));
                    SalesLine.Validate("Width", GetValueAsDecimal(JsonOrderLineToken, 'WIDTH'));
                    //SalesLine.Validate("Shortcut Dimension 1 Code", SalesHeader."Shortcut Dimension 1 Code");
                    if GetValueAsCode(JsonOrderLineToken, 'SHORTCUT_DIMENSION_2_CODE') <> '' then
                        SalesLine.Validate("Shortcut Dimension 2 Code", GetValueAsCode(JsonOrderLineToken, 'SHORTCUT_DIMENSION_2_CODE'));
                    SalesLine.Validate("Requested Delivery Date", DT2Date(EvaluateUTCDateTime(GetValueAstext(JsonOrderLineToken, 'REQUESTED_DELIVERY_DATE'))));
                    SalesLine.Validate("Planned Delivery Date", DT2Date(EvaluateUTCDateTime(GetValueAstext(JsonOrderLineToken, 'PLANNED_DELIVERY_DATE'))));
                    SalesLine.Validate("Planned Shipment Date", DT2Date(EvaluateUTCDateTime(GetValueAstext(JsonOrderLineToken, 'PLANNED_SHIP_DATE'))));
                    SalesLine.Validate("Shipment Date", DT2Date(EvaluateUTCDateTime(GetValueAstext(JsonOrderLineToken, 'SHIPMENT_DATE'))));


                end;
            end;
            SalesLine.Modify(true);

            InsertIntergationDataLog(Database::"Sales Header", 1, SalesLine."Document No.", SalesLine."Line No.");
            Commit();
        end;
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
        LIFTIntegrationDataLogRecLcl."Transaction ID" := SourceLineNo;
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

    procedure SelectJsonTokenasInteger(JObject: JsonObject; Path: Text): Decimal
    var
        JToken: JsonToken;
    begin
        if JObject.SelectToken(Path, JToken) then
            if NOT JToken.AsValue().IsNull() then
                exit(JToken.AsValue().AsInteger());
    end;

    procedure SelectJsonTokenasBoolean(JObject: JsonObject; Path: Text): Boolean
    var
        JToken: JsonToken;
    begin
        if JObject.SelectToken(Path, JToken) then
            if NOT JToken.AsValue().IsNull() then
                exit(JToken.AsValue().AsBoolean());
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

    procedure GetValueAsInteger(JToken: JsonToken; ParamString: Text): Integer
    var
        JObject: JsonObject;
    begin
        JObject := JToken.AsObject();
        exit(SelectJsonTokenasInteger(JObject, ParamString));
    end;

    procedure GetValueAsBoolean(JToken: JsonToken; ParamString: Text): Boolean
    var
        JObject: JsonObject;
    begin
        JObject := JToken.AsObject();
        exit(SelectJsonTokenasBoolean(JObject, ParamString));
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
                CustomerDataRead(ResponsePar);
            'INVENTORYJOURNALS':
                InventoryJournalDataRead(ResponsePar);
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
        if JsonToken.IsArray then
            JsonArray := JsonToken.AsArray
        else if JsonToken.IsObject then
            Error('The token is an object, not an array.')
        else if JsonToken.IsValue then
            if JsonToken.AsValue.IsNull then
                Error('No Records')
            else
                Error('Unexpected value type in the response.')
        else
            Error('Unsupported JSON token type.');
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

    procedure CustomerDataRead(ResponsePar: text)
    var
        CustomerRecLcl: Record Customer;
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
        if JsonToken.IsArray then
            JsonArray := JsonToken.AsArray
        else if JsonToken.IsObject then
            Error('The token is an object, not an array.')
        else if JsonToken.IsValue then
            if JsonToken.AsValue.IsNull then
                Error('No Records')
            else
                Error('Unexpected value type in the response.')
        else
            Error('Unsupported JSON token type.');
        for i := 0 to JsonArray.Count - 1 do begin
            JsonArray.Get(i, JsonToken);
            JsonObjectOrder := JsonToken.AsObject();
            CreateCustomer(CustomerRecLcl, JsonObjectOrder);
        end;
    end;

    local procedure CreateCustomer(var Customer: Record Customer; jsonOrderObject: JsonObject)
    var
        JsonOrderToken: JsonToken;
    begin
        JsonOrderToken := jsonOrderObject.AsToken();
        Customer.Init();
        Customer."No." := GetValueAsCode(JsonOrderToken, 'CustomerNumber');
        Customer.Name := GetValueAsText(JsonOrderToken, 'CustomerName');
        Customer."Credit Limit (LCY)" := GetValueAsDecimal(JsonOrderToken, 'CreditLimit');
        Customer."Phone No." := GetValueAsText(JsonOrderToken, 'PhoneNumber');

        Customer."ORB LIFT Customer" := true;
        if Customer.Insert() then
            InsertIntergationDataLog(Database::Customer, 0, Customer."No.", 0);
    end;

    procedure InventoryJournalDataRead(ResponsePar: text)
    var
        WarehouseJournalLine: Record "Warehouse Journal Line";
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
        if JsonToken.IsArray then
            JsonArray := JsonToken.AsArray
        else if JsonToken.IsObject then
            Error('The token is an object, not an array.')
        else if JsonToken.IsValue then
            if JsonToken.AsValue.IsNull then
                Error('No Records')
            else
                Error('Unexpected value type in the response.')
        else
            Error('Unsupported JSON token type.');
        for i := 0 to JsonArray.Count - 1 do begin
            JsonArray.Get(i, JsonToken);
            JsonObjectOrder := JsonToken.AsObject();
            CreateInventoryJournal(WarehouseJournalLine, JsonObjectOrder);
        end;
    end;

    procedure CreateInventoryJournal(var WarehouseJournalLine: Record "Warehouse Journal Line"; jsonOrderObject: JsonObject)
    var
        WhseJnlTemplate: Record "Warehouse Journal Template";
        EntryNo: Integer;
        JsonOrderToken: JsonToken;
        EntryTypeVarLcl: Text;
    begin
        Clear(EntryNo);
        WarehouseJournalLine.Reset();
        WarehouseJournalLine.SetRange("Journal Template Name", 'ITEM');
        WarehouseJournalLine.SetRange("Journal Batch Name", 'LIFTERP');
        if WarehouseJournalLine.FindLast() then
            EntryNo := WarehouseJournalLine."Line No." + 10000
        else
            EntryNo := 10000;

        JsonOrderToken := jsonOrderObject.AsToken();
        WarehouseJournalLine.Init();
        WarehouseJournalLine."Journal Template Name" := 'ITEM';
        WarehouseJournalLine."Journal Batch Name" := 'LIFTERP';
        WarehouseJournalLine.Validate("Location Code", GetValueAsCode(JsonOrderToken, 'LOCATION_CODE'));
        WarehouseJournalLine."Line No." := EntryNo;
        WarehouseJournalLine.Insert(true);

        WhseJnlTemplate.Get(WarehouseJournalLine."Journal Template Name");
        WarehouseJournalLine."Source Code" := WhseJnlTemplate."Source Code";
        if WhseJnlTemplate.Type <> WhseJnlTemplate.Type::Reclassification then begin
            if WarehouseJournalLine.Quantity >= 0 then
                WarehouseJournalLine."Entry Type" := WarehouseJournalLine."Entry Type"::"Positive Adjmt."
            else
                WarehouseJournalLine."Entry Type" := WarehouseJournalLine."Entry Type"::"Negative Adjmt.";
            WarehouseJournalLine.SetUpAdjustmentBin();
        end;
        EntryTypeVarLcl := GetValueAsText(JsonOrderToken, 'ENTRY_TYPE');
        WarehouseJournalLine.Validate("Registering Date", DT2Date(EvaluateUTCDateTime(GetValueAstext(JsonOrderToken, 'POSTING_DATE'))));
        IF EntryTypeVarLcl = 'NEGATIVE' then
            WarehouseJournalLine.Validate("Entry Type", WarehouseJournalLine."Entry Type"::"Negative Adjmt.")
        ELSE
            WarehouseJournalLine.Validate("Entry Type", WarehouseJournalLine."Entry Type"::"Positive Adjmt.");
        // WarehouseJournalLine.Validate("Location Code", GetValueAsCode(JsonOrderToken, 'LOCATION_CODE'));
        WarehouseJournalLine.Validate("Bin Code", 'WR-LIFT');
        WarehouseJournalLine.Validate("Item No.", GetValueAsText(JsonOrderToken, 'MATERIAL_BARCODE'));
        WarehouseJournalLine.Validate("Whse. Document No.", GetValueAsText(JsonOrderToken, 'DOCUMENT_NUMBER'));
        WarehouseJournalLine.Validate(Quantity, GetValueAsDecimal(JsonOrderToken, 'QUANTITY'));
        //WarehouseJournalLine.Validate("Unit Cost", GetValueAsDecimal(JsonOrderToken, 'UNIT_COST'));
        //WarehouseJournalLine.Validate(Amount, GetValueAsDecimal(JsonOrderToken, 'AMOUNT'));
        //WarehouseJournalLine.Validate("Unit Cost", GetUnitCost(WarehouseJournalLine."Location Code", WarehouseJournalLine."Item No.", WarehouseJournalLine."Variant Code"));
        WarehouseJournalLine.Validate("Unit of Measure Code", GetValueAsCode(JsonOrderToken, 'UNIT_OF_MEASURE'));
        WarehouseJournalLine."ORB LIFT Inv. Transaction ID" := GetValueAsInteger(JsonOrderToken, 'INVENTORY_TRANSACTION_ID');
        WarehouseJournalLine."ORB LIFT Order Line ID" := GetValueAsInteger(JsonOrderToken, 'ORDER_LINE_ID');
        WarehouseJournalLine."Source Code" := 'WHITEM';
        WarehouseJournalLine.SetUpAdjustmentBin();
        WarehouseJournalLine.Modify(true);

        InsertIntergationDataLog(Database::"Warehouse Journal Line", 0, WarehouseJournalLine."Item No.", WarehouseJournalLine."ORB LIFT Inv. Transaction ID");
    end;

    procedure GetUnitCost(LocationCode: Code[10]; ItemNo: Code[20]; VariantCode: Code[10]): Decimal;
    var
        Item: Record Item;
        StockKeepingUnit: Record "Stockkeeping Unit";
    begin
        if Item.Get(ItemNo) then begin
            if StockKeepingUnit.Get(LocationCode, ItemNo, VariantCode) then
                exit(StockKeepingUnit."Unit Cost");
            exit(Item."Unit Cost");
        end;
        exit(0);
    end;
}
