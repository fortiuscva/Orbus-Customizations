report 53400 "ORB Delete LIFT Sales Orders"
{
    ApplicationArea = All;
    Caption = 'Delete LIFT Sales Orders';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem(ORBLIFTSalesOrderBuffer; "ORB LIFT Sales Order Buffer")
        {
            RequestFilterFields = "Document Type", "No.";
            trigger OnAfterGetRecord()
            begin
                ORBLIFTSalesOrderBuffer.Delete();
            end;
        }
    }
}
