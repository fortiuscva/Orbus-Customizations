pageextension 52605 "ORB Posted Sales Inv. - Update" extends "Posted Sales Inv. - Update"
{
    layout
    {
        modify("Sell-to Customer Name")
        {
            Editable = true;
        }
        addafter("Sell-to Customer Name")
        {
            field("ORB Email Sent by JQ"; Rec."ORB Email Sent by JQ")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Email Sent by JQ for the invoice';
            }
            field("ORB Bill-to Name"; Rec."Bill-to Name")
            {
                ApplicationArea = All;
                Editable = true;
                ToolTip = 'Specifies the name of the customer that the invoice was sent to.';
            }

            field("ORB Ship-to Name"; Rec."Ship-to Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the name of the customer that the items were shipped to.';
            }
            field("ORB Sell-to E-Mail"; Rec."Sell-to E-Mail")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Email field.';
            }
            field("ORB External Document No."; Rec."External Document No.")
            {
                ApplicationArea = all;
            }
            field("ORB Delayed Ship Reason Code"; Rec."ORB Delayed Ship Reason Code")
            {
                ApplicationArea = All;
                Editable = true;
                ToolTip = 'Specifies reasons for delayed shipment';
            }
            field("ORB Delayed Ship Sub-Reason"; Rec."ORB Delayed Ship Sub-Reason")
            {
                ApplicationArea = All;
                Editable = true;
                ToolTip = 'Specifies the sub-reason code for Shipment Delay';
            }

        }
    }
}
