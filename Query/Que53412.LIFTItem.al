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
            column(unitCost; "Unit Cost")
            {
            }
            column(catalogId; "Catalog Id")
            {
            }
            column(materialTypeId; "Material Type Id")
            {
            }
            column(primaryVendorId; "Primary Vendor Id")
            {
            }
            column(materialCategoryId; "Material Category Id")
            {
            }
            column(materialSubcategoryId; "Material Subcategory Id")
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
            column(productMaterialId; "Product Material Id")
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
            column(productId; "Product Id")
            {
            }
            column(doNotIntegrateMaterial; "Do Not Integrate (Material)")
            {
            }
            column(doNotIntegrateSellable; "Do Not Integrate (Sellable)")
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
