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
        dataitem(itemVariant; "Item Variant")
        {
            column("code"; "Code") { }
            column(itemNo; "Item No.") { }
            column(itemVariantDescription; Description) { }
            column(itemVariantMaterialId; "ORB Material Id") { }
            column(itemVariantStorageTypeId; "ORB Storage Type Id") { }
            dataitem(Item; Item)
            {
                DataItemLink = "No." = ItemVariant."Item No.";
                column(no; "No.") { }
                column(shortDescription; "Short Description") { }
                column(itemDescription; Description) { }
                column(longDescription; "Long Description") { }
                column(unitCost; "Unit Cost") { }
                column(itemMaterialId; "ORB Material Id") { }
                column(itemStorageTypeId; "ORB Stroage Type Id") { }
            }
        }
    }
}
