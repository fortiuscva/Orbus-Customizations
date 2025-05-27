report 53401 "ORB Delete LIFT Sales Lines"
{
    ApplicationArea = All;
    Caption = 'Delete LIFT Sales Lines';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem(ORBLIFTSalesLineBuffer; "ORB LIFT Sales Line Buffer")
        {
            RequestFilterFields = "Document Type", "Document No.", "LIFT Line ID";
            trigger OnAfterGetRecord()
            begin
                ORBLIFTSalesLineBuffer.Delete();
            end;
        }
    }
}
