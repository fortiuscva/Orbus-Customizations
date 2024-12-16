tableextension 52628 "ORB Item Ledger Entry" extends "Item Ledger Entry"
{
    fields
    {
        field(50253; "ORB LIFT Inv. Transaction ID"; Integer)
        {
            Caption = 'LIFT Inventory Transaction ID';
            DataClassification = CustomerContent;
        }
        field(50254; "ORB LIFT Order Line ID"; Integer)
        {
            Caption = 'Order Line ID';
            DataClassification = CustomerContent;
        }
    }
}
