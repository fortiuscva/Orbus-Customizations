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
        Client: HttpClient;
        Response: HttpResponseMessage;
        Content: HttpContent;
        Headers: HttpHeaders;
        Url: Text;
        ResultText: Text;
    begin
        LIFTERPSetupRecLcl.Get();

        DeletedSalesOrdersRecLcl.Reset();
        DeletedSalesOrdersRecLcl.SetRange("Exported to LIFT", false);
        if DeletedSalesOrdersRecLcl.FindSet() then
            repeat

                if EnvironmentInfoCU.IsSandbox() then
                    Url := StrSubstNo(LIFTERPSetupRecLcl."SO Status API - QA" +
                        'order_number=%1&line_number=%2', DeletedSalesOrdersRecLcl."Document No.", Format(DeletedSalesOrdersRecLcl."Line No."))
                else
                    Url := StrSubstNo(LIFTERPSetupRecLcl."SO Status API - Production" +
                        'order_number=%1&line_number=%2', DeletedSalesOrdersRecLcl."Document No.", Format(DeletedSalesOrdersRecLcl."Line No."));

                Content.WriteFrom('');
                Content.GetHeaders(Headers);
                Headers.Clear();
                Headers.Add('Content-Type', 'application/json');

                if Client.Put(Url, Content, Response) then begin
                    Response.Content.ReadAs(ResultText);

                    DeletedSalesOrdersRecLcl."Exported to LIFT" := true;
                    DeletedSalesOrdersRecLcl.Modify();
                end;
            until DeletedSalesOrdersRecLcl.Next() = 0;
    end;

}

