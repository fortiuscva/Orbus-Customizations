table 52608 "ORB Sales Line Add. Fields"
{
    Caption = 'Sales Line Additional Fields';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document Type"; Enum "Sales Document Type")
        {
            Caption = 'Document Type';
        }
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
        key(Key1; "Document Type", "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    var
        SalesLineRecGbl: Record "Sales Line";
}
