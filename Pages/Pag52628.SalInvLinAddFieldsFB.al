page 52628 "ORB Sal Inv Lin Add. Fields FB"
{
    ApplicationArea = All;
    Caption = 'ORB Sales Invoive Line Add. Fields FB';
    PageType = CardPart;
    SourceTable = "ORB Sales Inv. Line Add. Flds";

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
    actions
    {
        area(Processing)
        {
            action(ORBOpenLink)
            {
                Caption = 'Open URL';
                trigger OnAction()
                begin
                    Hyperlink(Rec."Job URL");
                end;
            }
        }
    }
}