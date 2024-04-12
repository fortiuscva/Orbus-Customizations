page 52618 "Sales Inv. Header Add. Fields"
{
    ApplicationArea = All;
    Caption = 'Sales Inv. Header Add. Fields';
    PageType = List;
    SourceTable = "Sales Inv. Header Add. Fields";
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
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
