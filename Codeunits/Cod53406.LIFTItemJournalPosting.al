codeunit 53406 "ORB LIFT Item Journal Posting"
{
    procedure RunItemJnlPost()
    var
        ItemJnlLine: Record "Item Journal Line";
    begin
        ItemJnlLine.SetRange("Journal Template Name", 'ITEM');
        ItemJnlLine.SetRange("Journal Batch Name", 'LIFTERP');

        if not ItemJnlLine.FindSet() then begin
            if GuiAllowed then
                Message('No journal lines found in batch LIFTERP.');
            exit;
        end;

        ClearLastError();

        if not TryPostItemJournal(ItemJnlLine) then begin
            if GuiAllowed then
                Message('An error occurred while posting the journal: %1', GetLastErrorText());
        end else begin
            if GuiAllowed then
                Message('Item journal batch "LIFTERP" posted successfully.');
        end;
    end;

    [TryFunction]
    local procedure TryPostItemJournal(var ItemJnlLine: Record "Item Journal Line")
    var
        CalcWhseAdjmt: Report "Calculate Whse. Adjustment";
        LiftFunctions: Codeunit "ORB LIFT Functions";
    begin
        CalcWhseAdjmt.InitializeRequest(Today, 'TEST');
        CalcWhseAdjmt.SetItemJnlLine(ItemJnlLine);
        CalcWhseAdjmt.UseRequestPage(false);
        CalcWhseAdjmt.Run();

        LiftFunctions.ItemJournalRollupCost(
            ItemJnlLine."Journal Template Name",
            ItemJnlLine."Journal Batch Name");

        Codeunit.Run(Codeunit::"Item Jnl.-Post", ItemJnlLine);
    end;
}
