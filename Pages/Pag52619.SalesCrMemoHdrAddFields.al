page 52619 "Sales Cr.Memo Hdr Add. Fields"
{
    ApplicationArea = All;
    Caption = 'Sales Cr.Memo Hdr Add. Fields';
    PageType = List;
    SourceTable = "Sales Cr.Memo Hdr Add. Fields";
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
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
