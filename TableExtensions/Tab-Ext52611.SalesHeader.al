tableextension 52611 "ORB Sales Header" extends "Sales Header"
{
    fields
    {
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
