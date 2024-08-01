report 52608 "ORB Update Sales Order RUSH"
{
    ApplicationArea = All;
    Caption = 'Update Sales Order RUSH';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    dataset
    {
        dataitem(SalesHeader; "Sales Header")
        {
            trigger OnAfterGetRecord()
            begin
                if SalesHeader.Rush then
                    SalesHeader."ORB RUSH" := 'Rush'
                else
                    SalesHeader."ORB RUSH" := 'Same Day';
                SalesHeader.Modify();
            end;

            trigger OnPostDataItem()
            begin
                Message('Updated Successfully.');
            end;
        }
    }
}
