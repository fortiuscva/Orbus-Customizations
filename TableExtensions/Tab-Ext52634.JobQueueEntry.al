tableextension 52634 "ORB Job Queue Entry" extends "Job Queue Entry"
{
    fields
    {
        field(52600; "ORB Set Ready When Failed"; Boolean)
        {
            Caption = 'Set Status to Ready on Failure';
            DataClassification = CustomerContent;
        }
        field(52601; "ORB Send Failure Notification"; Boolean)
        {
            Caption = 'Send Failure Notification';
            DataClassification = CustomerContent;
        }
        field(52602; "ORB Notify All EmailRecipients"; Boolean)
        {
            Caption = 'Send Job Queue Failure Notification to all the Email Recipients';
            DataClassification = CustomerContent;
        }
    }
}
