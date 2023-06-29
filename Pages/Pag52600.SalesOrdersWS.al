page 52600 "ORB Sales Orders WS"
{
    ApplicationArea = All;
    Caption = 'Sales Orders WS';
    PageType = List;
    SourceTable = "Sales Header";
    UsageCategory = Lists;
    SourceTableView = where("Document Type" = const(Order));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the estimate.';
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ToolTip = 'Specifies the number of the customer that you invoiced the items to.';
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ToolTip = 'Specifies the customer''s name.';
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ToolTip = 'Specifies the number of the customer that the invoice is sent to.';
                }
                field("Bill-to Name"; Rec."Bill-to Name")
                {
                    ToolTip = 'Specifies the name of the customer that the items are shipped to.';
                }
                field("Order Status"; Rec."Order Status")
                {
                    ToolTip = 'Specifies the value of the Order Status field.';
                }

            }
        }
    }
}
