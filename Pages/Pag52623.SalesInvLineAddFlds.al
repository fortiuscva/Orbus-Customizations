page 52623 "ORB Sales Inv. Line Add. Flds"
{
    ApplicationArea = All;
    Caption = 'Sales Invoice Line Additional Fields';
    PageType = ListPart;
    SourceTable = "ORB Sales Inv. Line Add. Flds";

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
