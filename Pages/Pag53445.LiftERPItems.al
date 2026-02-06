page 53445 "ORB Lift ERP Items"
{
    ApplicationArea = All;
    Caption = 'Lift ERP Items';
    PageType = List;
    SourceTable = "ORB LIFT ERP Item";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.', Comment = '%';
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ToolTip = 'Specifies the value of the Variant Code field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Product Name"; Rec."Product Name")
                {
                    ToolTip = 'Specifies the value of the Product Name field.', Comment = '%';
                }
                field("Material Id"; Rec."Material Id")
                {
                    ToolTip = 'Specifies the value of the Material Id field.', Comment = '%';
                }
                field("Storage Type Id"; Rec."Storage Type Id")
                {
                    ToolTip = 'Specifies the value of the Storage Type Id field.', Comment = '%';
                }
                field("Product Id"; Rec."Product Id")
                {
                    ToolTip = 'Specifies the value of the Product Id field.', Comment = '%';
                }
                field("Product Material Id"; Rec."Product Material Id")
                {
                    ToolTip = 'Specifies the value of the Product Material Id field.', Comment = '%';
                }
                field("Product Type"; Rec."Product Type")
                {
                    ToolTip = 'Specifies the value of the Product Type field.', Comment = '%';
                }
                field("Catalog Id"; Rec."Catalog Id")
                {
                    ToolTip = 'Specifies the value of the Catalog Id field.', Comment = '%';
                }
                field("Material Type Id"; Rec."Material Type Id")
                {
                    ToolTip = 'Specifies the value of the Material Type Id field.', Comment = '%';
                }
                field("Material Category Id"; Rec."Material Category Id")
                {
                    ToolTip = 'Specifies the value of the Material Category Id field.', Comment = '%';
                }
                field("Material Subcategory Id"; Rec."Material Subcategory Id")
                {
                    ToolTip = 'Specifies the value of the Material Subcategory Id field.', Comment = '%';
                }
                field("Primary Vendor Id"; Rec."Primary Vendor Id")
                {
                    ToolTip = 'Specifies the value of the Primary Vendor Id field.', Comment = '%';
                }
                field("Prod Line Dim Id"; Rec."Prod Line Dim Id")
                {
                    ToolTip = 'Specifies the value of the Prod Line Dim Id field.', Comment = '%';
                }
                field("Ship From Whse Loc Id"; Rec."Ship From Whse Loc Id")
                {
                    ToolTip = 'Specifies the value of the Ship From Whse Loc Id field.', Comment = '%';
                }
                field("Print Format"; Rec."Print Format")
                {
                    ToolTip = 'Specifies the value of the Print Format field.', Comment = '%';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ToolTip = 'Specifies the value of the Unit Cost field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Product Status field.', Comment = '%';
                }
                field("Do Not Integrate"; Rec."Do Not Integrate")
                {
                    ToolTip = 'Specifies the value of the Do Not Integrate field.', Comment = '%';
                }
                field("Do Not Integrate (Sellable)"; Rec."Do Not Integrate (Sellable)")
                {
                    ToolTip = 'Specifies the value of the Do Not Integrate (Sellable) field.', Comment = '%';
                }
                field("To Be Synchronized"; Rec."To Be Synchronized")
                {
                    ToolTip = 'Specifies the value of the To Be Synchronized field.', Comment = '%';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'Created At';
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'Modified At';
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.', Comment = '%';
                }
            }
        }
    }
}
