report 53000 "ORB Retension Policy Tables"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    dataset
    {
        dataitem(Number; integer)
        {


            trigger OnAfterGetRecord()
            begin
                lcuAddRetensionPolicyTable.run();
            end;

        }
    }

    var
        lcuAddRetensionPolicyTable: Codeunit "ORB Add Retension Policy Table";

}