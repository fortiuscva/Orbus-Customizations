page 52620 "ORB Sales Line Add. Fields"
{
    ApplicationArea = All;
    Caption = 'Sales Line Additional Fields';
    PageType = ListPart;
    SourceTable = "ORB Sales Line Add. Fields";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Job ID"; Rec."Job ID")
                {
                    ToolTip = 'Specifies the value of the Job ID field.', Comment = '%';
                }
                field("Job URL"; Rec."Job URL")
                {
                    ToolTip = 'Specifies the value of the Job URL field.', Comment = '%';
                }
            }
        }
    }
}
