query 53408 "ORB LIFT Item Variants"
{
    APIGroup = 'orbus';
    APIPublisher = 'orbus';
    APIVersion = 'v2.0';
    EntityName = 'LIFTItemVariants';
    EntitySetName = 'LIFTItemVariants';
    QueryType = API;

    elements
    {
        dataitem(item; "Item")
        {
            DataItemTableFilter = Blocked = const(false),
                                  "ORB Has Active Variants" = const(true),
                                  "ORB Stroage Type Id" = const(35884),
                                  "ORB Do Not Integrate" = const(true);
            column("no"; "No.") { }
            column(shortDescription; "Short Description") { }
            column(itemDescription; Description) { }
            column(longDescription; "Long Description") { }
            column(unitCost; "Unit Cost") { }
            column(itemMaterialId; "ORB Material Id") { }
            column(itemStorageTypeId; "ORB Stroage Type Id") { }
            dataitem(itemVariant; "Item Variant")
            {
                DataItemLink = "Item No." = Item."No.";
                DataItemTableFilter = Blocked = const(false);
                column(itemNo; "Item No.") { }
                column(code; Code) { }
                column(itemVariantDescription; Description) { }
                column(itemVariantMaterialId; "ORB Material Id") { }
                column(itemVariantStorageTypeId; "ORB Storage Type Id") { }
            }
        }
    }
}
