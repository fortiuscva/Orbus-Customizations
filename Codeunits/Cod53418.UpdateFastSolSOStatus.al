codeunit 53418 "ORB Update Fast Sol. SO Status"
{
    TableNo = "Production Order";

    trigger OnRun()
    begin
        IntegrateSOFastSolutionStatus(Rec);
    end;

    procedure IntegrateSOFastSolutionStatus(var ProductionOrderRec: Record "Production Order")
    var
        LIFTERPSetupRecLcl: Record "ORB LIFT ERP Setup";
        EnvironmentInfoCU: Codeunit "Environment Information";

        ProdOrderLineRecLcl: Record "Prod. Order Line";
        ProdRoutingLineRecLcl: Record "Prod. Order Routing Line";
        SalesHdrRecLcl: Record "Sales Header";
        AllLinesValid: Boolean;
        AllRoutingsValid: Boolean;
        IsSandbox: Boolean;
        AllAPIsSuccess: Boolean;
    begin

        LIFTERPSetupRecLcl.Get();
        IsSandbox := EnvironmentInfoCU.IsSandbox();

        AllLinesValid := true;
        AllAPIsSuccess := true;

        ProdOrderLineRecLcl.Reset();
        ProdOrderLineRecLcl.SetRange("Prod. Order No.", ProductionOrderRec."No.");
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
                        ProdRoutingLineRecLcl.CalcFields("SFI Finished Quantity");
                        if ProdRoutingLineRecLcl."Input Quantity" > ProdRoutingLineRecLcl."SFI Finished Quantity" then begin
                            AllRoutingsValid := false;
                            break;
                        end;
                    until ProdRoutingLineRecLcl.Next() = 0;

                if not AllRoutingsValid then
                    AllLinesValid := false;

            until ProdOrderLineRecLcl.Next() = 0;

        if AllLinesValid then begin
            ProdOrderLineRecLcl.Reset();
            ProdOrderLineRecLcl.SetRange("Prod. Order No.", ProductionOrderRec."No.");
            ProdOrderLineRecLcl.SetFilter("ORB Sales Order No.", '<>%1', '');
            ProdOrderLineRecLcl.SetRange("Planning Level Code", 0);
            if ProdOrderLineRecLcl.FindSet() then
                repeat
                    if SalesHdrRecLcl.get(SalesHdrRecLcl."Document Type"::Order, ProdOrderLineRecLcl."ORB Sales Order No.") and SalesHdrRecLcl."ORB Lift Order" then begin
                        if not SendSOStatusUpdateForProdLine(
                            ProdOrderLineRecLcl,
                            IsSandbox,
                            LIFTERPSetupRecLcl."SO Status API - QA",
                            LIFTERPSetupRecLcl."SO Status API - Production",
                            LIFTERPSetupRecLcl."API Username",
                            LIFTERPSetupRecLcl."API Password")
                        then
                            AllAPIsSuccess := false;
                    end else
                        AllAPIsSuccess := false;

                until ProdOrderLineRecLcl.Next() = 0;

            if AllAPIsSuccess then begin
                ProductionOrderRec."ORB Fast Solutions Status Sent" := true;
                ProductionOrderRec.Modify();
            end;
        end;
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
        if not SalesLineRec.Get(SalesLineRec."Document Type"::Order, ProdOrderLine."ORB Sales Order No.", ProdOrderLine."ORB Sales Order Line No.") then
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
