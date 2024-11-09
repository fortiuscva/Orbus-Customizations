codeunit 52610 "ORB LIFTSales OrderData"
{
    procedure GetSalesOrderDetails()
    var
        ClientVarLcl: HttpClient;
        contentVarLcl: HttpContent;
        HeaderVarLcl: HttpHeaders;
        RequestVarLcl: HttpRequestMessage;
        ResponseVarLcl: HttpResponseMessage;
        JtokenVarLcl: JsonToken;
        URLVarLcl: Text;
        RawTextVarLcl: Text;
        ResponseTextVarLcl: Text;
    begin

        URLVarLcl := 'https://orbus.lifterp.com/ords/lifterp/lift/erp/flush/ondemand/1422/Orders/N?offset=0&p1=O0000003';

        //contentVarLcl.WriteFrom(RawTextVarLcl);
        contentVarLcl.GetHeaders(HeaderVarLcl);
        HeaderVarLcl.Remove('Content-Type');
        HeaderVarLcl.Add('Content-Type', 'application/json');
        RequestVarLcl.Method := 'GET';
        RequestVarLcl.SetRequestUri(URLVarLcl);
        RequestVarLcl.Content(contentVarLcl);
        ClientVarLcl.Send(RequestVarLcl, ResponseVarLcl);
        ResponseVarLcl.Content().ReadAs(ResponseTextVarLcl);
        JtokenVarLcl.ReadFrom(ResponseTextVarLcl);
        if ResponseVarLcl.IsSuccessStatusCode then begin

        end else
            error('%1', ResponseVarLcl.ReasonPhrase);
    end;

    procedure ParseData()
    var
        Salesheader: Record "Sales Header";
        JsonResponse: text;
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
        if GetRequest(JsonResponse) then begin
            if not JsonObject.ReadFrom(JsonResponse) then
                Error('Not valid Json');
            if not JsonObject.Get('rowset', JsonToken) then
                Error('Not Valid data');
            JsonArray := JsonToken.AsArray();
            for i := 0 to JsonArray.Count - 1 do begin
                JsonArray.Get(i, JsonToken);
                JsonObjectOrder := JsonToken.AsObject();
                //JsonObjectOrder.Get('ORDER_NUMBER', JsonOrderToken);
                CreateSalesOrder(Salesheader, JsonObjectOrder);
                JsonObjectOrder.Get('LINES', JsonTokenLines);
                JsonArrayLines := JsonTokenLines.AsArray();
                foreach jsontokenLine in JsonArrayLines do begin
                    CreateSalesLines(Salesheader, JsonTokenLine.AsObject());
                end;
            end;
        end;
    end;

    procedure GetRequest(var Data: Text): Boolean
    var
        httpClient: HttpClient;
        httpResponseMessage: HttpResponseMessage;
        httpStatusCode: Integer;
        requestUri: Text;
    begin

        requestUri := 'https://orbus.lifterp.com/ords/lifterp/lift/erp/flush/ondemand/1422/Orders/N?offset=0&p1=O0000003';

        httpClient.Get(requestUri, httpResponseMessage);
        httpResponseMessage.Content().ReadAs(Data);
        httpStatusCode := httpResponseMessage.HttpStatusCode();
        if not httpResponseMessage.IsSuccessStatusCode() then
            Error('%1 - %2', httpStatusCode, Data);
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
            SalesLine.Validate(SalesLine."No.", GetValueAsCode(JsonOrderLineToken, 'VARIANT_CODE'));
            SalesLine.Validate(Quantity, GetValueAsDecimal(JsonOrderLineToken, 'QUANTITY'));
        end;
        SalesLine.Modify(true);
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

    var
        LineNo: Integer;
}
