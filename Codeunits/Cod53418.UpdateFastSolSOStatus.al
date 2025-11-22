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
        ProdPrevRoutingLine: Record "Prod. Order Routing Line";
        AllLinesValid: Boolean;
        IsFastSolutionLine: Boolean;
    begin
        LIFTERPSetupRecLcl.Get();

        SalesHeaderRecLcl.Reset();
        if SalesHeaderRecLcl.FindSet() then
            repeat
                ProductionOrderRecLcl.Reset();
                ProductionOrderRecLcl.SetRange("Source Type", ProductionOrderRecLcl."Source Type"::"Sales Header");
                ProductionOrderRecLcl.SetRange("Source No.", SalesHeaderRecLcl."No.");
                ProductionOrderRecLcl.SetRange("ORB Fast Solutions", true);

                if ProductionOrderRecLcl.FindSet() then
                    repeat
                        AllLinesValid := true;

                        ProdOrderLineRecLcl.Reset();
                        ProdOrderLineRecLcl.SetRange("Prod. Order No.", ProductionOrderRecLcl."No.");
                        if ProdOrderLineRecLcl.FindSet() then
                            repeat
                                IsFastSolutionLine := ProdOrderLineRecLcl."ORB Fast Solutions";

                                if IsFastSolutionLine then begin
                                    ProdRoutingLineRecLcl.Reset();
                                    ProdRoutingLineRecLcl.SetRange(Status, ProdOrderLineRecLcl.Status);
                                    ProdRoutingLineRecLcl.SetRange("Prod. Order No.", ProdOrderLineRecLcl."Prod. Order No.");
                                    ProdOrderLineRecLcl.SetRange("Routing Reference No.", ProdOrderLineRecLcl."Line No.");
                                    ProdRoutingLineRecLcl.SetRange("Routing No.", ProdOrderLineRecLcl."Routing No.");
                                    ProdRoutingLineRecLcl.SetRange("ORB Fast Solutions", true);

                                    if ProdRoutingLineRecLcl.FindFirst() then begin
                                        ProdPrevRoutingLine.Reset();
                                        ProdPrevRoutingLine.SetRange(Status, ProdOrderLineRecLcl.Status);
                                        ProdPrevRoutingLine.SetRange("Prod. Order No.", ProdOrderLineRecLcl."Prod. Order No.");
                                        ProdPrevRoutingLine.SetRange("Routing Reference No.", ProdOrderLineRecLcl."Line No.");
                                        ProdPrevRoutingLine.SetRange("Routing No.", ProdOrderLineRecLcl."Routing No.");
                                        ProdPrevRoutingLine.SetFilter("Operation No.", '<%1', ProdRoutingLineRecLcl."Operation No.");

                                        if ProdPrevRoutingLine.FindLast() then begin
                                            if ProdPrevRoutingLine."Input Quantity" > ProdOrderLineRecLcl."Finished Quantity" then
                                                AllLinesValid := false;
                                        end else
                                            AllLinesValid := false;
                                    end;
                                end else begin
                                    if ProdOrderLineRecLcl."Quantity" > ProdOrderLineRecLcl."Finished Quantity" then
                                        AllLinesValid := false;
                                end;

                            until ProdOrderLineRecLcl.Next() = 0;

                        if AllLinesValid then begin

                            // Send status to LIFT
                        end;

                    until ProductionOrderRecLcl.Next() = 0;

            until SalesHeaderRecLcl.Next() = 0;
    end;

    procedure SendSOStatusUpdate(var SalesLinepar: Record "Sales Line"; IsSandbox: Boolean; UrlQA: Text; UrlProd: Text; Username: Text; Password: Text): Boolean
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
            Url := StrSubstNo(UrlQA + 'order_number=%1&line_number=%2', SalesLinepar."Document No.", Format(SalesLinepar."ORB LIFT Line ID"))
        else
            Url := StrSubstNo(UrlProd + 'order_number=%1&line_number=%2', SalesLinepar."Document No.", Format(SalesLinepar."ORB LIFT Line ID"));

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
