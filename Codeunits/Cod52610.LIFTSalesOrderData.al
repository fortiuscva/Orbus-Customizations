codeunit 52610 "ORB LIFTSales OrderData"
{
    procedure GenerateAccessToken()
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
        RequestVarLcl.Method := 'POST';
        RequestVarLcl.SetRequestUri(URLVarLcl);
        RequestVarLcl.Content(contentVarLcl);
        ClientVarLcl.Send(RequestVarLcl, ResponseVarLcl);
        ResponseVarLcl.Content().ReadAs(ResponseTextVarLcl);
        JtokenVarLcl.ReadFrom(ResponseTextVarLcl);
        if ResponseVarLcl.IsSuccessStatusCode then begin

        end else
            error('%1', ResponseVarLcl.ReasonPhrase);
    end;
}
