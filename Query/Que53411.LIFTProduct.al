query 53411 "ORB LIFT Product"
{
    APIGroup = 'orbus';
    APIPublisher = 'orbus';
    APIVersion = 'v2.0';
    EntityName = 'LIFTProducts';
    EntitySetName = 'LIFTProducts';
    QueryType = API;

    elements
    {
        dataitem(item; Item)
        {
            DataItemTableFilter = "ORB Do Not Integrate (Sell)" = filter(false);
            column(no; "No.")
            {
            }
            column(description; Description)
            {
            }
            column(materialId; "ORB Material Id")
            {
            }
            column(storageTypeId; "ORB Stroage Type Id")
            {
            }
        }
    }
}
