page 52643 "ORB LIFT API Codes"
{
    ApplicationArea = All;
    Caption = 'LIFT API Codes';
    PageType = List;
    SourceTable = "ORB LIFT API Codes";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
            }
        }
    }
}
