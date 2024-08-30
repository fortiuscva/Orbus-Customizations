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
        field(52630; "ORB SO Payment Type"; Option)
        {
            Caption = 'SO Payment Type';
            DataClassification = CustomerContent;
            OptionCaption = 'None,Sender,Third Party,Receiver,Collect';
            OptionMembers = "None","Sender","Third Party","Receiver","Collect";
        }
        field(52631; "ORB SO Payment Account No."; Text[100])
        {
            Caption = 'SO Payment Account No.';
            DataClassification = CustomerContent;
        }
        //field(52628 ; used on sales header.
        //field(52629 ; used on sales header.
    }
}
