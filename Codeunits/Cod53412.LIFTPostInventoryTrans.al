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
        LIFTtoBCFunctions: Codeunit "ORB LIFTtoBC Functions";
        EntryNo: Integer;
    begin

        StopOnError := OrbusSingleInstanceCUGbl.GetStopOnError();

        //Get all Inventory Transactions from LIFTERP
        Window.Open('Fetching Inventory Transactions...');

        ClearLastError();
        Clear(EntryNo);
        EntryNo := LIFTtoBCFunctions.StartJobQueueLogEntry(1, 'Fetch Inventory Transactions');
        if not Codeunit.Run(Codeunit::"ORB LIFT Read Inv.Transactions") then
            if StopOnError then begin
                Window.Close();
                Error(GetLastErrorText);
            end else begin
                if not GuiAllowed then
                    LIFTtoBCFunctions.NotifyErrorsWhilePostingLIFTInventoryTranscations(Rec, 'Fetch Inventory Transactions', GetLastErrorText);
            end;
        LIFTtoBCFunctions.EndJobQueueLogEntry(EntryNo, GetLastErrorText);
        Commit();
        Window.Close();


        //Register Warehouse Item journals specific to Sales order
        Window.Open('Registering Warehouse Item Journals...');

        ClearLastError();
        Clear(EntryNo);
        OrbusSingleInstanceCUGbl.SetSuppressWhseConfirm(true);
        EntryNo := LIFTtoBCFunctions.StartJobQueueLogEntry(2, 'Register Warehouse Item Journals');
        if not Codeunit.Run(Codeunit::"ORB LIFT Register Whse. Jnl.", rec) then
            if StopOnError then begin
                OrbusSingleInstanceCUGbl.SetSuppressWhseConfirm(false);
                Window.Close();
                Error(GetLastErrorText);
            end else begin
                if not GuiAllowed then
                    LIFTtoBCFunctions.NotifyErrorsWhilePostingLIFTInventoryTranscations(Rec, 'Register Warehouse Item Journals', GetLastErrorText);
            end;
        OrbusSingleInstanceCUGbl.SetSuppressWhseConfirm(false);
        LIFTtoBCFunctions.EndJobQueueLogEntry(EntryNo, GetLastErrorText);
        Window.Close();

        // Execute LIFT Calculate Warehouse Adjustment
        Window.Open('Calculating Warehouse Adjustment...');

        ClearLastError();
        Clear(EntryNo);
        EntryNo := LIFTtoBCFunctions.StartJobQueueLogEntry(3, 'Calculate Warehouse Adjustments');
        if not Codeunit.Run(Codeunit::"ORB LIFT Calculate Whse. Adj.", rec) then
            if StopOnError then begin
                Window.Close();
                Error(GetLastErrorText);
            end else begin
                if not GuiAllowed then
                    LIFTtoBCFunctions.NotifyErrorsWhilePostingLIFTInventoryTranscations(Rec, 'Calculate Warehouse Adjustments', GetLastErrorText);
            end;
        LIFTtoBCFunctions.EndJobQueueLogEntry(EntryNo, GetLastErrorText);
        Window.Close();

        // Post Warehouse Adjustments (Item journals)
        Window.Open('Posting Warehouse Adjustments...');

        ClearLastError();
        Clear(EntryNo);
        EntryNo := LIFTtoBCFunctions.StartJobQueueLogEntry(4, 'Post Warehouse Adjustments');
        OrbusSingleInstanceCUGbl.SetSuppressItemJnlConfirm(true);
        if not Codeunit.Run(Codeunit::"ORB LIFT Post Adjustment Jnl.", rec) then
            if StopOnError then begin
                OrbusSingleInstanceCUGbl.SetSuppressItemJnlConfirm(false);
                Window.Close();
                Error(GetLastErrorText);
            end else begin
                if not GuiAllowed then
                    LIFTtoBCFunctions.NotifyErrorsWhilePostingLIFTInventoryTranscations(Rec, 'Post Warehouse Adjustments', GetLastErrorText);
            end;
        OrbusSingleInstanceCUGbl.SetSuppressItemJnlConfirm(false);
        LIFTtoBCFunctions.EndJobQueueLogEntry(EntryNo, GetLastErrorText);
        Window.Close();
    end;

}
