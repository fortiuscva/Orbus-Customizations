page 52615 "Sales Header Additional Fields"
{
    ApplicationArea = All;
    Caption = 'Sales Header Additional Fields';
    PageType = Document;
    SourceTable = "Sales Header Additional Fields";

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