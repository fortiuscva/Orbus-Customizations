codeunit 53412 "ORB LIFT Post Inventory Trans."
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
        Window: Dialog;
    begin

        StopOnError := OrbusSingleInstanceCUGbl.GetStopOnError();

        //Get all Inventory Transactions from LIFTERP
        Window.Open('Fetching Inventory Transactions...');

        ClearLastError();
        if not Codeunit.Run(Codeunit::"ORB LIFT Read Inv.Transactions") then;

        Commit();
        Window.Close();


        //Register Warehouse Item journals specific to Sales order
        Window.Open('Registering Warehouse Item Journals...');

        ClearLastError();
        OrbusSingleInstanceCUGbl.SetSuppressWhseConfirm(true);
        if not Codeunit.Run(Codeunit::"ORB LIFT Register Whse. Jnl.", rec) then
            if StopOnError then begin
                OrbusSingleInstanceCUGbl.SetSuppressWhseConfirm(false);
                Window.Close();
                Error(GetLastErrorText);
            end;
        OrbusSingleInstanceCUGbl.SetSuppressWhseConfirm(false);
        Window.Close();

        // Execute LIFT Calculate Warehouse Adjustment
        Window.Open('Calculating Warehouse Adjustment...');

        ClearLastError();
        if not Codeunit.Run(Codeunit::"ORB LIFT Calculate Whse. Adj.", rec) then
            if StopOnError then begin
                Window.Close();
                Error(GetLastErrorText);
            end;
        Window.Close();

        // Post Warehouse Adjustments (Item journals)
        Window.Open('Posting Warehouse Adjustments...');

        ClearLastError();
        OrbusSingleInstanceCUGbl.SetSuppressItemJnlConfirm(true);
        if not Codeunit.Run(Codeunit::"ORB LIFT Post Adjustment Jnl.", rec) then
            if StopOnError then begin
                OrbusSingleInstanceCUGbl.SetSuppressItemJnlConfirm(false);
                Window.Close();
                Error(GetLastErrorText);
            end;
        OrbusSingleInstanceCUGbl.SetSuppressItemJnlConfirm(false);
        Window.Close();
    end;

}
