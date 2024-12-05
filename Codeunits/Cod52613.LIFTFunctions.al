codeunit 52613 "ORB LIFT Functions"
{
    procedure ItemJournalRollupCost(JournalTemplateName: Code[10]; JournalBatchName: Code[10])
    var
        GroupLiftJnlLines: Query "ORB LIFT Group Jnl. Lines";
        ItemJnlLine: Record "Item Journal Line";
        MaterialCost: Decimal;
    begin
        JournalTemplateName := 'ITEM';
        JournalBatchName := 'LIFTERP';

        //GroupLiftJnlLines.SetRange(FilterJournal_Template_Name, JournalTemplateName);
        //GroupLiftJnlLines.SetRange(FilterJournal_Batch_Name, JournalBatchName);
        while GroupLiftJnlLines.Read() do begin
            Clear(MaterialCost);
            ItemJnlLine.reset;
            ItemJnlLine.SetRange("Journal Template Name", JournalTemplateName);
            ItemJnlLine.SetRange("Journal Batch Name", JournalBatchName);
            ItemJnlLine.SetRange("Document No.", GroupLiftJnlLines.Document_No_);
            ItemJnlLine.SetRange("ORB LIFT Inv. Transaction ID", GroupLiftJnlLines.ORB_LIFT_Inv__Transaction_ID);
            ItemJnlLine.SetRange("Entry Type", ItemJnlLine."Entry Type"::"Negative Adjmt.");
            if ItemJnlLine.FindSet() then
                repeat
                    MaterialCost += ItemJnlLine."Unit Cost";
                until ItemJnlLine.Next() = 0;

            ItemJnlLine.reset;
            ItemJnlLine.SetRange("Journal Template Name", JournalTemplateName);
            ItemJnlLine.SetRange("Journal Batch Name", JournalBatchName);
            ItemJnlLine.SetRange("Document No.", GroupLiftJnlLines.Document_No_);
            ItemJnlLine.SetRange("ORB LIFT Inv. Transaction ID", GroupLiftJnlLines.ORB_LIFT_Inv__Transaction_ID);
            ItemJnlLine.SetRange("Entry Type", ItemJnlLine."Entry Type"::"Positive Adjmt.");
            if ItemJnlLine.FindFirst() then begin
                ItemJnlLine.Validate("Unit Amount", MaterialCost);
                ItemJnlLine.Modify();
            end;
        end;
    end;
}
