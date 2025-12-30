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
        field(5; "Shipped Send to LIFT"; Boolean)
        {
            Caption = 'Shipped Send to LIFT';
        }
        field(6; "API Result"; text[2024])
        {
            Caption = 'API Result';
        }
        field(7; "Invoice Send to LIFT"; Boolean)
        {
            Caption = 'Invoice Send to LIFT';
        }
        field(8; "Step 18 Completed"; Boolean)
        {
            Caption = 'Step 18 Completed';
        }
        field(10; "Step 18 Completed in LIFT ERP"; Boolean)
        {
            Caption = 'Step 18 Completed in LIFT ERP';
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
