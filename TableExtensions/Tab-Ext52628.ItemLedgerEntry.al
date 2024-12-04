tableextension 52628 "ORB Item Ledger Entry" extends "Item Ledger Entry"
{
    fields
    {
        field(50253; "ORB Inventory Transaction ID"; Integer)
        {
            Caption = 'Inventory Transaction ID';
            DataClassification = CustomerContent;
        }
        field(50254; "ORB Order Line ID"; Integer)
        {
            Caption = 'Order Line ID';
            DataClassification = CustomerContent;
        }
    }
}
