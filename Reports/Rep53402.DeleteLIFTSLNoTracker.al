report 53402 "ORB Delete LIFT SL No Tracker"
{
    ApplicationArea = All;
    Caption = 'Delete LIFT Last SL No Tracker';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem("ORB LIFT Last SL No Tracker"; "ORB LIFT Last SL No Tracker")
        {
            RequestFilterFields = "Document Type", "Document No.";
            trigger OnAfterGetRecord()
            begin
                "ORB LIFT Last SL No Tracker".Delete();
            end;
        }
    }
}