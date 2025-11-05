page 53429 "ORB LIFT Materials API"
{
    APIGroup = 'orbus';
    APIPublisher = 'orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'orbLIFTMaterialsAPI';
    DelayedInsert = true;
    EntityName = 'LIFTMaterialsAPI';
    EntitySetName = 'LIFTMaterialsAPI';
    PageType = API;
    SourceTable = Item;
    SourceTableView = where("No." = filter('GVNL-ACV-FLATMX-98'));
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
                field(shortDescription; Rec."Short Description")
                {
                    Caption = 'Short Description';
                }
                field(longDescription; Rec."Long Description")
                {
                    Caption = 'Long Description';
                }
                field(searchDescription; Rec."Search Description")
                {
                    Caption = 'Search Description';
                }
                field(materialId; Rec."ORB Material Id")
                {
                    Caption = 'Material Id';
                }
                field(storageTypeId; Rec."ORB Stroage Type Id")
                {
                    Caption = 'Stroage Type Id';
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                }
                field(type; Rec."Type")
                {
                    Caption = 'Type';
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
                field(divisionDimension; Rec."Division Dimension")
                {
                    Caption = 'Division Dimension';
                }
                field(productLineDimension; Rec."Product Line Dimension")
                {
                    Caption = 'Product Line Dimension';
                }
            }
        }
    }
}
