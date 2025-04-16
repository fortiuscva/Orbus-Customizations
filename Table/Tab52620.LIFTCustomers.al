table 52620 "ORB LIFT Customers"
{
    Caption = 'LIFT Customers';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
        }
        field(2; Status; Text[100])
        {
            Caption = 'Status';
        }
    }
    keys
    {
        key(PK; "Customer No.")
        {
            Clustered = true;
        }
    }
}
