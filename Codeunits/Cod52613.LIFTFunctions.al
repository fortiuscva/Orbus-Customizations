codeunit 52613 "ORB LIFT Functions"
{
    procedure ItemJournalRollupCost(JournalTemplateName: Code[10]; JournalBatchName: Code[10])
    var
        GroupLiftJnlLines: Query "ORB LIFT Group Jnl. Lines";
        ItemJnlLine: Record "Item Journal Line";
        ItemLedgerEntry: Record "Item Ledger Entry";
        MaterialCost: Decimal;
    begin
        JournalTemplateName := 'ITEM';
        JournalBatchName := 'LIFTERP';

        GroupLiftJnlLines.SetRange(FilterJournal_Template_Name, JournalTemplateName);
        GroupLiftJnlLines.SetRange(FilterJournal_Batch_Name, JournalBatchName);
        if GroupLiftJnlLines.Open() then begin
            while GroupLiftJnlLines.Read() do begin
                Clear(MaterialCost);
                ItemJnlLine.reset;
                ItemJnlLine.SetRange("Journal Template Name", JournalTemplateName);
                ItemJnlLine.SetRange("Journal Batch Name", JournalBatchName);
                ItemJnlLine.SetRange("Document No.", GroupLiftJnlLines.Document_No_);
                ItemJnlLine.SetRange("ORB LIFT Order Line ID", GroupLiftJnlLines.ORB_LIFT_Order_Line_ID);
                ItemJnlLine.SetRange("Entry Type", ItemJnlLine."Entry Type"::"Negative Adjmt.");
                if ItemJnlLine.FindSet() then
                    repeat
                        MaterialCost += ItemJnlLine.Amount;
                    until ItemJnlLine.Next() = 0;

                ItemJnlLine.reset;
                ItemJnlLine.SetRange("Journal Template Name", JournalTemplateName);
                ItemJnlLine.SetRange("Journal Batch Name", JournalBatchName);
                ItemJnlLine.SetRange("Document No.", GroupLiftJnlLines.Document_No_);
                ItemJnlLine.SetRange("ORB LIFT Order Line ID", GroupLiftJnlLines.ORB_LIFT_Order_Line_ID);
                ItemJnlLine.SetRange("Entry Type", ItemJnlLine."Entry Type"::"Positive Adjmt.");
                if ItemJnlLine.FindFirst() then begin
                    ItemJnlLine.Validate(Amount, MaterialCost);
                    ItemJnlLine.Modify();
                end;
            end;
        end;
    end;

    procedure IsLIFTERPSetupEnabled(): Boolean
    begin
        if LIFTERPSetup.Get() and LIFTERPSetup."Lift ERP Integration Active" then
            exit(true);
    end;

    procedure IsGetCustomersAllowed(): Boolean
    begin
        if LIFTERPPermissionSet.Get() and LIFTERPPermissionSet."Get Customers" then
            exit(true);
    end;

    procedure IsGetSalesOrdersAllowed(): Boolean
    begin
        if LIFTERPPermissionSet.Get() and LIFTERPPermissionSet."Get Sales Orders" then
            exit(true);
    end;

    procedure IsGetWhseJournalAllowed(): Boolean
    begin
        if LIFTERPPermissionSet.Get() and LIFTERPPermissionSet."Get Whse. Journal" then
            exit(true);
    end;

    var
        LIFTERPSetup: Record "ORB LIFT ERP Setup";
        LIFTERPPermissionSet: Record "ORB LIFT ERP Permission Setup";
}
