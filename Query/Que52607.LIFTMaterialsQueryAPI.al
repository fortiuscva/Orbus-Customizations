query 52607 "ORB LIFT Materials Query API"
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
            DataItemTableFilter = "No." = filter('GVNL-ACV-FLATMX-98');
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
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
