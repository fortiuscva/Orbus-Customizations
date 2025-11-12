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
        SalesHeaderRecLcl: Record "Sales Header";
        SalesInvHdrRecLcl: Record "Sales Invoice Header";
    begin
        LIFTERPSetupRecLcl.Get();

        // Update Shipped Status
        DeletedSalesOrdersRecLcl.Reset();
        DeletedSalesOrdersRecLcl.SetRange("Shipped Send to LIFT", false);
        if DeletedSalesOrdersRecLcl.FindSet() then
            repeat
                if SendSOStatusUpdate(DeletedSalesOrdersRecLcl, EnvironmentInfoCU.IsSandbox(),
                    LIFTERPSetupRecLcl."SO Status API - QA", LIFTERPSetupRecLcl."SO Status API - Production",
                    LIFTERPSetupRecLcl."API Username", LIFTERPSetupRecLcl."API Password") then begin
                    DeletedSalesOrdersRecLcl."Shipped Send to LIFT" := true;
                end;
                DeletedSalesOrdersRecLcl.Modify();
            until DeletedSalesOrdersRecLcl.Next() = 0;

        // Update Invoice Status
        DeletedSalesOrdersRecLcl.Reset();
        DeletedSalesOrdersRecLcl.SetRange("Invoice Send to LIFT", false);
        if DeletedSalesOrdersRecLcl.FindSet() then
            repeat
                if not SalesHeaderRecLcl.Get(DeletedSalesOrdersRecLcl."Document Type", DeletedSalesOrdersRecLcl."Document No.") then begin

                    SalesInvHdrRecLcl.Reset();
                    SalesInvHdrRecLcl.SetRange("Order No.", DeletedSalesOrdersRecLcl."Document No.");
                    if SalesInvHdrRecLcl.FindFirst() then begin
                        if SendSOStatusUpdate(DeletedSalesOrdersRecLcl, EnvironmentInfoCU.IsSandbox(),
                            LIFTERPSetupRecLcl."SO Status API - QA", LIFTERPSetupRecLcl."SO Status API - Production",
                            LIFTERPSetupRecLcl."API Username", LIFTERPSetupRecLcl."API Password") then begin
                            DeletedSalesOrdersRecLcl."Invoice Send to LIFT" := true;
                        end;
                        DeletedSalesOrdersRecLcl.Modify();
                    end;
                end;
            until DeletedSalesOrdersRecLcl.Next() = 0;
    end;

    procedure SendSOStatusUpdate(var DeletedSalesOrdersRecLcl: Record "ORB LIFT Deleted Sales Orders"; IsSandbox: Boolean; UrlQA: Text; UrlProd: Text; Username: Text; Password: Text): Boolean
    var
        Client: HttpClient;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        Headers: HttpHeaders;
        Url: Text;
        ResultText: Text;
        AuthHeader: Text;
        Credentials: Text;
        Base64Convert: Codeunit "Base64 Convert";
    begin
        if IsSandbox then
            Url := StrSubstNo(UrlQA + 'order_number=%1&line_number=%2', DeletedSalesOrdersRecLcl."Document No.", Format(DeletedSalesOrdersRecLcl."LIFT Line No."))
        else
            Url := StrSubstNo(UrlProd + 'order_number=%1&line_number=%2', DeletedSalesOrdersRecLcl."Document No.", Format(DeletedSalesOrdersRecLcl."LIFT Line No."));

        Credentials := Username + ':' + Password;
        AuthHeader := 'Basic ' + Base64Convert.ToBase64(Credentials);

        Request.Method := 'PUT';
        Request.SetRequestUri(Url);
        Request.GetHeaders(Headers);
        Headers.Add('Authorization', AuthHeader);

        Client.Send(Request, Response);
        Response.Content.ReadAs(ResultText);

        DeletedSalesOrdersRecLcl."API Result" := CopyStr(ResultText, 1, 1024);

        exit(Response.HttpStatusCode = 200);
    end;
}