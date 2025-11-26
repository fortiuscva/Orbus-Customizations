report 53413 "ORB Update Bin Location ID"
{
    ApplicationArea = All;
    Caption = 'LIFT Update Bin Location Id';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem(Bin; Bin)
        {

            trigger OnPreDataItem()
            begin
                if BinLocationID = 0 then
                    Error('Please Provide the New Bin Location ID.');

                if Bin.Count > 1 then
                    Error('Please run for only 1 Bin.');
            end;

            trigger OnAfterGetRecord()
            begin
                "ORB Bin Location Id" := BinLocationID;
                Modify();
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    field(BinLocationID; BinLocationID)
                    {
                        Caption = 'New Bin Location ID';
                        ApplicationArea = all;
                    }
                }
            }
        }

    }
    var
        BinLocationID: Integer;
}