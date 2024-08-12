table 52609 "ORB Fin. Prod. Ord. Zero Qty."
{
    Caption = 'Finished Prod. Order Zero Qty';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
        }
        field(2; "Prod. Order No."; Code[20])
        {
            Caption = 'Prod. Order No.';
            DataClassification = CustomerContent;
        }
        field(3; "Work Center No."; Code[20])
        {
            Caption = 'Work Center No.';
            DataClassification = CustomerContent;
        }
        field(4; Status; Enum "Production Order Status")
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
        field(5; "Prod. Line Item No."; Code[20])
        {
            Caption = 'Prod. Line Item No.';
            DataClassification = CustomerContent;
        }
        field(6; "Routing Link Code"; Code[20])
        {
            Caption = 'Routing Link Code';
            DataClassification = CustomerContent;
        }
        field(7; "Component Item No."; Code[20])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(8; Description; Code[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(9; "ShopFloor Employee"; Code[50])
        {
            Caption = 'User ID';
            TableRelation = User."User Name";
            DataClassification = CustomerContent;
        }
        field(10; "Prod. Order Posted By"; Code[50])
        {
            Caption = 'Prod. Order Posted By';
            TableRelation = User."User Name";
            DataClassification = CustomerContent;
        }
        field(11; "Remaining Qty."; Decimal)
        {
            Caption = 'Remaining Qty.';
            DataClassification = CustomerContent;
        }
        field(12; "Finished Quantity"; Integer)
        {
            Caption = 'Finished Quantity';
            DataClassification = CustomerContent;
        }
        field(13; "Prod. Order Line No."; Integer)
        {
            Caption = 'Prod. Order Line No.';
            DataClassification = CustomerContent;
        }
        field(20; "Prod. Order Line Mod. By"; Code[50])
        {
            Caption = 'Prod. Order Line Modified By';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = User."User Name";
        }

        field(21; "Prod. Order Line Mod. DT"; DateTime)
        {
            Caption = 'Prod. Order Line Modified Date&Time';
            Editable = false;
        }
    }
    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Prod. Order No.", "Routing Link Code")
        {

        }

    }
}
