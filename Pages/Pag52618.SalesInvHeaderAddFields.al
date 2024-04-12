page 52618 "Sales Inv. Header Add. Fields"
{
    ApplicationArea = All;
    Caption = 'Sales Inv. Header Add. Fields';
    PageType = Card;
    SourceTable = "Sales Inv. Header Add. Fields";
    UsageCategory = Documents;
    Editable = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Direct to show Label"; Rec."Direct to show Label")
                {
                    ToolTip = 'Specifies the value of the Direct to show Label field.';
                }
                field("Production timeline"; Rec."Production timeline")
                {
                    ToolTip = 'Specifies the value of the Production timeline field.';
                }
            }
        }
    }
}
