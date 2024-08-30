tableextension 52604 "ORB Sales Invoice Header" extends "Sales Invoice Header"
{
    fields
    {
        field(52600; "ORB Email Sent by JQ"; Boolean)
        {
            Caption = 'Email Sent by JQ';
            DataClassification = CustomerContent;
        }
        field(52601; "ORB Last Email Sent DT"; DateTime)
        {
            Caption = 'Last JQ Email Sent Date & Time';
            DataClassification = CustomerContent;
        }
        field(52610; "ORB Tax ID"; Code[20])
        {
            Caption = 'Tax ID';
            DataClassification = ToBeClassified;
        }
        field(52611; "ORB Declared Value"; Text[60])
        {
            Caption = 'Declared Value';
            DataClassification = ToBeClassified;
        }
        field(52612; "ORB International Contact"; Text[50])
        {
            Caption = 'International Contact';
            DataClassification = ToBeClassified;
        }
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
        //field(52630; "ORB SO Payment Type"; Option) // Do not use this ID
        //field(52631; "ORB SO Payment Account No."; Text[100]) // Do not use this ID
        //field(52628 ; used on sales header.
        //field(52629 ; used on sales header.
        //field(52630 ; used on sales header.
        //field(52631 ; used on sales header.
    }
}