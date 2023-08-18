page 52603 "ORB ORBAPISalesHeaderDetails"
{
    APIGroup = 'Orbus';
    APIPublisher = 'Orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'orbapiSalesHeaderDetails';
    DelayedInsert = true;
    EntityName = 'salesHeaderDetailsAPI';
    EntitySetName = 'salesHeaderDetailsAPI';
    PageType = API;
    SourceTable = "Sales Header";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(sellToCustomerNo; Rec."Sell-to Customer No.")
                {
                    Caption = 'Sell-to Customer No.';
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }
                field(shipToCode; Rec."Ship-to Code")
                {
                    Caption = 'Ship-to Code';
                }
                field(paymentTermsCode; Rec."Payment Terms Code")
                {
                    Caption = 'Payment Terms Code';
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                }
                field(amountIncludingVAT; Rec."Amount Including VAT")
                {
                    Caption = 'Amount Including VAT';
                }
                field(externalDocumentNo; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
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
                field(needsApproval; Rec.Needs_Approval)
                {
                    Caption = 'Needs Approval';
                }
                field(artEmail; Rec.ArtEmail)
                {
                    Caption = 'Email (Art)';
                }
                field(upsAccountNumber; Rec."UPS Account Number")
                {
                    Caption = 'UPS Account Number';
                }
                field(fedExAccountNumber; Rec."FedEx Account Number")
                {
                    Caption = 'FedEx Account Number';
                }
                field(graphicsOnly; Rec."Graphics Only")
                {
                    Caption = 'Graphics Only';
                }
                field(custom; Rec.Custom)
                {
                    Caption = 'Custom';
                }
                field(rush; Rec.Rush)
                {
                    Caption = 'Rush';
                }
                field(tFlowStatus; Rec.TFlowStatus)
                {
                    Caption = 'TFlowStatus';
                }
                field(salesOrderCreatedBy; Rec."Sales Order Created By")
                {
                    Caption = 'Sales Order Created By';
                }
                field(salesOrderAssignedTo; Rec."Sales Order Assigned To")
                {
                    Caption = 'Sales Order Assigned To';
                }
                field(salesOrderPaymentType; Rec."Sales Order Payment Type")
                {
                    Caption = 'Sales Order Payment Type';
                }
                field(soPaymentAccountNo; Rec."SO Payment Account No.")
                {
                    Caption = 'Sales Order Payment Account No.';
                }
                field(salesOrderShipmentMethod; Rec."Sales Order Shipment Method")
                {
                    Caption = 'Sales Order Shipment Method';
                }
                field(warehousePickNo; Rec."Warehouse Pick No.")
                {
                    Caption = 'Warehouse Pick No.';
                }
                field(registeredWarehousePickNo; Rec."Registered Warehouse Pick No.")
                {
                    Caption = 'Registered Warehouse Pick No.';
                }
                field(industryShortcutDimension; Rec."Industry Shortcut Dimension")
                {
                    Caption = 'Industry Shortcut Dimension';
                }
                field(paymentTypeNew; Rec."Payment Type (new)")
                {
                    Caption = 'Payment Type (new)';
                }
                field(prepaymentReceieved; Rec."Prepayment Receieved")
                {
                    Caption = 'Prepayment Receieved';
                }
                field(reportartEmail; Rec."Art Email")
                {
                    Caption = 'Rep.Art Email';
                }
                field(inHandsDate; Rec."In-Hands Date")
                {
                    Caption = 'In-Hands Date';
                }
                field(sellToContactNoCustom; Rec."Sell-To Contact No. (Custom)")
                {
                    Caption = 'Sell-To Contact No. (Custom)';
                }
                field(sellToPhoneNoCustom; Rec."Sell-To Phone No. (Custom)")
                {
                    Caption = 'Sell-To Phone No. (Custom)';
                }
                field(sellToEmailCustom; Rec."Sell-To Email (Custom)")
                {
                    Caption = 'Sell-To Email (Custom)';
                }
                field(sellToContactNameCustom; Rec."Sell-To Contact Name (Custom)")
                {
                    Caption = 'Sell-To Contact Name (Custom)';
                }
                field(projectNo; Rec."Project No.")
                {
                    Caption = 'Project No.';
                }
                field(approvalDeadline; Rec."Approval Deadline")
                {
                    Caption = 'Approval Deadline';
                }
            }
        }
    }
}
