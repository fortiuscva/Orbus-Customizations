page 52629 "ORB SL Arch. Add. Fields FB"
{
    ApplicationArea = All;
    Caption = 'Sales Line Arch. Add. Fields Details';
    PageType = CardPart;
    SourceTable = "ORB Sales Line Arch.Add.Fields";

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