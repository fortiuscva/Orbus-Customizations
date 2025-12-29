tableextension 52615 "ORB Sales Shipment Header" extends "Sales Shipment Header"
{
    fields
    {
        field(52620; "ORB Magento Order #"; Text[20])
        {
            Caption = 'Magento Order #';
            DataClassification = ToBeClassified;
        }
        // field(52621; "ORB Magento Artwork Job ID"; Text[20])
        // {
        //     Caption = 'Magento Artwork Job ID';
        //     DataClassification = ToBeClassified;
        // }
        field(52622; "ORB Magento CC 4 Digits"; Code[4])
        {
            Caption = 'Magento CC 4 Digits';
            DataClassification = ToBeClassified;
        }
        field(52628; "ORB Escalation Reason Code"; Code[20])
        {
            Caption = 'Escalation Reason Code';
            DataClassification = CustomerContent;
            TableRelation = "ORB Escalation Reason Codes".Code;
        }
        field(52629; "ORB Resolved By"; Code[20])
        {
            Caption = 'Resolved By';
            DataClassification = CustomerContent;
            TableRelation = User."User Name";
        }
        field(52630; "ORB Original Promised Ship Dt."; Date)
        {
            Caption = 'Original Promised Shipment Date';
            DataClassification = CustomerContent;
        }
        field(52631; "ORB Delayed Ship Reason Code"; Code[20])
        {
            Caption = 'Delayed Shipment Reason Code';
            DataClassification = CustomerContent;
            TableRelation = "Case Reason Code WSG";
        }
        field(52632; "ORB Delayed Ship Sub-Reason"; Code[100])
        {
            Caption = 'Delayed Shipment Sub-Reason Code';
            DataClassification = CustomerContent;
        }

        //field(52633 ; used on sales header.
        //field(52634 ; used on sales header.
        field(52652; "ORB Lift Order"; Boolean)
        {
            Caption = 'Lift Order';
        }
        field(52653; "ORB Ship-to Contact Name (API)"; text[100])
        {
            Caption = 'Ship-to Contact Name (API)';
        }
        //field(52658; "ORB Inv. Pick No."; Code[20]) Used on Sales header
        //field(52659; "ORB Posted Inv. Pick No."; Code[20]) Used on Sales header

    }
}
