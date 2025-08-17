codeunit 52614 "ORB Create Inventory Pick"
{
    TableNo = "Sales Header";
    trigger OnRun()
    begin
        CreateInvtPutAwayPick(Rec);
    end;

    procedure CreateInvtPutAwayPick(SalesHeader: Record "Sales Header")
    var
        WhseRequest: Record "Warehouse Request";
        CreateInvtPutawayPickMvmt: Report "Create Invt Put-away/Pick/Mvmt";
    begin
        SalesHeader.PerformManualRelease();
        if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then
            if not SalesHeader.IsApprovedForPosting() then
                exit;

        SalesHeader.TestField(Status, SalesHeader.Status::Released);

        WhseRequest.Reset();
        WhseRequest.SetCurrentKey("Source Document", "Source No.");
        case SalesHeader."Document Type" of
            SalesHeader."Document Type"::Order:
                begin
                    if SalesHeader."Shipping Advice" = SalesHeader."Shipping Advice"::Complete then
                        SalesHeader.CheckShippingAdvice();
                    WhseRequest.SetRange("Source Document", WhseRequest."Source Document"::"Sales Order");
                end;
            SalesHeader."Document Type"::"Return Order":
                WhseRequest.SetRange("Source Document", WhseRequest."Source Document"::"Sales Return Order");
        end;
        WhseRequest.SetRange("Source No.", SalesHeader."No.");
        if not WhseRequest.IsEmpty() then begin
            CreateInvtPutawayPickMvmt.InitializeRequest(false, true, false, false, false);
            CreateInvtPutawayPickMvmt.SetTableView(WhseRequest);
            CreateInvtPutawayPickMvmt.UseRequestPage(false);
            CreateInvtPutawayPickMvmt.Run();

            SalesHeader.get(SalesHeader."Document Type", SalesHeader."No.");
            SalesHeader."Order Status" := SalesHeader."Order Status"::"Pick Released";
            SalesHeader.Modify();
        end;
    end;
}
