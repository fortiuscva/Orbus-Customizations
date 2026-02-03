query 53412 "ORB LIFT Item"
{
    APIGroup = 'orbus';
    APIPublisher = 'orbus';
    APIVersion = 'v2.0';
    EntityName = 'LIFTItems';
    EntitySetName = 'LIFTItems';
    QueryType = API;

    elements
    {
        dataitem(orbLIFTERPItem; "ORB LIFT ERP Item")
        {
            column(itemNo; "Item No.")
            {
            }
            column(variantCode; "Variant Code")
            {
            }
            column(productName; "Product Name")
            {
            }
            column(description; Description)
            {
            }
            column(catalogId; "Catalog Id")
            {
            }
            column(prodLineDimId; "Prod Line Dim Id")
            {
            }
            column(productType; "Product Type")
            {
            }
            column(shipFromWhseLocId; "Ship From Whse Loc Id")
            {
            }
            column(status; Status)
            {
            }
            column(materialId; "Material Id")
            {
            }
            column(storageTypeId; "Storage Type Id")
            {
            }
            column(printFormat; "Print Format")
            {
            }
            column(doNotIntegrateMaterial; "Do Not Integrate Material")
            {
            }
            column(doNotIntegrateSellable; "Do Not Integrate Sellable")
            {
            }
            column(toBeSynchronized; "To Be Synchronized")
            {
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
