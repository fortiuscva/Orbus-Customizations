query 53403 "ORB LIFT Materials Query API"
{
    APIGroup = 'orbus';
    APIPublisher = 'orbus';
    APIVersion = 'v2.0';
    EntityName = 'LIFTMaterialsQueryAPI';
    EntitySetName = 'LIFTMaterialsQueryAPI';
    QueryType = API;


    elements
    {
        dataitem(item; Item)
        {
            DataItemTableFilter = Blocked = const(false),
                                  "Department Dimension" = filter('01'),
                                  "ORB Has Active Variants" = const(false),
                                  "ORB Do Not Integrate" = const(true);
            column(no; "No.") { }
            column(description; Description) { }
            column(shortDescription; "Short Description") { }
            column(longDescription; "Long Description") { }
            column(searchDescription; "Search Description") { }
            column(materialId; "ORB Material Id") { }
            column(storageTypeId; "ORB Stroage Type Id") { }
            // column(blocked; Blocked) { }
            // column("type"; "Type") { }
            column(baseUnitOfMeasure; "Base Unit of Measure") { }
            // column(itemCategoryCode; "Item Category Code") { }
            column(unitCost; "Unit Cost") { }
            column(departmentDimension; "Department Dimension") { }
            // column(divisionDimension; "Division Dimension") { }
            column(productLineDimension; "Product Line Dimension") { }
            // column(materialDimension; "Material Dimension") { }
            column(systemCreatedAt; SystemCreatedAt) { }
            column(systemModifiedAt; SystemModifiedAt) { }
        }
    }
}
