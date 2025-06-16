codeunit 53410 "ORB LIFT Whse Adjmt Processor"
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
    begin
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

            LIFTCalcWhseAdjmt.SetItemJnlLine(ItemJnlRecLcl);
            LIFTCalcWhseAdjmt.SetHideValidationDialog(true);
            LIFTCalcWhseAdjmt.InitializeRequest(Today, Rec."No.");
            LIFTCalcWhseAdjmt.SetTableView(ItemRecLcl);
            LIFTCalcWhseAdjmt.UseRequestPage(false);
            LIFTCalcWhseAdjmt.RunModal();
            Clear(LIFTCalcWhseAdjmt);
        end;

        ItemJnlRecLcl.Reset();
        ItemJnlRecLcl.SetRange("Journal Template Name", 'ITEM');
        ItemJnlRecLcl.SetRange("Journal Batch Name", 'LIFTERP');
        ItemJnlRecLcl.SetRange("Document No.", Rec."No.");

        if ItemJnlRecLcl.FindSet() then
            CODEUNIT.Run(CODEUNIT::"Item Jnl.-Post", ItemJnlRecLcl)
    end;
}
