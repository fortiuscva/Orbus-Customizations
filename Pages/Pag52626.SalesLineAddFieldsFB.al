page 52626 "ORB Sales Line Add. Fields FB"
{
    ApplicationArea = All;
    Caption = 'ORB Sales Line Add. Fields Details';
    PageType = CardPart;
    SourceTable = "ORB Sales Line Add. Fields";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

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
