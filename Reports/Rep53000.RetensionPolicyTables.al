report 53000 "ORB Retension Policy Tables"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Add Tables for Retention Policy';
    ProcessingOnly = true;
    dataset
    {
        dataitem(Number; Integer)
        {
            trigger OnAfterGetRecord()
            begin
                lcuAddRetensionPolicyTable.run();
            end;

            trigger OnPreDataItem()
            begin
                SetRange(Number, 1, 1);
            end;
        }

    }

    var
        lcuAddRetensionPolicyTable: Codeunit "ORB Add Retension Policy Table";

}