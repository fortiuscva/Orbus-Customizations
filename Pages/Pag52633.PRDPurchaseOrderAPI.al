page 52633 "ORB PRD Purchase Order API"
{
    APIGroup = 'orbus';
    APIPublisher = 'orbus';
    APIVersion = 'v1.0';

    ApplicationArea = All;
    Caption = 'PRD Purchase Order API';
    DelayedInsert = true;

    EntityName = 'PurchaseOrder';
    EntityCaption = 'PRD Purchase Order';
    EntitySetName = 'PurchaseOrders';
    EntitySetCaption = 'PRD Purchase Orders';

    PageType = API;
    SourceTable = "Purchase Header";
    SourceTableView = where("Document Type" = const(Order));

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(yourReference; Rec."Your Reference")
                {
                    Caption = 'yourReference', Locked = true;
                }
                field(No; Rec."No.")
                { }
                field(buyFromVendorNo; Rec."Buy-from Vendor No.")
                {
                    Caption = 'buyFromVendorNo', Locked = true;
                }
                field(buyFromVendorName; Rec."Buy-from Vendor Name")
                {
                    Caption = 'buyFromVendorName', Locked = true;
                }
                field(expectedReceiptDate; Rec."Expected Receipt Date")
                {
                    Caption = 'expectedReceiptDate', Locked = true;
                }
                field(Location_Code; Rec."Location Code")
                { }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                { }
                field(Assigned_User_ID; Rec."Assigned User ID")
                { }
                field(vendorOrderNo; Rec."Vendor Order No.")
                {
                    Caption = 'vendorOrderNo', Locked = true;
                }
                field(vendorInvoiceNo; Rec."Vendor Invoice No.")
                {
                    Caption = 'vendorInvoiceNo', Locked = true;
                }
                field(vendorShipmentNo; Rec."Vendor Shipment No.")
                {
                    Caption = 'vendorShipmentNo', Locked = true;
                }
            }
        }
    }
}