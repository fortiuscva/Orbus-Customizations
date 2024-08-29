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
                Editable = false;
            }
            field("ORB Resolved By"; Rec."ORB Resolved By")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the user who resolved escalated issue';
                Editable = false;
            }
            field("ORB Original Promised Ship Dt."; Rec."ORB Original Promised Ship Dt.")
            {
                ApplicationArea = all;
                Tooltip = 'Specifies the original promised shipment date';
                Editable = false;
            }
            field("ORB Delayed Ship Reason Code"; Rec."ORB Delayed Ship Reason Code")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the reason for Shipment Delay';
                Editable = false;
            }
            field("ORB Delayed Ship Sub-Reason"; Rec."ORB Delayed Ship Sub-Reason")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the sub-reason code for Shipment Delay';
                Editable = false;
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
