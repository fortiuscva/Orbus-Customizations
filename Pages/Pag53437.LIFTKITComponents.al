page 53437 "ORB LIFT KIT Components"
{
    APIGroup = 'orbus';
    APIPublisher = 'orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'orbLIFTKITComponents';
    DelayedInsert = true;
    EntityName = 'KITComponentsAPI';
    EntitySetName = 'KITComponentsAPI';
    PageType = API;
    SourceTable = "BOM Component";
    SourceTableView = where("ORB LIFT Parent Product ID" = filter(<> 0), "ORB Do Not Integrate (Sell)" = const(false));
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(parentItemNo; Rec."Parent Item No.")
                {
                    Caption = 'Parent Item No.';
                }
                field(parentProductId; Rec."ORB LIFT Parent Product ID")
                {
                    Caption = 'Parent Product ID';
                }
                // field(lineNo; Rec."Line No.")
                // {
                //     Caption = 'Line No.';
                // }
                // field(type; Rec."Type")
                // {
                //     Caption = 'Type';
                // }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(productId; Rec."ORB LIFT Product ID")
                {
                    Caption = 'Product ID';
                }
                field(assemblyBOM; Rec."Assembly BOM")
                {
                    Caption = 'Assembly BOM';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                }
                field(quantityPer; Rec."Quantity per")
                {
                    Caption = 'Quantity per';
                }
                field(bomDescription; Rec."BOM Description")
                {
                    Caption = 'BOM Description';
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
