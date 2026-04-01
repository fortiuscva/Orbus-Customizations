page 53444 "ORB LIFT Product Line Values"
{
    ApplicationArea = All;
    Caption = 'LIFT Product Line Values';
    PageType = List;
    SourceTable = "ORB LIFT Product Line Values";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(VALUE_ID; Rec.VALUE_ID)
                {
                    ToolTip = 'Specifies the value of the VALUE_ID field.', Comment = '%';
                }
                field(VALUE; Rec."VALUE")
                {
                    ToolTip = 'Specifies the value of the VALUE field.', Comment = '%';
                }
                field("Product Line Dimension"; Rec."Product Line Dimension")
                {
                    ToolTip = 'Specifies the value of the Product Line Dimension field.', Comment = '%';
                }
                field("Category Id"; Rec."Category Id")
                {
                    ToolTip = 'Specifies the value of the Material Category Id field.', Comment = '%';
                }
                field("Subcategory Id"; Rec."Subcategory Id")
                {
                    ToolTip = 'Specifies the value of the Material Subcategory Id field.', Comment = '%';
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
