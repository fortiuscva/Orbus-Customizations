pageextension 52667 "ORB Job Queue Entry Card" extends "Job Queue Entry Card"
{
    layout
    {
        addlast(General)
        {
            field("ORB Set Ready When Failed"; Rec."ORB Set Ready When Failed")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Set Status to Ready on Failure field.', Comment = '%';
            }
            field("ORB Send Failure Notification"; Rec."ORB Send Failure Notification")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Send Failure Notification field.', Comment = '%';
            }
            field("ORB Notify All EmailRecipients"; Rec."ORB Notify All EmailRecipients")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Send Job Queue Failure Notification to all the Email Recipients field.', Comment = '%';
            }
        }
    }
}
