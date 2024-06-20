table 52601 "ORB Orphan Ship01 Order Det."
{
    Caption = 'Orphan Ship01 Order Det.';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
        }
        field(5; "Source Type"; Integer)
        {
            Caption = 'Source Type ';
            DataClassification = CustomerContent;
        }
        field(6; "Source Subtype"; Integer)
        {
            Caption = 'Source Subtype ';
            DataClassification = CustomerContent;
        }
        field(7; "Source No."; Code[20])
        {
            Caption = 'Source No.';
            DataClassification = CustomerContent;
        }
        field(8; "Source Line No."; Integer)
        {
            Caption = 'Source Line No. ';
            DataClassification = CustomerContent;
        }
        field(9; "Source Subline No."; Integer)
        {
            Caption = 'Source Subline No.';
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
        field(20; "Qty. in Warehouse"; Decimal)
        {
            Caption = 'Qty. in Warehouse';
            DataClassification = CustomerContent;
        }
        field(21; "Applied Qty."; Decimal)
        {
            Caption = 'Applied Qty.';
            DataClassification = CustomerContent;
        }
        field(23; "Remaining Whse. Qty."; Decimal)
        {
            Caption = 'Orphan Qty.';
            DataClassification = CustomerContent;
        }

        field(24; "Orphan Qty."; Decimal)
        {
            Caption = 'Orphan Qty.';
            DataClassification = CustomerContent;
        }
        field(25; "Last Transaction Date"; Date)
        {
            Caption = 'Registration Date';
            DataClassification = CustomerContent;
        }
        field(30; "Source Document"; Enum "Warehouse Journal Source Document")
        {
            BlankZero = true;
            Caption = 'Source Document';
        }

        field(67; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = CustomerContent;
        }
        field(100; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(102; Posted; Boolean)
        {
            Caption = 'Posted';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        Key(Key2; "Last Transaction Date")
        {

        }
    }
}
