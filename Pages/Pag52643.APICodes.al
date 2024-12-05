page 52643 "ORB API Codes"
{
    ApplicationArea = All;
    Caption = 'ORB API Codes';
    PageType = List;
    SourceTable = "ORB API Codes";
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
