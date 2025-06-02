query 53400 "ORB LIFT Item Inventory"
{
    Caption = 'Item Inventory by Location';
    QueryType = Normal;

    elements
    {
        dataitem(Item; Item)
        {
            column("ItemNo"; "No.")
            {
            }
            column("ItemDescription"; Description)
            {
            }
            dataitem(Item_Ledger_Entry; "Item Ledger Entry")
            {
                DataItemLink = "Item No." = Item."No.";
                column(Location_Code; "Location Code") { }
                column(Quantity; Quantity)
                {
                    Method = sum;
                }
            }
        }
    }
}
