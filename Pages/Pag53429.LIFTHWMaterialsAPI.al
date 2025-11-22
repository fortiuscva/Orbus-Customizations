page 53429 "ORB LIFT HW Materials API"
{
    APIGroup = 'orbus';
    APIPublisher = 'orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'Hardware Materials API';
    DelayedInsert = true;
    EntityName = 'HardwareMaterialsAPI';
    EntitySetName = 'HardwareMaterialsAPI';
    PageType = API;
    SourceTable = Item;
    SourceTableView = where(Blocked = const(false), "Department Dimension" = const('01'), "ORB Stroage Type Id" = filter(<> 0), "ORB Do Not Integrate" = const(false));

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
                // field(shortDescription; Rec."Short Description")
                // {
                //     Caption = 'Short Description';
                // }
                // field(longDescription; Rec."Long Description")
                // {
                //     Caption = 'Long Description';
                // }
                // field(searchDescription; Rec."Search Description")
                // {
                //     Caption = 'Search Description';
                // }
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
                // field(blocked; Rec.Blocked)
                // {
                //     Caption = 'Blocked';
                // }
                // field(type; Rec."Type")
                // {
                //     Caption = 'Type';
                // }
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
                // field(divisionDimension; Rec."Division Dimension")
                // {
                //     Caption = 'Division Dimension';
                // }
                // field(materialDimension; Rec."Material Dimension")
                // {
                //     Caption = 'Material Dimension';
                // }
                field(productLineDimension; Rec."Product Line Dimension")
                {
                    Caption = 'Product Line Dimension';
                }
                field(orbHasActiveVariants; Rec."ORB Has Active Variants")
                {
                    Caption = 'Has Active Variants';
                }
            }
        }
    }
}
