codeunit 52607 "Export INBIN ProdComponents"
{


    procedure ExportINBINComponents()
    var
        ProdOrderComponentsRecLcl: Record "Prod. Order Component";
        GroupProdOrderComponentsQueryLcl: Query "Group Prod Order Components";
        ItemRecLcl: Record Item;
        INBINQtyVarLcl: Decimal;
        ReviewQtyVarLcl: Decimal;
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

        GroupProdOrderComponentsQueryLcl.Open();
        while GroupProdOrderComponentsQueryLcl.Read() do begin
            ItemRecLcl.get(GroupProdOrderComponentsQueryLcl.Item_No_);
            Clear(INBINQtyVarLcl);

            Clear(ReviewQtyVarLcl);
            ProdOrderComponentsRecLcl.Reset();
            ProdOrderComponentsRecLcl.SetRange("Prod. Order No.", GroupProdOrderComponentsQueryLcl.Prod__Order_No_);
            ProdOrderComponentsRecLcl.SetRange("Prod. Order Line No.", GroupProdOrderComponentsQueryLcl.Prod__Order_Line_No_);
            ProdOrderComponentsRecLcl.SetRange("Item No.", GroupProdOrderComponentsQueryLcl.Item_No_);
            ProdOrderComponentsRecLcl.SetRange("Bin Code", GroupProdOrderComponentsQueryLcl.Bin_Code);
            ProdOrderComponentsRecLcl.SetRange("Variant Code", GroupProdOrderComponentsQueryLcl.Variant_Code);
            if ProdOrderComponentsRecLcl.FindSet() then
                repeat
                    INBINQtyVarLcl += ORBFunctionsCUGbl.CalcINBINQty(ProdOrderComponentsRecLcl);
                    ReviewQtyVarLcl += ORBFunctionsCUGbl.CalcReviewRequiredQty(ProdOrderComponentsRecLcl);
                until ProdOrderComponentsRecLcl.Next() = 0;


            TempExcelBufferRecGbl.AddColumn(GroupProdOrderComponentsQueryLcl.Bin_Code, false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
            TempExcelBufferRecGbl.AddColumn(GroupProdOrderComponentsQueryLcl.Item_No_, false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
            TempExcelBufferRecGbl.AddColumn(GroupProdOrderComponentsQueryLcl.Prod__Order_No_, false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
            TempExcelBufferRecGbl.AddColumn(GroupProdOrderComponentsQueryLcl.Prod__Order_Line_No_, false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
            TempExcelBufferRecGbl.AddColumn(GroupProdOrderComponentsQueryLcl.Variant_Code, false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
            TempExcelBufferRecGbl.AddColumn(ItemRecLcl."Base Unit of Measure", false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
            TempExcelBufferRecGbl.AddColumn(Format(INBINQtyVarLcl), false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Number);
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
}
