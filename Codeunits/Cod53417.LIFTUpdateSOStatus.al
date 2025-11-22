codeunit 53417 "ORB LIFT Update SO Status"
{

    trigger OnRun()
    begin
        IntegrateSOShipAndInvoiceStatus();
    end;

    procedure IntegrateSOShipAndInvoiceStatus()
    var
        DeletedSalesOrdersRecLcl: Record "ORB LIFT Deleted Sales Orders";
        LIFTERPSetupRecLcl: Record "ORB LIFT ERP Setup";
        EnvironmentInfoCU: Codeunit "Environment Information";
        Base64Convert: Codeunit "Base64 Convert";
        Client: HttpClient;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        Headers: HttpHeaders;
        Url: Text;
        ResultText: Text;
        AuthHeader: Text;
        Credentials: Text;
    begin
        LIFTERPSetupRecLcl.Get();

        DeletedSalesOrdersRecLcl.Reset();
        DeletedSalesOrdersRecLcl.SetRange("Exported to LIFT", false);

        if DeletedSalesOrdersRecLcl.FindSet() then
            repeat
                if EnvironmentInfoCU.IsSandbox() then
                    Url := StrSubstNo(LIFTERPSetupRecLcl."SO Status API - QA" +
                        'order_number=%1&line_number=%2', DeletedSalesOrdersRecLcl."Document No.", Format(DeletedSalesOrdersRecLcl."LIFT Line No."))
                else
                    Url := StrSubstNo(LIFTERPSetupRecLcl."SO Status API - Production" +
                        'order_number=%1&line_number=%2', DeletedSalesOrdersRecLcl."Document No.", Format(DeletedSalesOrdersRecLcl."LIFT Line No."));

                Credentials := LIFTERPSetupRecLcl."API Username" + ':' + LIFTERPSetupRecLcl."API Password";
                AuthHeader := 'Basic ' + Base64Convert.ToBase64(Credentials);

                Request.Method := 'PUT';
                Request.SetRequestUri(Url);
                Request.GetHeaders(Headers);
                Headers.Add('Authorization', AuthHeader);

                Client.Send(Request, Response);
                Response.Content.ReadAs(ResultText);

                if Response.HttpStatusCode = 200 then
                    DeletedSalesOrdersRecLcl."Exported to LIFT" := true;

                DeletedSalesOrdersRecLcl."API Result" := CopyStr(ResultText, 1, 1024);
                DeletedSalesOrdersRecLcl.Modify();

            until DeletedSalesOrdersRecLcl.Next() = 0;
    end;

}

