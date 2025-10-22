table 53409 "ORB LIFT Deleted Sales Orders"
{
    Caption = 'LIFT Deleted Sales Orders';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document Type"; Enum "Sales Document Type")
        {
            Caption = 'Document Type';
        }
        field(2; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; "LIFT Line No."; Decimal)
        {
            Caption = 'Line No.';
        }
        field(5; "Exported to LIFT"; Boolean)
        {
            Caption = 'Exported to LIFT';
        }
        field(6; "API Result"; text[2024])
        {
            Caption = 'API Result';
        }
    }
    keys
    {
        key(PK; "Document Type", "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
