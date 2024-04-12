page 52617 "Sales Shipment Hdr Add. Fields"
{
    ApplicationArea = All;
    Caption = 'Sales Shipment Hdr Add. Fields';
    PageType = List;
    SourceTable = "Sales Shipment Hdr Add. Fields";
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
