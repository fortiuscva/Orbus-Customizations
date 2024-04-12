page 52616 "Sales Header Arch. Add. Fields"
{
    ApplicationArea = All;
    Caption = 'Sales Header Arch. Add. Fields';
    PageType = Document;
    SourceTable = "Sales Header Arch. Add. Fields";
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
