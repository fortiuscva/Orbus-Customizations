page 52655 "ORB User Pick Zone"
{
    ApplicationArea = All;
   Caption = 'ORB User Pick Zone';
    PageType = List;
    SourceTable = "ORB User Pick Zone";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the value of the User ID field.', Comment = '%';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the value of the Location Code field.', Comment = '%';
                }
                field("Zone Code"; Rec."Zone Code")
                {
                    ToolTip = 'Specifies the value of the Zone Code field.', Comment = '%';
                }
            }
        }
    }
}
