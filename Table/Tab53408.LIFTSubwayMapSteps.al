table 53408 "ORB LIFT Subway Map Steps"
{
    Caption = 'LIFT Subway Map Steps';
    LookupPageId = "ORB LIFT Subway Map Steps List";
    DrillDownPageId = "ORB LIFT Subway Map Steps List";
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[10])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
