query 53400 "ORB LIFT Items by Location"
{
    Caption = 'LIFT Items by Location';
    QueryType = API;
    APIGroup = 'orbus';
    APIPublisher = 'orbus';
    APIVersion = 'v2.0';
    EntityName = 'itemsByLocation';
    EntitySetName = 'itemsByLocation';

    elements
    {
        dataitem(ItemLedgerEntry; "Item Ledger Entry")
        {
            column(ItemNo; "Item No.") { }
            column(Quantity; Quantity) { Method = Sum; }

            dataitem(Item; Item)
            {
                DataItemLink = "No." = ItemLedgerEntry."Item No.";
                column(Material_Id; "ORB Material Id") { }
                column(Storage_Type_Id; "ORB Stroage Type Id") { }

                dataitem(Location; Location)
                {
                    DataItemLink = Code = ItemLedgerEntry."Location Code";
                    column(LocationCode; Code) { }
                    column(Location_Id; "ORB Location Id")
                    { }
                }
            }
        }
    }
}
