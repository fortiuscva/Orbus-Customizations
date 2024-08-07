page 52626 "ORB Escalation Reason Codes"
{
    ApplicationArea = All;
    Caption = 'Escalation Reason Codes';
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "ORB Escalation Reason Codes";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec.Code)
                {
                    ToolTip = 'Specifies Escalation Reason Code';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies Escalation Reason Description';
                }
            }
        }

    }

}