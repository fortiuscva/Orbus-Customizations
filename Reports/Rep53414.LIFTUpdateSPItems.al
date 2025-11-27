report 53414 "ORB LIFT Update SP Items"
{
    ApplicationArea = All;
    Caption = 'LIFT Update Sales Price Items';
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    trigger OnPostReport()
    begin


        Clear(LIFTSalesPriceByItemQuery);
        LIFTSalesPriceByItemQuery.SetFilter(To_Be_Processed, '%1', true);
        if LIFTSalesPriceByItemQuery.Open() then begin
            while LIFTSalesPriceByItemQuery.Read() do begin
                ItemNo := LIFTSalesPriceByItemQuery.ItemNo;

                LIFTSalesPriceItems.Reset();
                LIFTSalesPriceItems.SetRange("Item No.", ItemNo);
                IF not LIFTSalesPriceItems.FindFirst() then begin
                    LIFTSalesPriceItems."Item No." := ItemNo;
                    LIFTSalesPriceItems.Processed := false;
                    LIFTSalesPriceItems.Insert(true);
                end else begin
                    LIFTSalesPriceItems."Processed" := false;
                    LIFTSalesPriceItems.Modify(true);
                end;
            end;
        end;
    end;

    var
        ItemNo: Code[20];
        LIFTERPSetup: Record "ORB LIFT ERP Setup";
        LIFTSalesPriceByItemQuery: Query "ORB LIFT Sales Prices By Item";
        LIFTSalesPriceItems: Record "ORB LIFT Sales Price Items";
        LastSyncDateTime: DateTime;

}
