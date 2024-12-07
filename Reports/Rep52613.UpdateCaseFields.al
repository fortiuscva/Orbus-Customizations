report 52613 "ORB Update Case Fields"
{
    ApplicationArea = All;
    Caption = 'Update Case Fields';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem(CaseWSG; "Case WSG")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";
            trigger OnAfterGetRecord()
            var
                Updated: Boolean;
            begin
                if "Resolution Date 2" = 0D then begin
                    "Resolution Date 2" := "Resolution Date";
                    Updated := true;
                end;

                if "Responsible Owner Current" = '' then begin
                    "Responsible Owner Current" := "Responsible Owner";
                    Updated := true;
                end;

                if "Contact Email 2" = '' then begin
                    "Contact Email 2" := "Contact Email";
                    Updated := true;
                end;

                if Updated then begin
                    Modify(true);
                    Counter += 1;
                end;
            end;
        }
    }
    trigger OnPostReport()
    begin
        if Counter > 0 then
            Message('Cases are Modified:%1', Counter);
    end;

    var
        Counter: Integer;
}
