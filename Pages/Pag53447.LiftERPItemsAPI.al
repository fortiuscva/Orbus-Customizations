page 53447 "ORB Lift ERP Items API"
{
    APIGroup = 'orbus';
    APIPublisher = 'orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'liftERPItemsAPI';
    DelayedInsert = true;
    EntityName = 'LiftItemsAPI';
    EntitySetName = 'LiftItemsAPI';
    PageType = API;
    SourceTable = "ORB LIFT ERP Item";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                }
                field(variantCode; Rec."Variant Code")
                {
                    Caption = 'Variant Code';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(productName; Rec."Product Name")
                {
                    Caption = 'Product Name';
                }
                field(productType; Rec."Product Type")
                {
                    Caption = 'Product Type';
                }
                field(catalogId; Rec."Catalog Id")
                {
                    Caption = 'Catalog Id';
                }
                field(materialId; Rec."Material Id")
                {
                    Caption = 'Material Id';
                }
                field(storageTypeId; Rec."Storage Type Id")
                {
                    Caption = 'Storage Type Id';
                }
                field(productId; Rec."Product Id")
                {
                    Caption = 'Product Id';
                }
                field(productMaterialId; Rec."Product Material Id")
                {
                    Caption = 'Product Material Id';
                }
                field(materialCategoryId; Rec."Material Category Id")
                {
                    Caption = 'Material Category Id';
                }
                field(materialSubcategoryId; Rec."Material Subcategory Id")
                {
                    Caption = 'Material Subcategory Id';
                }
                field(materialTypeId; Rec."Material Type Id")
                {
                    Caption = 'Material Type Id';
                }
                field(primaryVendorId; Rec."Primary Vendor Id")
                {
                    Caption = 'Primary Vendor Id';
                }
                field(prodLineDimId; Rec."Prod Line Dim Id")
                {
                    Caption = 'Prod Line Dim Id';
                }
                field(shipFromWhseLocId; Rec."Ship From Whse Loc Id")
                {
                    Caption = 'Ship From Whse Loc Id';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Product Status';
                }
                field(unitCost; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                }
                field(hasVariants; Rec."Has Variants")
                {
                    Caption = 'Has Variants';
                }
                field(printFormat; Rec."Print Format")
                {
                    Caption = 'Print Format';
                }
                field(doNotIntegrateMaterial; Rec."Do Not Integrate (Material)")
                {
                    Caption = 'Do Not Integrate (Material)';
                }
                field(doNotIntegrateSellable; Rec."Do Not Integrate (Sellable)")
                {
                    Caption = 'Do Not Integrate (Sellable)';
                }
                field(toBeSynchronized; Rec."To Be Synchronized")
                {
                    Caption = 'To Be Synchronized';
                }
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'SystemCreatedAt';
                }
                field(systemModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'SystemModifiedAt';
                }
            }
        }
    }
}
