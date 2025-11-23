report 53411 "ORB LIFT Modified Prices"
{
    ApplicationArea = All;
    Caption = 'ORB LIFT Modified Prices';
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    trigger OnPostReport()
    var
        CustomerPriceGroup: Record "Customer Price Group";
        ItemNo: Code[20];
    begin
        LIFTERPSetup.Get();
        LastSyncDateTime := LIFTERPSetup."Price Last Sync DateTime";

        // Apply Modified Date Time filter to the Query
        Clear(ModifiedSalesPricesQuery);
        ModifiedSalesPricesQuery.SetFilter(systemModifiedAt, '>%1', LastSyncDateTime);
        if ModifiedSalesPricesQuery.Open() then begin
            while ModifiedSalesPricesQuery.Read() do begin
                ItemNo := ModifiedSalesPricesQuery.ItemNo;

                // Procedure Call to Skip the processing of KIT Items 
                if SkipProcessingOfKITItems(ItemNo) then begin

                    // Remove existing Records from the LIFT Sales Price Staging table for this Item No.
                    LIFTSalesPrice.Reset();
                    LIFTSalesPrice.SetRange("Item No.", ItemNo);
                    if not LIFTSalesPrice.IsEmpty() then
                        LIFTSalesPrice.DeleteAll(true);

                    // Fetches all the Sales Price Records for this Item No.
                    SalesPrice.Reset();
                    SalesPrice.SetRange("Item No.", ItemNo);
                    if SalesPrice.FindSet() then begin
                        repeat
                            if CheckForActiveSalesPrice(SalesPrice) then begin
                                if SalesPrice."Sales Type" = SalesPrice."Sales Type"::"Customer Price Group" then begin
                                    if SalesPrice."Sales Code" <> '' then begin
                                        LIFTSalesPrice.Init();
                                        LIFTSalesPrice.TransferFields(SalesPrice);
                                        LIFTSalesPrice.Insert(true);
                                        AssignMaxQty(SalesPrice, LIFTSalesPrice);
                                        LIFTSalesPrice."ORB LIFT Status" := 'A';
                                        LIFTSalesPrice.Modify(true);
                                    end;
                                end
                                else if SalesPrice."Sales Type" = SalesPrice."Sales Type"::"All Customers" then begin
                                    CustomerPriceGroup.Reset();
                                    if CustomerPriceGroup.FindFirst() then begin
                                        repeat
                                            LIFTSalesPrice.Init();
                                            LIFTSalesPrice."Item No." := SalesPrice."Item No.";
                                            LIFTSalesPrice."Sales Type" := SalesPrice."Sales Type"::"Customer Price Group";
                                            LIFTSalesPrice."Sales Code" := CustomerPriceGroup.Code;
                                            LIFTSalesPrice."Starting Date" := SalesPrice."Starting Date";
                                            LIFTSalesPrice."Currency Code" := SalesPrice."Currency Code";
                                            LIFTSalesPrice."Variant Code" := SalesPrice."Variant Code";
                                            LIFTSalesPrice."Unit Of Measure Code" := SalesPrice."Unit of Measure Code";
                                            LIFTSalesPrice."Minimum Quantity" := SalesPrice."Minimum Quantity";
                                            LIFTSalesPrice."Unit Price" := SalesPrice."Unit Price";
                                            LIFTSalesPrice."Ending Date" := SalesPrice."Ending Date";
                                            LIFTSalesPrice.Insert(true);
                                            AssignMaxQty(SalesPrice, LIFTSalesPrice);
                                            LIFTSalesPrice."ORB LIFT Status" := 'A';
                                            LIFTSalesPrice.Modify(true);
                                        until CustomerPriceGroup.Next() = 0;
                                    end;
                                end;
                            end;
                        until SalesPrice.Next() = 0;
                    end;
                end;
            end;
        end;
        // Update Price Last Sync DateTime after Completion
        LIFTERPSetup."Price Last Sync DateTime" := CurrentDateTime;
        LIFTERPSetup.Modify(true);
    end;

    // procedure AssignLIFTStatus(var LIFTSalesPrice: Record "ORB LIFT Sales Price")
    // begin
    //     if (LIFTSalesPrice."Starting Date" <= Today) and ((LIFTSalesPrice."Ending Date" >= Today) or (LIFTSalesPrice."Ending Date" = 0D)) then
    //         LIFTSalesPrice."ORB LIFT Status" := 'A'
    //     else
    //         LIFTSalesPrice."ORB LIFT Status" := 'I';
    // end;

    procedure CheckForActiveSalesPrice(var SalesPrice: Record "Sales Price"): Boolean
    begin
        if (SalesPrice."Starting Date" <= Today) and ((SalesPrice."Ending Date" >= Today) or (SalesPrice."Ending Date" = 0D)) then
            exit(true)
        else
            exit(false);
    end;

    procedure AssignMaxQty(SalesPrice: Record "Sales Price"; var LIFTSalesPrice: Record "ORB LIFT Sales Price")
    var
        SalesPrice2: Record "Sales Price";
    begin
        SalesPrice2.Reset();
        SalesPrice2.SetRange("Item No.", SalesPrice."Item No.");
        SalesPrice2.SetRange("Sales Type", SalesPrice."Sales Type");
        SalesPrice2.SetRange("Sales Code", SalesPrice."Sales Code");
        SalesPrice2.SetRange("Unit of Measure Code", SalesPrice."Unit of Measure Code");
        SalesPrice2.SetRange("Starting Date", SalesPrice."Starting Date");
        SalesPrice2.SetRange("Ending Date", SalesPrice."Ending Date");
        SalesPrice2.SetFilter("Minimum Quantity", '>%1', SalesPrice."Minimum Quantity");
        if SalesPrice2.FindFirst() then
            LIFTSalesPrice."ORB LIFT Maximum Quantity" := SalesPrice2."Minimum Quantity" - 1
        else
            LIFTSalesPrice."ORB LIFT Maximum Quantity" := 999999;
    end;

    // Procedure to Skip the Processing of KIT Items
    procedure SkipProcessingOfKITItems(ItemNoPar: Code[20]): Boolean;
    var
        ItemRec: Record Item;
    begin
        if ItemRec.Get(ItemNoPar) then begin
            ItemRec.CalcFields("Assembly BOM");
            if ((ItemRec."Replenishment System" = ItemRec."Replenishment System"::Assembly) and (ItemRec."Assembly BOM")) then
                exit(false)
            else
                exit(true);
        end;
    end;

    var
        LIFTERPSetup: Record "ORB LIFT ERP Setup";
        SalesPrice: Record "Sales Price";
        ModifiedSalesPricesQuery: Query "ORB Modified Sales Prices";
        LIFTSalesPrice: Record "ORB LIFT Sales Price";
        LastSyncDateTime: DateTime;

}
