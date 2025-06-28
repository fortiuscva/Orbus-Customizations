page 53413 "ORB LIFT Sales Orders"
{
    ApplicationArea = All;
    Caption = 'LIFT Sales Orders';
    PageType = List;
    SourceTable = "ORB LIFT Sales Order Buffer";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field.', Comment = '%';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ToolTip = 'Specifies the value of the Sell-to Customer No. field.', Comment = '%';
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ToolTip = 'Specifies the value of the Bill-to Customer No. field.', Comment = '%';
                }
                field("Your Reference"; Rec."Your Reference")
                {
                    Caption = 'Versapay ID';
                    ToolTip = 'Specifies the value of the Versapay ID field.', Comment = '%';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.', Comment = '%';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.', Comment = '%';
                }
                field("Order Date"; Rec."Order Date")
                {
                    ToolTip = 'Specifies the value of the Order Date field.', Comment = '%';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ToolTip = 'Specifies the value of the Due Date field.', Comment = '%';
                }
                field("In-Hands Date"; Rec."In-Hands Date")
                {
                    ToolTip = 'Specifies the value of the In-Hands Date field.', Comment = '%';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ToolTip = 'Specifies the value of the External Document No. field.', Comment = '%';
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ToolTip = 'Specifies the value of the Salesperson Code field.', Comment = '%';
                }
                field("Order Status"; Rec."Order Status")
                {
                    ToolTip = 'Specifies the value of the Order Status field.', Comment = '%';
                }
                field(Created_By; Rec.Created_By)
                {
                    ToolTip = 'Specifies the value of the Created_By field.', Comment = '%';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the value of the Location Code field.', Comment = '%';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.', Comment = '%';
                }
                field("Shipping Agent Code"; Rec."Shipping Agent Code")
                {
                    ToolTip = 'Specifies the value of the Shipping Agent Code field.', Comment = '%';
                }
                field("Shipping Agent Service Code"; Rec."Shipping Agent Service Code")
                {
                    ToolTip = 'Specifies the value of the Shipping Agent Service Code field.', Comment = '%';
                }
                field("Ship-to Address"; Rec."Ship-to Address")
                {
                    ToolTip = 'Specifies the value of the Ship-to Address field.', Comment = '%';
                }
                field("Ship-to Address 2"; Rec."Ship-to Address 2")
                {
                    ToolTip = 'Specifies the value of the Ship-to Address 2 field.', Comment = '%';
                }
                field("Ship-to City"; Rec."Ship-to City")
                {
                    ToolTip = 'Specifies the value of the Ship-to City field.', Comment = '%';
                }
                field("Ship-to County"; Rec."Ship-to County")
                {
                    ToolTip = 'Specifies the value of the Ship-to County field.', Comment = '%';
                }
                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    ToolTip = 'Specifies the value of the Ship-to Post Code field.', Comment = '%';
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ToolTip = 'Specifies the value of the Shipment Date field.', Comment = '%';
                }
                field("ORB Magento Order #"; Rec."ORB Magento Order #")
                {
                    ToolTip = 'Specifies the value of the Magento Order # field.', Comment = '%';
                }
                field("ORB Magento CC 4 Digits"; Rec."ORB Magento CC 4 Digits")
                {
                    ToolTip = 'Specifies the value of the Magento CC 4 Digits field.', Comment = '%';
                }
            }
        }
    }
}
