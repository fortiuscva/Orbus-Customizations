codeunit 53413 "ORB LIFT Post InvPick Trans."
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
        if not Codeunit.Run(Codeunit::"ORB LIFT Read InvPick Trans.") then
            if StopOnError then begin
                Window.Close();
                Error(GetLastErrorText);
            end else begin
            end;
        Commit();
        Window.Close();


        // Post Item journals
        Window.Open('Posting Item Journals ...');

        ClearLastError();
        Clear(EntryNo);
        OrbusSingleInstanceCUGbl.SetSuppressItemJnlConfirm(true);
        if not Codeunit.Run(Codeunit::"ORB LIFT Post Item Jnl.", rec) then
            if StopOnError then begin
                OrbusSingleInstanceCUGbl.SetSuppressItemJnlConfirm(false);
                Window.Close();
                Error(GetLastErrorText);
            end else begin
            end;
        OrbusSingleInstanceCUGbl.SetSuppressItemJnlConfirm(false);
        Window.Close();
    end;

}
