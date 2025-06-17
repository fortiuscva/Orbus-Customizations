codeunit 53408 "ORB LIFT Read Inv.Transactions"
{
    trigger OnRun()
    var
        LIFTERPSetup: Record "ORB LIFT ERP Setup";
        LIFTIntegrationDataLogRec: Record "ORB LIFT Integration Data Log";
        LIFTIntegration: Codeunit "ORB LIFT Integration";
        LIFTAPICodes: Codeunit "ORB LIFT API Codes";
    begin
        LIFTERPSetup.Get();

        LIFTIntegrationDataLogRec.Reset();
        LIFTIntegrationDataLogRec.SetCurrentKey("Transaction ID");
        LIFTIntegrationDataLogRec.SetRange("Source Type", Database::"Warehouse Journal Line");

        if LIFTIntegrationDataLogRec.FindLast() then
            LIFTIntegration.ParseData(
                LIFTERPSetup."Inventory Journal API" + '&p1=' + Format(LIFTIntegrationDataLogRec."Transaction ID"),
                LIFTAPICodes.GetInventoryJournalAPICode())
        else
            LIFTIntegration.ParseData(
                LIFTERPSetup."Inventory Journal API", LIFTAPICodes.GetInventoryJournalAPICode());
    end;
}