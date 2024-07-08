table 52609 "ORB Finished ProdOrder ZeroQty"
{
    Caption = 'Finished ProdOrder ZeroQty';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';

        }
        field(2; "Production Order No"; Code[20])
        {

        }
        field(3; "Work Center No"; Code[20])
        {

        }


        field(4; Status; Code[20])
        {
            Caption = 'Source No.';

        }
        field(5; "Production Line Item"; Code[20])
        {

        }

        field(6; "Routing Link Code"; Code[20])
        {


        }
        field(7; "Component Item No"; Code[20])
        {


        }
        field(8; Description; Code[150])
        {

        }


        field(9; "ShopFloor Employee"; Code[50])
        {
            Caption = 'User ID';

        }


        field(10; "Production Order Posted by"; Code[50])
        {
            Caption = 'User ID';

        }

        field(11; "Remaining Qty"; Decimal)
        {

        }
        field(12; "Finished Quantity"; Integer)
        {

        }
        field(13; ProdorderlineNo; Integer)
        {


        }

    }
    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Production Order No", "Routing Link Code")
        {

        }

    }
}
