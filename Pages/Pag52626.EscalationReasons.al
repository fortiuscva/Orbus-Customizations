page 52626 "ORB Escalation Reasons"
{
    ApplicationArea = All;
    Caption = 'Escalation Reasons';
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "ORB Escalation Reasons";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Escalation Reason"; Rec."Escalation Reason")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}