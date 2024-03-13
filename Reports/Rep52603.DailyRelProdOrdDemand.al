report 52603 "Daily Rel. Prod. Ord. Demand"
{
    Caption = 'Daily Released Production Order Demand';
    ApplicationArea = all;
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem("Prod. Order Component"; "Prod. Order Component")
        {
            RequestFilterFields = "Prod. Order No.", "Prod. Order Line No.";
            DataItemTableView = where(Status = const(released));

            trigger OnPreDataItem()
            var
                ProdOrderNoVarLcl: Code[20];
                ProdOrderLineNoVarLcl: Integer;
                LineNoTextVarLcl: Text;
            begin
                ProdOrderNoVarLcl := GetFilter("Prod. Order No.");
                LineNoTextVarLcl := GetFilter("Prod. Order Line No.");
                if LineNoTextVarLcl <> '' then
                    Evaluate(ProdOrderLineNoVarLcl, LineNoTextVarLcl);

                ExportINBINComponents(ProdOrderNoVarLcl, ProdOrderLineNoVarLcl);
                CurrReport.Break();
            end;
        }


    }

    procedure ExportINBINComponents(ProdOrderNo: Code[20]; ProdOrderLineNo: Integer)
    var
        ProdOrderComponentsRecLcl: Record "Prod. Order Component";
        ProdOrderLineRecLcl: Record "Prod. Order Line";
        ReservationEntryRecLcl: Record "Reservation Entry";
        ReservationEntry2RecLcl: Record "Reservation Entry";
        ItemLedgerEntryRecLcl: Record "Item Ledger Entry";
        GroupProdOrderComponentsQueryLcl: Query "Group Prod Order Components";
        ItemRecLcl: Record Item;
        INBINQtyVarLcl: Decimal;
        ReviewQtyVarLcl: Decimal;
        ReservationQtyVarLcl: Decimal;
        ConsumptionVarLcl: Decimal;
    begin
        TempExcelBufferRecGbl.AddColumn('Bin Code', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
        TempExcelBufferRecGbl.AddColumn('Item No.', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
        TempExcelBufferRecGbl.AddColumn('Source No.', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
        TempExcelBufferRecGbl.AddColumn('Source Line No.', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
        TempExcelBufferRecGbl.AddColumn('Variant Code', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
        TempExcelBufferRecGbl.AddColumn('Unit of Measure Code', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
        TempExcelBufferRecGbl.AddColumn('Total (IN BIN  Qty)', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
        TempExcelBufferRecGbl.AddColumn('Requires Quantity Review', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
        TempExcelBufferRecGbl.NewRow();

        GroupProdOrderComponentsQueryLcl.SetRange(status, ProductionOrderStatusVarGbl::Released);
        if ProdOrderNo <> '' then
            GroupProdOrderComponentsQueryLcl.SetRange(FilterProd__Order_No_, ProdOrderNo);
        if ProdOrderLineNo <> 0 then
            GroupProdOrderComponentsQueryLcl.SetRange(FilterProd__Order_Line_No_, ProdOrderLineNo);
        GroupProdOrderComponentsQueryLcl.SetFilter(BinCode, '%1', '*IN*');
        GroupProdOrderComponentsQueryLcl.Open();
        while GroupProdOrderComponentsQueryLcl.Read() do begin
            if ItemRecLcl.get(GroupProdOrderComponentsQueryLcl.Item_No_) then;


            ProdOrderLineRecLcl.Reset();
            ProdOrderLineRecLcl.SetRange("Prod. Order No.", GroupProdOrderComponentsQueryLcl.Prod__Order_No_);
            ProdOrderLineRecLcl.SetFilter("Line No.", '>%1', GroupProdOrderComponentsQueryLcl.Prod__Order_Line_No_);
            ProdOrderLineRecLcl.SetRange("Item No.", GroupProdOrderComponentsQueryLcl.Item_No_);
            if ProdOrderLineRecLcl.FindFirst() then begin
                Clear(ReservationQtyVarLcl);
                Clear(ConsumptionVarLcl);
                ReservationEntryRecLcl.Reset();
                ReservationEntryRecLcl.SetRange("Source Type", Database::"Prod. Order Component");
                ReservationEntryRecLcl.SetRange("Source ID", GroupProdOrderComponentsQueryLcl.Prod__Order_No_);
                ReservationEntryRecLcl.SetRange("Source Prod. Order Line", GroupProdOrderComponentsQueryLcl.Prod__Order_Line_No_);
                ReservationEntryRecLcl.SetRange("Item No.", GroupProdOrderComponentsQueryLcl.Item_No_);
                ReservationEntryRecLcl.SetFilter("Source Ref. No.", '<>%1', 0);
                if ReservationEntryRecLcl.FindFirst() then begin
                    repeat
                        ReservationEntry2RecLcl.Reset();
                        ReservationEntry2RecLcl.SetRange("Entry No.", ReservationEntryRecLcl."Entry No.");
                        ReservationEntry2RecLcl.SetRange("Source Type", Database::"Item Ledger Entry");
                        if ReservationEntry2RecLcl.FindSet() then
                            ReservationEntry2RecLcl.CalcSums("Quantity (Base)");

                        ReservationQtyVarLcl += ReservationEntry2RecLcl."Quantity (Base)";

                        ItemLedgerEntryRecLcl.Reset();
                        ItemLedgerEntryRecLcl.SetRange("Entry Type", ItemLedgerEntryRecLcl."Entry Type"::Consumption);
                        ItemLedgerEntryRecLcl.SetRange("Order No.", GroupProdOrderComponentsQueryLcl.Prod__Order_No_);
                        ItemLedgerEntryRecLcl.SetRange("Order Line No.", GroupProdOrderComponentsQueryLcl.Prod__Order_Line_No_);
                        ItemLedgerEntryRecLcl.SetRange("Prod. Order Comp. Line No.", ReservationEntryRecLcl."Source Ref. No.");
                        if ItemLedgerEntryRecLcl.FindSet() then
                            ItemLedgerEntryRecLcl.CalcSums(Quantity);

                        ConsumptionVarLcl += ItemLedgerEntryRecLcl.Quantity;
                    until ReservationEntryRecLcl.Next() = 0;
                end;
                ReviewQtyVarLcl := ReservationQtyVarLcl - ConsumptionVarLcl;
            end else begin
                Clear(INBINQtyVarLcl);

                Clear(ReviewQtyVarLcl);
                ProdOrderComponentsRecLcl.Reset();
                ProdOrderComponentsRecLcl.SetCurrentKey("Prod. Order No.", "Prod. Order Line No.", "Item No.", "Bin Code", "Variant Code");
                ProdOrderComponentsRecLcl.SetRange("Prod. Order No.", GroupProdOrderComponentsQueryLcl.Prod__Order_No_);
                ProdOrderComponentsRecLcl.SetRange("Prod. Order Line No.", GroupProdOrderComponentsQueryLcl.Prod__Order_Line_No_);
                ProdOrderComponentsRecLcl.SetRange("Item No.", GroupProdOrderComponentsQueryLcl.Item_No_);
                ProdOrderComponentsRecLcl.SetRange("Bin Code", GroupProdOrderComponentsQueryLcl.Bin_Code);
                ProdOrderComponentsRecLcl.SetRange("Variant Code", GroupProdOrderComponentsQueryLcl.Variant_Code);
                if ProdOrderComponentsRecLcl.FindSet() then
                    repeat
                        //INBINQtyVarLcl += ORBFunctionsCUGbl.CalcINBINQty(ProdOrderComponentsRecLcl);
                        ReviewQtyVarLcl += ORBFunctionsCUGbl.CalcReviewRequiredQty(ProdOrderComponentsRecLcl);
                    until ProdOrderComponentsRecLcl.Next() = 0;

            end;

            TempExcelBufferRecGbl.AddColumn(GroupProdOrderComponentsQueryLcl.Bin_Code, false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
            TempExcelBufferRecGbl.AddColumn(GroupProdOrderComponentsQueryLcl.Item_No_, false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
            TempExcelBufferRecGbl.AddColumn(GroupProdOrderComponentsQueryLcl.Prod__Order_No_, false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
            TempExcelBufferRecGbl.AddColumn(GroupProdOrderComponentsQueryLcl.Prod__Order_Line_No_, false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
            TempExcelBufferRecGbl.AddColumn(GroupProdOrderComponentsQueryLcl.Variant_Code, false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
            TempExcelBufferRecGbl.AddColumn(ItemRecLcl."Base Unit of Measure", false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);

            TempExcelBufferRecGbl.AddColumn(Format(ReviewQtyVarLcl), false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Number);

            if ReviewQtyVarLcl < 0 then
                TempExcelBufferRecGbl.AddColumn('Y', false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text)
            else
                TempExcelBufferRecGbl.AddColumn('', false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
            TempExcelBufferRecGbl.NewRow();

        end;

        TempExcelBufferRecGbl.CreateNewBook('INBIN Entries');
        TempExcelBufferRecGbl.WriteSheet('INBIN Entries', CompanyName, UserId);
        TempExcelBufferRecGbl.CloseBook();

        TempExcelBufferRecGbl.SetFriendlyFilename('Prod Order Components');
        TempExcelBufferRecGbl.OpenExcel();
    end;

    var
        TempExcelBufferRecGbl: Record "Excel Buffer" temporary;
        ORBFunctionsCUGbl: Codeunit "ORB Functions";
        ProductionOrderStatusVarGbl: Enum "Production Order Status";
}
