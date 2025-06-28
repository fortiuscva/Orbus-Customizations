codeunit 53411 "ORB LIFT Post Transactions"
{
    TableNo = "Sales Header";

    trigger OnRun()
    var
        LIFTCalcWhseAdjmt: Report "ORB LIFT Calculate Whse. Adj";
        ItemJnlRecLcl: Record "Item Journal Line";
        ItemNoLcl: Code[1024];
        SalesLineRecLcl: Record "Sales Line";
        ItemRecLcl: Record Item;
        ItemRecTempLcl: Record Item temporary;
        WarehouseEntryRecLcl: Record "Warehouse Entry";
        OrbusSingleInstanceCUGbl: Codeunit "ORB Orbus Single Instance";
        StopOnError: Boolean;
    begin
        StopOnError := OrbusSingleInstanceCUGbl.GetStopOnError();

        ClearLastError();
        if not Codeunit.Run(Codeunit::"ORB LIFT Read Inv.Transactions") then;

        Commit();


        ClearLastError();
        OrbusSingleInstanceCUGbl.SetSuppressWhseConfirm(true);
        if not Codeunit.Run(Codeunit::"ORB LIFT Post Inventory Jnl", rec) then
            if StopOnError then begin
                OrbusSingleInstanceCUGbl.SetSuppressWhseConfirm(false);
                Error(GetLastErrorText);
            end;
        OrbusSingleInstanceCUGbl.SetSuppressWhseConfirm(false);

        WarehouseEntryRecLcl.Reset();
        WarehouseEntryRecLcl.SetRange("Whse. Document No.", Rec."No.");
        if WarehouseEntryRecLcl.FindSet() then
            repeat
                ItemRecTempLcl.Reset();
                ItemRecTempLcl.SetRange("No.", WarehouseEntryRecLcl."Item No.");
                if not ItemRecTempLcl.FindFirst() then begin
                    ItemRecTempLcl.Init();
                    ItemRecTempLcl."No." := WarehouseEntryRecLcl."Item No.";
                    ItemRecTempLcl.Insert();
                end;
            until WarehouseEntryRecLcl.Next() = 0;

        ItemNoLcl := '';
        ItemRecTempLcl.Reset();
        if ItemRecTempLcl.FindSet then
            repeat
                if ItemNoLcl <> '' then
                    ItemNoLcl += '|' + ItemRecTempLcl."No."
                else
                    ItemNoLcl := ItemRecTempLcl."No.";
            until ItemRecTempLcl.Next() = 0;

        ItemRecLcl.Reset;
        ItemRecLcl.SetFilter("No.", ItemNoLcl);
        ItemRecLcl.SetFilter("Location Filter", Rec."Location Code");

        if ItemRecLcl.FindSet() then begin
            ItemJnlRecLcl.Init();
            ItemJnlRecLcl."Journal Template Name" := 'ITEM';
            ItemJnlRecLcl."Journal Batch Name" := 'LIFTERP';

            // LIFTCalcWhseAdjmt.SetItemJnlLine(ItemJnlRecLcl);
            // LIFTCalcWhseAdjmt.SetHideValidationDialog(true);
            // LIFTCalcWhseAdjmt.InitializeRequest(Today, Rec."No.");
            // LIFTCalcWhseAdjmt.SetTableView(ItemRecLcl);
            // LIFTCalcWhseAdjmt.UseRequestPage(false);
            // LIFTCalcWhseAdjmt.RunModal();
            // Clear(LIFTCalcWhseAdjmt);
            ClearLastError();
            if not RunWhseAdjutment(ItemJnlRecLcl, rec, ItemRecLcl) then
                if StopOnError then
                    Error(GetLastErrorText);

            ClearLastError();
            ItemJnlRecLcl.Reset();
            ItemJnlRecLcl.SetRange("Journal Template Name", 'ITEM');
            ItemJnlRecLcl.SetRange("Journal Batch Name", 'LIFTERP');
            ItemJnlRecLcl.SetRange("Document No.", Rec."No.");

            OrbusSingleInstanceCUGbl.SetSuppressItemJnlConfirm(true);
            if ItemJnlRecLcl.FindSet() then
                if not CODEUNIT.Run(CODEUNIT::"Item Jnl.-Post", ItemJnlRecLcl) then
                    if StopOnError then begin
                        OrbusSingleInstanceCUGbl.SetSuppressItemJnlConfirm(false);
                        Error(GetLastErrorText);
                    end;

            OrbusSingleInstanceCUGbl.SetSuppressItemJnlConfirm(false);
        end;
    end;

    [TryFunction]
    procedure RunWhseAdjutment(ItemJnlRec: Record "Item Journal Line"; SalesHeader: Record "Sales Header"; ItemRec: Record Item)
    var
        LIFTCalcWhseAdjmt: Report "ORB LIFT Calculate Whse. Adj";
    begin
        LIFTCalcWhseAdjmt.SetItemJnlLine(ItemJnlRec);
        LIFTCalcWhseAdjmt.SetHideValidationDialog(true);
        LIFTCalcWhseAdjmt.InitializeRequest(Today, SalesHeader."No.");
        LIFTCalcWhseAdjmt.SetTableView(ItemRec);
        LIFTCalcWhseAdjmt.UseRequestPage(false);
        LIFTCalcWhseAdjmt.RunModal();
        Clear(LIFTCalcWhseAdjmt);
    end;
}
