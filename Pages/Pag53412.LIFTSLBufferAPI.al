page 53412 "ORB LIFT SL Buffer API"
{
    APIGroup = 'Orbus';
    APIPublisher = 'Orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'liftSLBufferAPI';
    DelayedInsert = true;
    EntityName = 'LIFTSalesOrderLines';
    EntitySetName = 'LIFTSalesOrderLines';
    PageType = API;
    SourceTable = "ORB LIFT Sales Line Buffer";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                }
                field(sellToCustomerNo; Rec."Sell-to Customer No.")
                {
                    Caption = 'Sell-to Customer No.';
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                }
                field(type; Rec."Type")
                {
                    Caption = 'Type';
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }
                field(shipmentDate; Rec."Shipment Date")
                {
                    Caption = 'Shipment Date';
                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                }
                field(unitPrice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                }
                field(lineDiscount; Rec."Line Discount %")
                {
                    Caption = 'Line Discount %';
                }
                field(lineDiscountAmount; Rec."Line Discount Amount")
                {
                    Caption = 'Line Discount Amount';
                }
                field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
                {
                    Caption = 'Shortcut Dimension 1 Code';
                }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                {
                    Caption = 'Shortcut Dimension 2 Code';
                }
                field(variantCode; Rec."Variant Code")
                {
                    Caption = 'Variant Code';
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                }
                field(requestedDeliveryDate; Rec."Requested Delivery Date")
                {
                    Caption = 'Requested Delivery Date';
                }
                field(promisedDeliveryDate; Rec."Promised Delivery Date")
                {
                    Caption = 'Promised Delivery Date';
                }
                field(plannedDeliveryDate; Rec."Planned Delivery Date")
                {
                    Caption = 'Planned Delivery Date';
                }
                field(plannedShipmentDate; Rec."Planned Shipment Date")
                {
                    Caption = 'Planned Shipment Date';
                }
                field(width; Rec.Width)
                {
                    Caption = 'Width';
                }
                field(height; Rec.Height)
                {
                    Caption = 'Height';
                }
                field(hardwarePrice; Rec."Hardware Price")
                {
                    Caption = 'Hardware Price';
                }
                field(graphicsPrice; Rec."Graphics Price")
                {
                    Caption = 'Graphics Price';
                }
                field(liftLineID; Rec."LIFT Line ID")
                {
                    Caption = 'LIFT Line ID';
                }
                field(liftStatus; Rec."ORB LIFT Status")
                {
                    Caption = 'LIFT Status';
                }
            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        LIFTSalesOrderMgmt.PropagateOnSalesLineInsert(Rec);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if Rec."ORB LIFT Status" = -1 then
            LIFTSalesOrderMgmt.PropagateOnSalesLineDelete(Rec)
        else
            LIFTSalesOrderMgmt.PropagateOnSalesLineModify(Rec);
    end;

    var
        LIFTSalesOrderMgmt: Codeunit "ORB LIFT Sales Order Mgmt";
}
