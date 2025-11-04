codeunit 53418 "ORB Update Fast Sol. SO Status"
{
    trigger OnRun()
    begin
        IntegrateSOFastSolutionStatus();
    end;

    procedure IntegrateSOFastSolutionStatus()
    var
        LIFTERPSetupRecLcl: Record "ORB LIFT ERP Setup";
        EnvironmentInfoCU: Codeunit "Environment Information";
        SalesHeaderRecLcl: Record "Sales Header";
        ProductionOrderRecLcl: Record "Production Order";
        ProdOrderLineRecLcl: Record "Prod. Order Line";
        ProdRoutingLineRecLcl: Record "Prod. Order Routing Line";
        AllLinesValid: Boolean;
        AllRoutingsValid: Boolean;
        IsSandbox: Boolean;
        AllAPIsSuccess: Boolean;
    begin
        LIFTERPSetupRecLcl.Get();
        IsSandbox := EnvironmentInfoCU.IsSandbox();

        SalesHeaderRecLcl.Reset();
        if SalesHeaderRecLcl.FindSet() then
            repeat
                ProductionOrderRecLcl.Reset();
                ProductionOrderRecLcl.SetRange("Source Type", ProductionOrderRecLcl."Source Type"::"Sales Header");
                ProductionOrderRecLcl.SetRange("Source No.", SalesHeaderRecLcl."No.");
                ProductionOrderRecLcl.SetRange("ORB Fast Solutions Sent", false);

                if ProductionOrderRecLcl.FindSet() then
                    repeat
                        AllLinesValid := true;
                        AllAPIsSuccess := true;

                        ProdOrderLineRecLcl.Reset();
                        ProdOrderLineRecLcl.SetRange("Prod. Order No.", ProductionOrderRecLcl."No.");

                        if ProdOrderLineRecLcl.FindSet() then
                            repeat
                                AllRoutingsValid := true;

                                ProdRoutingLineRecLcl.Reset();
                                ProdRoutingLineRecLcl.SetRange(Status, ProdOrderLineRecLcl.Status);
                                ProdRoutingLineRecLcl.SetRange("Prod. Order No.", ProdOrderLineRecLcl."Prod. Order No.");
                                ProdRoutingLineRecLcl.SetRange("Routing Reference No.", ProdOrderLineRecLcl."Line No.");
                                ProdRoutingLineRecLcl.SetRange("Routing No.", ProdOrderLineRecLcl."Routing No.");
                                ProdRoutingLineRecLcl.SetRange("ORB Fast Solutions", false);

                                if ProdRoutingLineRecLcl.FindSet() then
                                    repeat
                                        if ProdRoutingLineRecLcl."Input Quantity" >= ProdRoutingLineRecLcl."ORB Finished Quantity" then begin
                                            AllRoutingsValid := false;
                                            break;
                                        end;
                                    until ProdRoutingLineRecLcl.Next() = 0;

                                if not AllRoutingsValid then
                                    AllLinesValid := false;

                            until ProdOrderLineRecLcl.Next() = 0;

                        if AllLinesValid then begin
                            ProdOrderLineRecLcl.Reset();
                            ProdOrderLineRecLcl.SetRange("Prod. Order No.", ProductionOrderRecLcl."No.");
                            ProdOrderLineRecLcl.SetFilter("ORB Sales Order No.", '<>%1', '');

                            if ProdOrderLineRecLcl.FindSet() then
                                repeat
                                    if not SendSOStatusUpdateForProdLine(
                                        ProdOrderLineRecLcl,
                                        IsSandbox,
                                        LIFTERPSetupRecLcl."SO Status API - QA",
                                        LIFTERPSetupRecLcl."SO Status API - Production",
                                        LIFTERPSetupRecLcl."API Username",
                                        LIFTERPSetupRecLcl."API Password")
                                    then
                                        AllAPIsSuccess := false;
                                until ProdOrderLineRecLcl.Next() = 0;

                            if AllAPIsSuccess then begin
                                ProductionOrderRecLcl."ORB Fast Solutions Sent" := true;
                                ProductionOrderRecLcl.Modify();
                            end;
                        end;

                    until ProductionOrderRecLcl.Next() = 0;
            until SalesHeaderRecLcl.Next() = 0;
    end;

    procedure SendSOStatusUpdateForProdLine(
        var ProdOrderLine: Record "Prod. Order Line";
        IsSandbox: Boolean;
        UrlQA: Text;
        UrlProd: Text;
        Username: Text;
        Password: Text
    ): Boolean
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
        SalesLineRec: Record "Sales Line";
    begin
        if not SalesLineRec.Get(ProdOrderLine."ORB Sales Order No.", ProdOrderLine."ORB Sales Order Line No.") then
            exit(false);

        if IsSandbox then
            Url := StrSubstNo('%1order_number=%2&line_number=%3', UrlQA, SalesLineRec."Document No.", Format(SalesLineRec."ORB LIFT Line ID"))
        else
            Url := StrSubstNo('%1order_number=%2&line_number=%3', UrlProd, SalesLineRec."Document No.", Format(SalesLineRec."ORB LIFT Line ID"));

        Credentials := Username + ':' + Password;
        AuthHeader := 'Basic ' + Base64Convert.ToBase64(Credentials);

        Request.Method := 'PUT';
        Request.SetRequestUri(Url);
        Request.GetHeaders(Headers);
        Headers.Add('Authorization', AuthHeader);

        Client.Send(Request, Response);
        Response.Content.ReadAs(ResultText);

        exit(Response.HttpStatusCode = 200);
    end;
}
