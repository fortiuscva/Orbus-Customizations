page 52609 "Magento Sales Header Details"
{
    ApplicationArea = All;
    Caption = 'Magento Sales Header Details';
    PageType = List;
    SourceTable = "ORB Magento SalesHdr Details";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Bill-to Contact"; Rec."Bill-to Contact")
                {
                    ToolTip = 'Specifies the value of the Bill-to Contact field.';
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ToolTip = 'Specifies the value of the Sell-to Customer No. field.';
                }
                field("Sell-to E-Mail"; Rec."Sell-to E-Mail")
                {
                    ToolTip = 'Specifies the value of the Sell-to E-Mail field.';
                }
                field("Magento Order #"; Rec."Magento Order #")
                {
                    ToolTip = 'Specifies the value of the Magento Order # field.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
                field("Magento Artwork Job ID"; Rec."Magento Artwork Job ID")
                {
                    ToolTip = 'Specifies the value of the Magento Artwork Job ID field.';
                }
                field("Ship-to Contact"; Rec."Ship-to Contact")
                {
                    ToolTip = 'Specifies the value of the Ship-to Contact field.';
                }
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ToolTip = 'Specifies the value of the Ship-to Name field.';
                }
                field("Ship-to Address"; Rec."Ship-to Address")
                {
                    ToolTip = 'Specifies the value of the Ship-to Address field.';
                }
                field("Ship-to-Address 2"; Rec."Ship-to-Address 2")
                {
                    ToolTip = 'Specifies the value of the Ship-to-Address 2 field.';
                }
                field("Ship-to City"; Rec."Ship-to City")
                {
                    ToolTip = 'Specifies the value of the Ship-to City field.';
                }
                field("Ship-to County"; Rec."Ship-to County")
                {
                    ToolTip = 'Specifies the value of the Ship-to County field.';
                }
                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    ToolTip = 'Specifies the value of the Ship-to Post Code field.';
                }
                field("Ship-to Country/Region Code"; Rec."Ship-to Country/Region Code")
                {
                    ToolTip = 'Specifies the value of the Ship-to Country/Region Code field.';
                }
                field("Ship-to Phone No."; Rec."Ship-to Phone No.")
                {
                    ToolTip = 'Specifies the value of the Ship-to Phone No. field.';
                }
                field("Magento CC 4 Digits"; Rec."Magento CC 4 Digits")
                {
                    ToolTip = 'Specifies the value of the Magento CC 4 Digits field.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ToolTip = 'Specifies the value of the External Document No. field.';
                }
                field("In-Hands Date"; Rec."In-Hands Date")
                {
                    ToolTip = 'Specifies the value of the In-Hands Date field.';
                }
                field("Magento Direct to show Label"; Rec."Magento Direct to show Label")
                {
                    ToolTip = 'Specifies the value of the Magento Direct to show Label field.';
                }
                field("Shipping Agent Service Code"; Rec."Shipping Agent Service Code")
                {
                    ToolTip = 'Specifies the value of the Shipping Agent Service Code field.';
                }
                field("Shipping Agent Code"; Rec."Shipping Agent Code")
                {
                    ToolTip = 'Specifies the value of the Shipping Agent Code field.';
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ToolTip = 'Specifies the value of the Shipment Date field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the value of the Location Code" field.';
                }
            }
        }
    }
}
