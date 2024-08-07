page 52626 "ORB Escalation Reasons"
{
    ApplicationArea = All;
    Caption = 'Escalation Reasons';
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "ORB Escalation Reasons";
    SourceTableView = order(ascending);
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