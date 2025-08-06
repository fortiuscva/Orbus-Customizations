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
        WarehouseActivityHeader: Record "Warehouse Activity Header";
        WarehouseActivityHeaderTemp: Record "Warehouse Activity Header" temporary;
        SalesLineLcl: Record "Sales Line";
    begin
        IsOrderReleased := false;
        // Default "Qty. to Ship" with Outstanding Quantity for the Non-Blank Type Sales Order Lines
        SalesLineLcl.Reset();
        SalesLineLcl.SetRange("Document Type", SalesHeader."Document Type");
        SalesLineLcl.SetRange("Document No.", SalesHeader."No.");
        if SalesLineLcl.FindSet() then begin
            repeat
                if (SalesLineLcl.Type <> SalesLineLcl.Type::" ") then begin
                    SalesLineLcl.Validate("Qty. to Ship", SalesLineLcl."Outstanding Quantity");
                    SalesLineLcl.Modify();
                end;
            until SalesLineLcl.Next() = 0;
        end;
        Commit();
        if SalesHeader.Status = SalesHeader.Status::Open then begin
            SalesHeader.PerformManualRelease();
            IsOrderReleased := true;
        end;

        IsInventoryPickCreated := false;

        // Transfer Inventory Picks to the temporary table (temporary record).
        Clear(WarehouseActivityHeaderTemp);
        WarehouseActivityHeaderTemp.DeleteAll();
        WarehouseActivityHeader.Reset();
        WarehouseActivityHeader.SetRange(Type, WarehouseActivityHeader.Type::"Invt. Pick");
        WarehouseActivityHeader.SetRange("Source No.", SalesHeader."No.");
        if WarehouseActivityHeader.FindSet() then begin
            repeat
                WarehouseActivityHeaderTemp.Init();
                WarehouseActivityHeaderTemp.TransferFields(WarehouseActivityHeader);
                WarehouseActivityHeaderTemp.Insert();
            until WarehouseActivityHeader.Next() = 0;
        end;

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
        // if not WhseRequest.IsEmpty() then begin
        CreateInvtPutawayPickMvmt.InitializeRequest(false, true, false, false, false);
        CreateInvtPutawayPickMvmt.SuppressMessages(SuppressMessagesGbl);
        CreateInvtPutawayPickMvmt.SetTableView(WhseRequest);
        CreateInvtPutawayPickMvmt.UseRequestPage(UseRequestPageGbl);
        CreateInvtPutawayPickMvmt.Run();

        // Comparing Inventory Picks between temporary table and standard table
        WarehouseActivityHeader.Reset();
        WarehouseActivityHeader.SetRange(Type, WarehouseActivityHeaderTemp.Type::"Invt. Pick");
        WarehouseActivityHeader.SetRange("Source No.", SalesHeader."No.");
        if WarehouseActivityHeader.FindSet() then begin
            repeat
                if not WarehouseActivityHeaderTemp.Get(WarehouseActivityHeader.Type, WarehouseActivityHeader."No.") then
                    IsInventoryPickCreated := true;
            until WarehouseActivityHeader.Next() = 0;
        end;

        if IsInventoryPickCreated then begin
            SalesHeader.get(SalesHeader."Document Type", SalesHeader."No.");
            SalesHeader."Order Status" := SalesHeader."Order Status"::"Pick Released";
            SalesHeader.Modify();
        end
        else begin
            if IsOrderReleased then begin
                // SalesHeader.PerformManualReopen(SalesHeader);
                SalesHeader.get(SalesHeader."Document Type", SalesHeader."No.");
                SalesHeader.Validate(Status, SalesHeader.Status::Open);
                SalesHeader.Modify();
            end;
        end;
    end;

    procedure SetValuesToShowMessagesOrRequestPage(SuppressMessagesPar: Boolean; UseRequestPagePar: Boolean)
    begin
        Clear(SuppressMessagesGbl);
        Clear(UseRequestPageGbl);
        SuppressMessagesGbl := false;
        UseRequestPageGbl := false;
        SuppressMessagesGbl := SuppressMessagesPar;
        UseRequestPageGbl := UseRequestPagePar;
    end;

    var
        SuppressMessagesGbl: Boolean;
        UseRequestPageGbl: Boolean;
        IsInventoryPickCreated: Boolean;
        IsOrderReleased: Boolean;
}
