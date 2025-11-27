table 53412 "ORB LIFT Sales Price Items"
{
    Caption = 'LIFT Sales Price Items';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.';
        }
        field(10; "To Be Processed"; Boolean)
        {
            Caption = 'Processed';
        }
    }
    keys
    {
        key(PK; "Item No.")
        {
            Clustered = true;
        }
    }
}
