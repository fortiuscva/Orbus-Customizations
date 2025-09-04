query 53402 "ORB LIFT Item Variants by Loc"
{
    Caption = 'LIFT Item Variants by Location';
    QueryType = API;
    APIGroup = 'Orbus';
    APIPublisher = 'Orbus';
    APIVersion = 'v2.0';
    EntityName = 'LIFTItemVariantsByLocation';
    EntitySetName = 'LIFTItemVariantsByLocation';

    elements
    {
        dataitem(ItemLedgerEntry; "Item Ledger Entry")
        {
            column(ItemNo; "Item No.") { }
            column(Variant_Code; "Variant Code") { }
            column(Remaining_Quantity; "Remaining Quantity") { Method = Sum; }
            column(ItemLedgerEntry_LocationCode; "Location Code") { }

            dataitem(Item_Variant; "Item Variant")
            {
                DataItemLink = Code = ItemLedgerEntry."Variant Code", "Item No." = ItemLedgerEntry."Item No.";
                DataItemTableFilter = "ORB Material Id" = filter(<> 0), "ORB Storage Type Id" = filter(<> 0);
                column(Material_Id; "ORB Material Id") { }
                column(Storage_Type_Id; "ORB Storage Type Id") { }

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
