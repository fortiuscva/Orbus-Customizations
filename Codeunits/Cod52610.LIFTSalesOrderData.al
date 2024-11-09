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
                JsonObjectOrder.Get('ORDER_NUMBER', JsonOrderToken);
                Message(Format(JsonOrderToken));
                JsonObjectOrder.Get('LINES', JsonTokenLines);
                JsonArrayLines := JsonTokenLines.AsArray();
                foreach jsontokenLine in JsonArrayLines do begin
                    Message(Format(JsonTokenLine));
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


}
