pageextension 52626 "ORB Posted Sales Shipment" extends "Posted Sales Shipment"
{
    layout
    {
        addlast(General)
        {
            field("ORB Escalation Reason Code"; Rec."ORB Escalation Reason Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Escalation Reason field.', Comment = '%';
            }
            field("ORB Resolved By"; Rec."ORB Resolved By")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the user who resolved escalated issue';
            }
        }
    }
    actions
    {
        addlast("&Shipment")
        {
            action("ORB Sales Shpt Header Addl Fields")
            {
                Caption = 'Additional Fields';
                Image = RelatedInformation;
                ApplicationArea = all;
                RunObject = page "ORB Sales Ship Hdr Add. Fields";
                RunPageLink = "No." = field("No.");
            }
        }
    }
}
