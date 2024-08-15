pageextension 52608 "ORB Posted Sales Invoice" extends "Posted Sales Invoice"
{
    layout
    {
        addafter("No.")
        {
            field("ORB Magento Order #"; Rec."ORB Magento Order #")
            {
                ApplicationArea = all;
                ToolTip = 'Magento Order #';
            }
        }
        addbefore("Work Description")
        {
            field("ORB Email Sent by JQ"; Rec."ORB Email Sent by JQ")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Email Sent by JQ for the invoice';
                Editable = false;
            }
            field("ORB Last Email Sent DT"; Rec."ORB Last Email Sent DT")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Last Email Sent Date&Time for the invoice';
                Editable = false;
            }
        }
        addlast(General)
        {
            field("Magento Order #"; Rec."ORB Magento Order #")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Magento Order # of Sales';
            }
            // field("ORB Magento Artwork Job ID"; Rec."ORB Magento Artwork Job ID")
            // {
            //     ApplicationArea = all;
            //     ToolTip = 'Specifies the Magento Artwork Job ID of Sales';
            // }
            field("ORB Magento CC 4 Digits"; Rec."ORB Magento CC 4 Digits")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Magento CC 4 Digits of Sales';
            }
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
        addlast(Invoice)
        {
            action("ORB Sales Inv Header Addl Fields")
            {
                Caption = 'Additional Fields';
                Image = RelatedInformation;
                ApplicationArea = all;
                RunObject = page "ORB Sales Inv. Hdr Add. Fields";
                RunPageLink = "No." = field("No.");
            }
        }
    }

}
