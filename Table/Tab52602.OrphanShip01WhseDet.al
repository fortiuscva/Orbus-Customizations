table 52602 "ORB Orphan Ship01 Whse. Det."
{
    Caption = 'Orphan Ship01 Whse. Det.';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
        }
        field(10; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = CustomerContent;

        }
        field(11; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            DataClassification = CustomerContent;
        }
        field(14; "Location Code"; Code[20])
        {
            Caption = 'Bin Code';
            DataClassification = CustomerContent;
        }
        field(15; "Bin Code"; Code[20])
        {
            Caption = 'Bin Code';
            DataClassification = CustomerContent;
        }
        field(20; "Movement Qty."; Decimal)
        {
            Caption = 'Qty. in Warehouse';
            DataClassification = CustomerContent;
        }
        field(21; "Remaining Mvmt. Qty."; Decimal)
        {
            Caption = 'Applied Qty.';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }
}
