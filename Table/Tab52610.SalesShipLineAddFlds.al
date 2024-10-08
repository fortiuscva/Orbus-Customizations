table 52610 "ORB Sales Ship. Line Add Flds"
{
    Caption = 'Sales Shipment Line Additional Fields';
    DataClassification = ToBeClassified;

    fields
    {
        field(3; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(4; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(52600; "Job ID"; Code[50])
        {
            Caption = 'Job ID';
        }
        field(52601; "Job URL"; text[200])
        {
            Caption = 'Job URL';
        }
    }
    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
