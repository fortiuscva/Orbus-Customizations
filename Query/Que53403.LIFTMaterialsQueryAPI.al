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
            DataItemTableFilter = "ORB Material Id" = const(0), "ORB Stroage Type Id" = const(35884);
            column(no; "No.")
            {
            }
            column(description; Description)
            {
            }
            column(shortDescription; "Short Description")
            {
            }
            column(longDescription; "Long Description")
            {
            }
            column(searchDescription; "Search Description")
            {
            }
            column(materialId; "ORB Material Id")
            {
            }
            column(storageTypeId; "ORB Stroage Type Id")
            {
            }
            column(blocked; Blocked)
            {
            }
            column("type"; "Type")
            {
            }
            column(baseUnitOfMeasure; "Base Unit of Measure")
            {
            }
            column(itemCategoryCode; "Item Category Code")
            {
            }
            column(departmentDimension; "Department Dimension")
            {
            }
            column(divisionDimension; "Division Dimension")
            {
            }
            column(productLineDimension; "Product Line Dimension")
            {
            }
            column(materialDimension; "Material Dimension")
            {
            }
            column(systemCreatedAt; SystemCreatedAt)
            {
            }
            column(systemModifiedAt; SystemModifiedAt)
            {
            }
        }
    }
}
