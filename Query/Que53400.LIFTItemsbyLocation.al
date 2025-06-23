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
        dataitem(ItemLedgerEntry; "Item Ledger Entry")
        {
            column(ItemNo; "Item No.") { }
            column(Remaining_Quantity; "Remaining Quantity") { Method = Sum; }
            column(ItemLedgerEntry_LocationCode; "Location Code")
            { }

            dataitem(Item; Item)
            {
                DataItemLink = "No." = ItemLedgerEntry."Item No.";
                DataItemTableFilter = "ORB Material Id" = filter(<> 0), "ORB Stroage Type Id" = filter(<> 0);
                column(Material_Id; "ORB Material Id") { }
                column(Storage_Type_Id; "ORB Stroage Type Id") { }

                dataitem(Location; Location)
                {
                    DataItemLink = Code = ItemLedgerEntry."Location Code";
                    DataItemTableFilter = "ORB Location Id" = filter(<> 0);
                    column(LocationCode; Code) { }
                    column(Location_Id; "ORB Location Id")
                    { }
                }
            }
        }
    }
}
