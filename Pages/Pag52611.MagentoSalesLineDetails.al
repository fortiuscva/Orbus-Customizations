page 52611 "ORB Magento Sales Line Details"
{
    ApplicationArea = All;
    Caption = 'Magento Sales Line Details';
    PageType = List;
    SourceTable = "Sales Line";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the type of document that you are about to create.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the document number.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the line number.';
                }
                field(Type; Rec."Type")
                {
                    ToolTip = 'Specifies the line type.';
                }
                field("Item No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
            }
        }
    }
}
