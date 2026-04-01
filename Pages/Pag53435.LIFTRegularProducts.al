page 53435 "ORB LIFT Regular Products"
{
    APIGroup = 'orbus';
    APIPublisher = 'orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'Regular Products API';
    DelayedInsert = true;
    EntityName = 'RegularProductsAPI';
    EntitySetName = 'RegularProductsAPI';
    PageType = API;
    SourceTable = Item;
    SourceTableView = where(Blocked = const(false), "ORB Do Not Integrate (Sell)" = const(false));

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(productId; Rec."ORB Product Id")
                {
                    Caption = 'Product ID';
                }
                field(materialId; Rec."ORB Material Id")
                {
                    Caption = 'Material Id';
                }
                field(materialName; Rec."ORB Material Name")
                {
                    Caption = 'Material Name';
                }
                field(storageTypeId; Rec."ORB Stroage Type Id")
                {
                    Caption = 'Stroage Type Id';
                }
                field(storageTypeName; Rec."ORB Storage Type Name")
                {
                    Caption = 'Storage Type Name';
                }
                field(warehouseLocationId; Rec."ORB Warehouse Location Id")
                {
                    Caption = 'Warehouse Location Id';
                }
                field(baseUnitOfMeasure; Rec."Base Unit of Measure")
                {
                    Caption = 'Base Unit of Measure';
                }
                field(itemCategoryCode; Rec."Item Category Code")
                {
                    Caption = 'Item Category Code';
                }
                field(departmentDimension; Rec."Department Dimension")
                {
                    Caption = 'Department Dimension';
                }
                field(unitCost; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                }
                field(productLineDimensionId; Rec."ORB Product Line Dimension Id")
                {
                    Caption = 'Product Line Dimension Id';
                }
                field(productLineDimension; Rec."Product Line Dimension")
                {
                    Caption = 'Product Line Dimension';
                }
                field(orbHasActiveVariants; Rec."ORB Has Active Variants")
                {
                    Caption = 'Has Active Variants';
                }
                field(orbParentItemNo; Rec."ORB Parent Item No.")
                {
                    Caption = 'Parent Item No.';
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
