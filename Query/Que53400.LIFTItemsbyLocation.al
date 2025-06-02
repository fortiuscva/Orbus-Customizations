query 53400 "ORB LIFT Items by Location"
{
    Caption = 'LIFT Items by Location';
    QueryType = API;
    APIGroup = 'Orbus';
    APIPublisher = 'Orbus';
    APIVersion = 'v2.0';
    EntityName = 'LIFTItemsByLocation';
    EntitySetName = 'LIFTItemsByLocation';

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
