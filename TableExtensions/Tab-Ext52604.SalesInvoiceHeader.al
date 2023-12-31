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
    }


}