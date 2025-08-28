page 53411 "ORB LIFT SO Buffer API"
{
    APIGroup = 'Orbus';
    APIPublisher = 'Orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'liftSOBufferAPI';
    DelayedInsert = true;
    EntityName = 'LIFTSalesOrders';
    EntitySetName = 'LIFTSalesOrders';
    PageType = API;
    SourceTable = "ORB LIFT Sales Order Buffer";

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
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(billToCustomerNo; Rec."Bill-to Customer No.")
                {
                    Caption = 'Bill-to Customer No.';
                }
                field(billToName; Rec."Bill-to Name")
                {
                    Caption = 'Bill-to Name';
                }
                field(yourReference; Rec."Your Reference")
                {
                    Caption = 'Versapay ID';
                }
                field(shipToCode; Rec."Ship-to Code")
                {
                    Caption = 'Ship-to Code';
                }
                field(shipToName; Rec."Ship-to Name")
                {
                    Caption = 'Ship-to Name';
                }
                field(shipToName2; Rec."Ship-to Name 2")
                {
                    Caption = 'Ship-to Name 2';
                }
                field(shipToAddress; Rec."Ship-to Address")
                {
                    Caption = 'Ship-to Address';
                }
                field(shipToAddress2; Rec."Ship-to Address 2")
                {
                    Caption = 'Ship-to Address 2';
                }
                field(shipToCity; Rec."Ship-to City")
                {
                    Caption = 'Ship-to City';
                }
                field(shipToContact; Rec."Ship-to Contact")
                {
                    Caption = 'Ship-to Contact';
                }
                field(orderDate; Rec."Order Date")
                {
                    Caption = 'Order Date';
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }
                field(shipmentDate; Rec."Shipment Date")
                {
                    Caption = 'Shipment Date';
                }
                field(paymentTermsCode; Rec."Payment Terms Code")
                {
                    Caption = 'Payment Terms Code';
                }
                field(dueDate; Rec."Due Date")
                {
                    Caption = 'Due Date';
                }
                field(shipmentMethodCode; Rec."Shipment Method Code")
                {
                    Caption = 'Shipment Method Code';
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }
                field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
                {
                    Caption = 'Shortcut Dimension 1 Code';
                }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                {
                    Caption = 'Shortcut Dimension 2 Code';
                }
                field(customerPriceGroup; Rec."Customer Price Group")
                {
                    Caption = 'Customer Price Group';
                }
                field(salespersonCode; Rec."Salesperson Code")
                {
                    Caption = 'Salesperson Code';
                }
                field(sellToContact; Rec."Sell-to Contact")
                {
                    Caption = 'Sell-to Contact';
                }
                field(shipToPostCode; Rec."Ship-to Post Code")
                {
                    Caption = 'Ship-to Post Code';
                }
                field(shipToCounty; Rec."Ship-to County")
                {
                    Caption = 'Ship-to County';
                }
                field(shipToCountryRegionCode; Rec."Ship-to Country/Region Code")
                {
                    Caption = 'Ship-to Country/Region Code';
                }
                field(documentDate; Rec."Document Date")
                {
                    Caption = 'Document Date';
                }
                field(externalDocumentNo; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
                }
                field(paymentMethodCode; Rec."Payment Method Code")
                {
                    Caption = 'Payment Method Code';
                }
                field(shippingAgentCode; Rec."Shipping Agent Code")
                {
                    Caption = 'Shipping Agent Code';
                }
                field(workDescription; Rec."Work Description")
                {
                    Caption = 'Work Description';
                }
                field(sellToContactNo; Rec."Sell-To Contact No.")
                {
                    Caption = 'Sell-To Contact No.';
                }
                field(shippingAdvice; Rec."Shipping Advice")
                {
                    Caption = 'Shipping Advice';
                }
                field(shippingAgentServiceCode; Rec."Shipping Agent Service Code")
                {
                    Caption = 'Shipping Agent Service Code';
                }
                field(orderStatus; Rec."Order Status")
                {
                    Caption = 'Order Status';
                }
                field(locationOverride; Rec."Location Override")
                {
                    Caption = 'Location Override';
                }
                field(createdBy; Rec.Created_By)
                {
                    Caption = 'Created_By';
                }
                field(rush; Rec.Rush)
                {
                    Caption = 'Rush';
                }
                field(orbCustomerSupport; Rec."ORB Customer Support")
                {
                    Caption = 'Customer Support';
                }
                field(orbDeclaredValue; Rec."ORB Declared Value")
                {
                    Caption = 'Declared Value';
                }
                field(orbInternationalContact; Rec."ORB International Contact")
                {
                    Caption = 'International Contact';
                }
                field(orbMagentoOrder; Rec."ORB Magento Order #")
                {
                    Caption = 'Magento Order #';
                }
                field(orbMagentoCC4Digits; Rec."ORB Magento CC 4 Digits")
                {
                    Caption = 'Magento CC 4 Digits';
                }
                field(salesOrderPaymentType; Rec."Sales Order Payment Type")
                {
                    Caption = 'Sales Order Payment Type';
                }
                field(soPaymentAccountNo; Rec."SO Payment Account No.")
                {
                    Caption = 'Sales Order Payment Account No.';
                }
                field(inHandsDate; Rec."In-Hands Date")
                {
                    Caption = 'In-Hands Date';
                }
                field(createdAt; Rec."Created At")
                {
                    Caption = 'Created At';
                }
                field(liftStatus; Rec."ORB LIFT Status")
                {
                    Caption = 'LIFT Status';
                }
                field(paymentPostalCode; Rec."Payment Postal Code")
                {
                    Caption = 'Payment Postal Code';
                }
                field(paymentProvince; Rec."Payment Province")
                {
                    Caption = 'Payment Province';
                }
                field(paymentCountryCode; Rec."Payment Country Code")
                {
                    Caption = 'Payment Country Code';
                }
                field(artNote; Rec."ORB LIFT ART_NOTE")
                {
                    Caption = 'LIFT ART_NOTE';
                }
                field(productionNote; Rec."ORB LIFT PRODUCTION_NOTE")
                {
                    Caption = 'LIFT PRODUCTION_NOTE';
                }
                field(liftCancellationStatus; Rec."ORB LIFT Cancellation Status")
                {
                    Caption = 'LIFT Cancellation Status';
                }
                field(liftTotalLinesCount; Rec."ORB LIFT Total Lines Count")
                {
                    Caption = 'LIFT Total Lines Count';
                }
                field(liftCommentLinesCount; Rec."ORB LIFT Comment Lines Count")
                {
                    Caption = 'LIFT Comment Lines Count';
                }
                field(liftItemLinesCount; Rec."ORB LIFT Item Lines Count")
                {
                    Caption = 'LIFT Item Lines Count';
                }
            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        LIFTSalesOrderMgmt.PropagateOnSalesHeaderInsert(Rec);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if Rec."ORB LIFT Cancellation Status" = -1 then
            LIFTSalesOrderMgmt.PropagateOnSalesOrderDelete(Rec)
        else
            LIFTSalesOrderMgmt.PropagateOnSalesHeaderModify(Rec);
    end;


    var
        LIFTSalesOrderMgmt: Codeunit "ORB LIFT Sales Order Mgmt";
}
