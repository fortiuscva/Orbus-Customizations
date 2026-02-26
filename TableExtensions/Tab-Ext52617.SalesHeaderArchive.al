tableextension 52617 "ORB Sales Header Archive" extends "Sales Header Archive"
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
        field(52633; "ORB DS Payment Type"; Option)
        {
            Caption = 'DS Payment Type';
            FieldClass = FlowField;
            CalcFormula = lookup("DSHIP Package Options"."Payment Type" where("Document Type" = filter("Sales Order"), "Document No." = field("No.")));
            OptionMembers = " ",SENDER,THIRD_PARTY,RECEIVER,COLLECT;
            OptionCaption = 'None,Sender,Third Party,Receiver,Collect';
            Editable = false;
        }
        field(52634; "ORB DS Payment Account No."; Text[100])
        {
            Caption = 'DS Payment Account No.';
            FieldClass = FlowField;
            CalcFormula = lookup("DSHIP Package Options"."Payment Account No." where("Document Type" = filter("Sales Order"), "Document No." = field("No.")));
            Editable = false;
        }
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
        field(52660; "ORB Order Cancelled"; Boolean)
        {
            Caption = 'Is LIFT Order Cancelled';
            DataClassification = CustomerContent;
        }
        field(52670; "ORB LIFT Last Updated DateTime"; Text[30])
        {
            Caption = 'LIFT Last Updated DateTime';
            DataClassification = CustomerContent;
        }
    }
}
