codeunit 53410 "ORB LIFT Calculate Whse. Adj."
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
    begin
        if ItemJnlTemplateNameGbl = '' then
            ItemJnlTemplateNameGbl := 'ITEM';

        if ItemJnlBatchNameGbl = '' then
            ItemJnlBatchNameGbl := 'LIFTERP';



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
            ItemJnlRecLcl.Reset();
            ItemJnlRecLcl.SetRange("Journal Template Name", ItemJnlTemplateNameGbl);
            ItemJnlRecLcl.SetRange("Journal Batch Name", ItemJnlBatchNameGbl);
            ItemJnlRecLcl.SetRange("Document No.", Rec."No.");
            ItemJnlRecLcl.DeleteAll(true);

            ItemJnlRecLcl.Init();
            ItemJnlRecLcl."Journal Template Name" := ItemJnlTemplateNameGbl;
            ItemJnlRecLcl."Journal Batch Name" := ItemJnlBatchNameGbl;

            LIFTCalcWhseAdjmt.SetItemJnlLine(ItemJnlRecLcl);
            LIFTCalcWhseAdjmt.SetHideValidationDialog(true);
            LIFTCalcWhseAdjmt.InitializeRequest(Today, Rec."No.");
            LIFTCalcWhseAdjmt.SetTableView(ItemRecLcl);
            LIFTCalcWhseAdjmt.UseRequestPage(false);
            LIFTCalcWhseAdjmt.RunModal();
            Clear(LIFTCalcWhseAdjmt);
        end;
    end;

    procedure InitializeRequest(JournalTemplateNamePar: Code[10]; JournalBatchNamePar: Code[10])
    begin
        ItemJnlTemplateNameGbl := JournalTemplateNamePar;
        ItemJnlBatchNameGbl := JournalBatchNamePar;
    end;

    var
        ItemJnlTemplateNameGbl: Code[10];
        ItemJnlBatchNameGbl: Code[10];
}
