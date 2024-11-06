page 52638 "ORB LIFT Sales Line"
{
    APIGroup = 'orbus';
    APIPublisher = 'orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'LIFT SalesLine';
    DelayedInsert = true;
    EntityName = 'LIFTSalesLine';
    EntitySetName = 'LIFTSalesLine';
    PageType = API;
    ModifyAllowed = true;
    DeleteAllowed = true;
    InsertAllowed = true;
    SourceTable = "Sales Line";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(documentType; Rec."Document Type")
                {
                    ToolTip = 'Specifies the type of document that you are about to create.';
                }
                field(selltoCustomerNo; Rec."Sell-to Customer No.")
                {
                    ToolTip = 'Specifies the number of the customer.';
                }
                field(documentNo; Rec."Document No.")
                {
                    ToolTip = 'Specifies the document number.';
                }
                field(lineNo; Rec."Line No.")
                {
                    ToolTip = 'Specifies the line number.';
                }
                field(type; Rec."Type")
                {
                    ToolTip = 'Specifies the line type.';
                }
                field(no; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
                field(locationCode; Rec."Location Code")
                {
                    ToolTip = 'Specifies the inventory location from which the items sold should be picked and where the inventory decrease is registered.';
                }

                field(shipmentDate; Rec."Shipment Date")
                {
                    ToolTip = 'Specifies when items on the document are shipped or were shipped. A shipment date is usually calculated from a requested delivery date plus lead time.';
                }
                field(quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
                field(unitPrice; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the price for one unit on the line.';
                }
                field(lineDiscountPer; Rec."Line Discount %")
                {
                    ToolTip = 'Specifies the discount percentage that is granted for the item on the line.';
                }
                field(lineDiscountAmount; Rec."Line Discount Amount")
                {
                    ToolTip = 'Specifies the discount amount that is granted for the item on the line.';
                }
                field(variantCode; Rec."Variant Code")
                {
                    ToolTip = 'Specifies the variant of the item on the line.';
                }

                field(unitofMeasureCode; Rec."Unit of Measure Code")
                {
                    ToolTip = 'Specifies the unit of measure that is used to determine the value in the Unit Price field on the sales line.';
                }
                field(promisedDeliveryDate; Rec."Promised Delivery Date")
                {
                    ToolTip = 'Specifies the date that you have promised to deliver the order, as a result of the Order Promising function.';
                }
                field(shippingAgentCode; Rec."Shipping Agent Code")
                {
                    ToolTip = 'Specifies the code for the shipping agent who is transporting the items.';
                }
                field(shippingAgentServiceCode; Rec."Shipping Agent Service Code")
                {
                    ToolTip = 'Specifies the code for the service, such as a one-day delivery, that is offered by the shipping agent.';
                }
                field(hardwarePrice; Rec."Hardware Price")
                {
                    ToolTip = 'Specifies the value of the Hardware Price field.', Comment = '%';
                }
                field(graphicsPrice; Rec."Graphics Price")
                {
                    ToolTip = 'Specifies the value of the Graphics Price field.', Comment = '%';
                }
            }
        }
    }
}
