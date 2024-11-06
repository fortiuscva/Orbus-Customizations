page 52636 "ORB LIFT Sales Header"
{
    APIGroup = 'Orbus';
    APIPublisher = 'Orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'liftSalesHeader';
    DelayedInsert = true;
    EntityName = 'LIFTSalesHeader';
    EntitySetName = 'LIFTSalesHeader';
    PageType = API;
    SourceTable = "Sales Header";

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
                field(billToName2; Rec."Bill-to Name 2")
                {
                    Caption = 'Bill-to Name 2';
                }
                field(billToAddress; Rec."Bill-to Address")
                {
                    Caption = 'Bill-to Address';
                }
                field(billToAddress2; Rec."Bill-to Address 2")
                {
                    Caption = 'Bill-to Address 2';
                }
                field(billToCity; Rec."Bill-to City")
                {
                    Caption = 'Bill-to City';
                }
                field(billToContact; Rec."Bill-to Contact")
                {
                    Caption = 'Bill-to Contact';
                }
                field(yourReference; Rec."Your Reference")
                {
                    Caption = 'Your Reference';
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
                field(postingDescription; Rec."Posting Description")
                {
                    Caption = 'Posting Description';
                }
                field(paymentTermsCode; Rec."Payment Terms Code")
                {
                    Caption = 'Payment Terms Code';
                }
                field(dueDate; Rec."Due Date")
                {
                    Caption = 'Due Date';
                }
                field(paymentDiscount; Rec."Payment Discount %")
                {
                    Caption = 'Payment Discount %';
                }
                field(pmtDiscountDate; Rec."Pmt. Discount Date")
                {
                    Caption = 'Pmt. Discount Date';
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
                field(customerPostingGroup; Rec."Customer Posting Group")
                {
                    Caption = 'Customer Posting Group';
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                }
                field(currencyFactor; Rec."Currency Factor")
                {
                    Caption = 'Currency Factor';
                }
                field(customerPriceGroup; Rec."Customer Price Group")
                {
                    Caption = 'Customer Price Group';
                }
                field(pricesIncludingVAT; Rec."Prices Including VAT")
                {
                    Caption = 'Prices Including VAT';
                }
                field(invoiceDiscCode; Rec."Invoice Disc. Code")
                {
                    Caption = 'Invoice Disc. Code';
                }
                field(customerDiscGroup; Rec."Customer Disc. Group")
                {
                    Caption = 'Customer Disc. Group';
                }
                field(languageCode; Rec."Language Code")
                {
                    Caption = 'Language Code';
                }
                field(formatRegion; Rec."Format Region")
                {
                    Caption = 'Format Region';
                }
                field(salespersonCode; Rec."Salesperson Code")
                {
                    Caption = 'Salesperson Code';
                }
                field(orderClass; Rec."Order Class")
                {
                    Caption = 'Order Class';
                }
                field(comment; Rec.Comment)
                {
                    Caption = 'Comment';
                }
                field(noPrinted; Rec."No. Printed")
                {
                    Caption = 'No. Printed';
                }
                field(onHold; Rec."On Hold")
                {
                    Caption = 'On Hold';
                }
                field(appliesToDocType; Rec."Applies-to Doc. Type")
                {
                    Caption = 'Applies-to Doc. Type';
                }
                field(appliesToDocNo; Rec."Applies-to Doc. No.")
                {
                    Caption = 'Applies-to Doc. No.';
                }
                field(balAccountNo; Rec."Bal. Account No.")
                {
                    Caption = 'Bal. Account No.';
                }
                field(recalculateInvoiceDisc; Rec."Recalculate Invoice Disc.")
                {
                    Caption = 'Recalculate Invoice Disc.';
                }
                field(ship; Rec.Ship)
                {
                    Caption = 'Ship';
                }
                field(invoice; Rec.Invoice)
                {
                    Caption = 'Invoice';
                }
                field(printPostedDocuments; Rec."Print Posted Documents")
                {
                    Caption = 'Print Posted Documents';
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                }
                field(amountIncludingVAT; Rec."Amount Including VAT")
                {
                    Caption = 'Amount Including VAT';
                }
                field(shippingNo; Rec."Shipping No.")
                {
                    Caption = 'Shipping No.';
                }
                field(postingNo; Rec."Posting No.")
                {
                    Caption = 'Posting No.';
                }
                field(lastShippingNo; Rec."Last Shipping No.")
                {
                    Caption = 'Last Shipping No.';
                }
                field(lastPostingNo; Rec."Last Posting No.")
                {
                    Caption = 'Last Posting No.';
                }
                field(prepaymentNo; Rec."Prepayment No.")
                {
                    Caption = 'Prepayment No.';
                }
                field(lastPrepaymentNo; Rec."Last Prepayment No.")
                {
                    Caption = 'Last Prepayment No.';
                }
                field(prepmtCrMemoNo; Rec."Prepmt. Cr. Memo No.")
                {
                    Caption = 'Prepmt. Cr. Memo No.';
                }
                field(lastPrepmtCrMemoNo; Rec."Last Prepmt. Cr. Memo No.")
                {
                    Caption = 'Last Prepmt. Cr. Memo No.';
                }
                field(vatRegistrationNo; Rec."VAT Registration No.")
                {
                    Caption = 'VAT Registration No.';
                }
                field(combineShipments; Rec."Combine Shipments")
                {
                    Caption = 'Combine Shipments';
                }
                field(registrationNumber; Rec."Registration Number")
                {
                    Caption = 'Registration No.';
                }
                field(reasonCode; Rec."Reason Code")
                {
                    Caption = 'Reason Code';
                }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                }
                field(eu3PartyTrade; Rec."EU 3-Party Trade")
                {
                    Caption = 'EU 3-Party Trade';
                }
                field(transactionType; Rec."Transaction Type")
                {
                    Caption = 'Transaction Type';
                }
                field(transportMethod; Rec."Transport Method")
                {
                    Caption = 'Transport Method';
                }
                field(vatCountryRegionCode; Rec."VAT Country/Region Code")
                {
                    Caption = 'VAT Country/Region Code';
                }
                field(sellToCustomerName; Rec."Sell-to Customer Name")
                {
                    Caption = 'Sell-to Customer Name';
                }
                field(sellToCustomerName2; Rec."Sell-to Customer Name 2")
                {
                    Caption = 'Sell-to Customer Name 2';
                }
                field(sellToAddress; Rec."Sell-to Address")
                {
                    Caption = 'Sell-to Address';
                }
                field(sellToAddress2; Rec."Sell-to Address 2")
                {
                    Caption = 'Sell-to Address 2';
                }
                field(sellToCity; Rec."Sell-to City")
                {
                    Caption = 'Sell-to City';
                }
                field(sellToContact; Rec."Sell-to Contact")
                {
                    Caption = 'Sell-to Contact';
                }
                field(billToPostCode; Rec."Bill-to Post Code")
                {
                    Caption = 'Bill-to Post Code';
                }
                field(billToCounty; Rec."Bill-to County")
                {
                    Caption = 'Bill-to County';
                }
                field(billToCountryRegionCode; Rec."Bill-to Country/Region Code")
                {
                    Caption = 'Bill-to Country/Region Code';
                }
                field(sellToPostCode; Rec."Sell-to Post Code")
                {
                    Caption = 'Sell-to Post Code';
                }
                field(sellToCounty; Rec."Sell-to County")
                {
                    Caption = 'Sell-to County';
                }
                field(sellToCountryRegionCode; Rec."Sell-to Country/Region Code")
                {
                    Caption = 'Sell-to Country/Region Code';
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
                field(balAccountType; Rec."Bal. Account Type")
                {
                    Caption = 'Bal. Account Type';
                }
                field(exitPoint; Rec."Exit Point")
                {
                    Caption = 'Exit Point';
                }
                field(correction; Rec.Correction)
                {
                    Caption = 'Correction';
                }
                field(documentDate; Rec."Document Date")
                {
                    Caption = 'Document Date';
                }
                field(externalDocumentNo; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
                }
                field("area"; Rec."Area")
                {
                    Caption = 'Area';
                }
                field(transactionSpecification; Rec."Transaction Specification")
                {
                    Caption = 'Transaction Specification';
                }
                field(paymentMethodCode; Rec."Payment Method Code")
                {
                    Caption = 'Payment Method Code';
                }
                field(shippingAgentCode; Rec."Shipping Agent Code")
                {
                    Caption = 'Shipping Agent Code';
                }
                field(packageTrackingNo; Rec."Package Tracking No.")
                {
                    Caption = 'Package Tracking No.';
                }
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                }
                field(postingNoSeries; Rec."Posting No. Series")
                {
                    Caption = 'Posting No. Series';
                }
                field(shippingNoSeries; Rec."Shipping No. Series")
                {
                    Caption = 'Shipping No. Series';
                }
                field(taxAreaCode; Rec."Tax Area Code")
                {
                    Caption = 'Tax Area Code';
                }
                field(taxLiable; Rec."Tax Liable")
                {
                    Caption = 'Tax Liable';
                }
                field(vatBusPostingGroup; Rec."VAT Bus. Posting Group")
                {
                    Caption = 'VAT Bus. Posting Group';
                }
                field(reserve; Rec.Reserve)
                {
                    Caption = 'Reserve';
                }
                field(appliesToID; Rec."Applies-to ID")
                {
                    Caption = 'Applies-to ID';
                }
                field(vatBaseDiscount; Rec."VAT Base Discount %")
                {
                    Caption = 'VAT Base Discount %';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }
                field(invoiceDiscountCalculation; Rec."Invoice Discount Calculation")
                {
                    Caption = 'Invoice Discount Calculation';
                }
                field(invoiceDiscountValue; Rec."Invoice Discount Value")
                {
                    Caption = 'Invoice Discount Value';
                }
                field(sendICDocument; Rec."Send IC Document")
                {
                    Caption = 'Send IC Document';
                }
                field(icStatus; Rec."IC Status")
                {
                    Caption = 'IC Status';
                }
                field(sellToICPartnerCode; Rec."Sell-to IC Partner Code")
                {
                    Caption = 'Sell-to IC Partner Code';
                }
                field(billToICPartnerCode; Rec."Bill-to IC Partner Code")
                {
                    Caption = 'Bill-to IC Partner Code';
                }
                field(icReferenceDocumentNo; Rec."IC Reference Document No.")
                {
                    Caption = 'IC Reference Document No.';
                }
                field(icDirection; Rec."IC Direction")
                {
                    Caption = 'IC Direction';
                }
                field(prepayment; Rec."Prepayment %")
                {
                    Caption = 'Prepayment %';
                }
                field(prepaymentNoSeries; Rec."Prepayment No. Series")
                {
                    Caption = 'Prepayment No. Series';
                }
                field(compressPrepayment; Rec."Compress Prepayment")
                {
                    Caption = 'Compress Prepayment';
                }
                field(prepaymentDueDate; Rec."Prepayment Due Date")
                {
                    Caption = 'Prepayment Due Date';
                }
                field(prepmtCrMemoNoSeries; Rec."Prepmt. Cr. Memo No. Series")
                {
                    Caption = 'Prepmt. Cr. Memo No. Series';
                }
                field(prepmtPostingDescription; Rec."Prepmt. Posting Description")
                {
                    Caption = 'Prepmt. Posting Description';
                }
                field(prepmtPmtDiscountDate; Rec."Prepmt. Pmt. Discount Date")
                {
                    Caption = 'Prepmt. Pmt. Discount Date';
                }
                field(prepmtPaymentTermsCode; Rec."Prepmt. Payment Terms Code")
                {
                    Caption = 'Prepmt. Payment Terms Code';
                }
                field(prepmtPaymentDiscount; Rec."Prepmt. Payment Discount %")
                {
                    Caption = 'Prepmt. Payment Discount %';
                }
                field(quoteNo; Rec."Quote No.")
                {
                    Caption = 'Quote No.';
                }
                field(quoteValidUntilDate; Rec."Quote Valid Until Date")
                {
                    Caption = 'Quote Valid To Date';
                }
                field(quoteSentToCustomer; Rec."Quote Sent to Customer")
                {
                    Caption = 'Quote Sent to Customer';
                }
                field(quoteAccepted; Rec."Quote Accepted")
                {
                    Caption = 'Quote Accepted';
                }
                field(quoteAcceptedDate; Rec."Quote Accepted Date")
                {
                    Caption = 'Quote Accepted Date';
                }
                field(jobQueueStatus; Rec."Job Queue Status")
                {
                    Caption = 'Job Queue Status';
                }
                field(jobQueueEntryID; Rec."Job Queue Entry ID")
                {
                    Caption = 'Job Queue Entry ID';
                }
                field(companyBankAccountCode; Rec."Company Bank Account Code")
                {
                    Caption = 'Company Bank Account Code';
                }
                field(incomingDocumentEntryNo; Rec."Incoming Document Entry No.")
                {
                    Caption = 'Incoming Document Entry No.';
                }
                field(isTest; Rec.IsTest)
                {
                    Caption = 'IsTest';
                }
                field(sellToPhoneNo; Rec."Sell-to Phone No.")
                {
                    Caption = 'Sell-to Phone No.';
                }
                field(sellToEMail; Rec."Sell-to E-Mail")
                {
                    Caption = 'Email';
                }
                field(journalTemplName; Rec."Journal Templ. Name")
                {
                    Caption = 'Journal Template Name';
                }
                field(vatReportingDate; Rec."VAT Reporting Date")
                {
                    Caption = 'VAT Date';
                }
                field(rcvdFromCountRegionCode; Rec."Rcvd.-from Count./Region Code")
                {
                    Caption = 'Received-from Country/Region Code';
                }
                field(workDescription; Rec."Work Description")
                {
                    Caption = 'Work Description';
                }
                field(amtShipNotInvLCY; Rec."Amt. Ship. Not Inv. (LCY)")
                {
                    Caption = 'Amount Shipped Not Invoiced (LCY) Incl. VAT';
                }
                field(amtShipNotInvLCYBase; Rec."Amt. Ship. Not Inv. (LCY) Base")
                {
                    Caption = 'Amount Shipped Not Invoiced (LCY)';
                }
                field(dimensionSetID; Rec."Dimension Set ID")
                {
                    Caption = 'Dimension Set ID';
                }
                field(paymentServiceSetID; Rec."Payment Service Set ID")
                {
                    Caption = 'Payment Service Set ID';
                }
                field(coupledToCRM; Rec."Coupled to CRM")
                {
                    Caption = 'Coupled to Dynamics 365 Sales';
                }
                field(coupledToDataverse; Rec."Coupled to Dataverse")
                {
                    Caption = 'Coupled to Dynamics 365 Sales';
                }
                field(directDebitMandateID; Rec."Direct Debit Mandate ID")
                {
                    Caption = 'Direct Debit Mandate ID';
                }
                field(invoiceDiscountAmount; Rec."Invoice Discount Amount")
                {
                    Caption = 'Invoice Discount Amount';
                }
                field(noOfArchivedVersions; Rec."No. of Archived Versions")
                {
                    Caption = 'No. of Archived Versions';
                }
                field(docNoOccurrence; Rec."Doc. No. Occurrence")
                {
                    Caption = 'Doc. No. Occurrence';
                }
                field(campaignNo; Rec."Campaign No.")
                {
                    Caption = 'Campaign No.';
                }
                field(sellToContactNo; Rec."Sell-to Contact No.")
                {
                    Caption = 'Sell-to Contact No.';
                }
                field(billToContactNo; Rec."Bill-to Contact No.")
                {
                    Caption = 'Bill-to Contact No.';
                }
                field(opportunityNo; Rec."Opportunity No.")
                {
                    Caption = 'Opportunity No.';
                }
                field(sellToCustomerTemplCode; Rec."Sell-to Customer Templ. Code")
                {
                    Caption = 'Sell-to Customer Template Code';
                }
                field(billToCustomerTemplCode; Rec."Bill-to Customer Templ. Code")
                {
                    Caption = 'Bill-to Customer Template Code';
                }
                field(responsibilityCenter; Rec."Responsibility Center")
                {
                    Caption = 'Responsibility Center';
                }
                field(shippingAdvice; Rec."Shipping Advice")
                {
                    Caption = 'Shipping Advice';
                }
                field(shippedNotInvoiced; Rec."Shipped Not Invoiced")
                {
                    Caption = 'Shipped Not Invoiced';
                }
                field(completelyShipped; Rec."Completely Shipped")
                {
                    Caption = 'Completely Shipped';
                }
                field(postingFromWhseRef; Rec."Posting from Whse. Ref.")
                {
                    Caption = 'Posting from Whse. Ref.';
                }
                field(shipped; Rec.Shipped)
                {
                    Caption = 'Shipped';
                }
                field(lastShipmentDate; Rec."Last Shipment Date")
                {
                    Caption = 'Last Shipment Date';
                }
                field(requestedDeliveryDate; Rec."Requested Delivery Date")
                {
                    Caption = 'Requested Delivery Date';
                }
                field(promisedDeliveryDate; Rec."Promised Delivery Date")
                {
                    Caption = 'Promised Delivery Date';
                }
                field(shippingTime; Rec."Shipping Time")
                {
                    Caption = 'Shipping Time';
                }
                field(outboundWhseHandlingTime; Rec."Outbound Whse. Handling Time")
                {
                    Caption = 'Outbound Whse. Handling Time';
                }
                field(shippingAgentServiceCode; Rec."Shipping Agent Service Code")
                {
                    Caption = 'Shipping Agent Service Code';
                }
                field(lateOrderShipping; Rec."Late Order Shipping")
                {
                    Caption = 'Late Order Shipping';
                }
                field(receive; Rec.Receive)
                {
                    Caption = 'Receive';
                }
                field(returnReceiptNo; Rec."Return Receipt No.")
                {
                    Caption = 'Return Receipt No.';
                }
                field(returnReceiptNoSeries; Rec."Return Receipt No. Series")
                {
                    Caption = 'Return Receipt No. Series';
                }
                field(lastReturnReceiptNo; Rec."Last Return Receipt No.")
                {
                    Caption = 'Last Return Receipt No.';
                }
                field(priceCalculationMethod; Rec."Price Calculation Method")
                {
                    Caption = 'Price Calculation Method';
                }
                field(allowLineDisc; Rec."Allow Line Disc.")
                {
                    Caption = 'Allow Line Disc.';
                }
                field(getShipmentUsed; Rec."Get Shipment Used")
                {
                    Caption = 'Get Shipment Used';
                }
                field(assignedUserID; Rec."Assigned User ID")
                {
                    Caption = 'Assigned User ID';
                }
                field(salesTaxAmountRounding; Rec."Sales Tax Amount Rounding")
                {
                    Caption = 'Sales Tax Amount Rounding';
                }
                field(prepmtSalesTaxRoundingAmt; Rec."Prepmt. Sales Tax Rounding Amt")
                {
                    Caption = 'Prepayment Sales Tax Rounding Amount';
                }
                field(shipToUPSZone; Rec."Ship-to UPS Zone")
                {
                    Caption = 'Ship-to UPS Zone';
                }
                field(outstandingAmount; Rec."Outstanding Amount ($)")
                {
                    Caption = 'Outstanding Amount ($)';
                }
                field(taxExemptionNo; Rec."Tax Exemption No.")
                {
                    Caption = 'Tax Exemption No.';
                }
                field(steTransactionID; Rec."STE Transaction ID")
                {
                    Caption = 'STE Transaction ID';
                }
                field(transportOperators; Rec."Transport Operators")
                {
                    Caption = 'Transport Operators';
                }
                field(transitFromDateTime; Rec."Transit-from Date/Time")
                {
                    Caption = 'Transit-from Date/Time';
                }
                field(transitHours; Rec."Transit Hours")
                {
                    Caption = 'Transit Hours';
                }
                field(transitDistance; Rec."Transit Distance")
                {
                    Caption = 'Transit Distance';
                }
                field(insurerName; Rec."Insurer Name")
                {
                    Caption = 'Insurer Name';
                }
                field(insurerPolicyNumber; Rec."Insurer Policy Number")
                {
                    Caption = 'Insurer Policy Number';
                }
                field(foreignTrade; Rec."Foreign Trade")
                {
                    Caption = 'Foreign Trade';
                }
                field(vehicleCode; Rec."Vehicle Code")
                {
                    Caption = 'Vehicle Code';
                }
                field(trailer1; Rec."Trailer 1")
                {
                    Caption = 'Trailer 1';
                }
                field(trailer2; Rec."Trailer 2")
                {
                    Caption = 'Trailer 2';
                }
                field(transitToLocation; Rec."Transit-to Location")
                {
                    Caption = 'Transit-to Location';
                }
                field(medicalInsurerName; Rec."Medical Insurer Name")
                {
                    Caption = 'Medical Insurer Name';
                }
                field(medicalInsPolicyNumber; Rec."Medical Ins. Policy Number")
                {
                    Caption = 'Medical Ins. Policy Number';
                }
                field(satWeightUnitOfMeasure; Rec."SAT Weight Unit Of Measure")
                {
                    Caption = 'SAT Weight Unit Of Measure';
                }
                field(satInternationalTradeTerm; Rec."SAT International Trade Term")
                {
                    Caption = 'SAT International Trade Term';
                }
                field(exchangeRateUSD; Rec."Exchange Rate USD")
                {
                    Caption = 'Exchange Rate USD';
                }
                field(satCustomsRegime; Rec."SAT Customs Regime")
                {
                    Caption = 'SAT Customs Regime';
                }
                field(satTransferReason; Rec."SAT Transfer Reason")
                {
                    Caption = 'SAT Transfer Reason';
                }
                field(prepmtIncludeTax; Rec."Prepmt. Include Tax")
                {
                    Caption = 'Prepmt. Include Tax';
                }
                field(cfdiPurpose; Rec."CFDI Purpose")
                {
                    Caption = 'CFDI Purpose';
                }
                field(cfdiRelation; Rec."CFDI Relation")
                {
                    Caption = 'CFDI Relation';
                }
                field(cfdiExportCode; Rec."CFDI Export Code")
                {
                    Caption = 'CFDI Export Code';
                }
                field(cfdiPeriod; Rec."CFDI Period")
                {
                    Caption = 'CFDI Period';
                }
                field(satAddressID; Rec."SAT Address ID")
                {
                    Caption = 'SAT Address ID';
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
                field(assignedUserID2; Rec."Assigned User ID 2")
                {
                    Caption = 'Assigned User ID 2';
                }
                field(needsApproval; Rec.Needs_Approval)
                {
                    Caption = 'Needs Approval';
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
                field(orbTaxID; Rec."ORB Tax ID")
                {
                    Caption = 'Tax ID';
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
                field(orbMagentoLocationCode; Rec."ORB Magento Location Code")
                {
                    Caption = 'Magento Location Code';
                }
                field(orbRequireReview; Rec."ORB Require Review")
                {
                    Caption = 'Require Review';
                }
                field(orbLastFollowupBy; Rec."ORB Last Followup By")
                {
                    Caption = 'Last Followup By';
                }
                field(orbRUSH; Rec."ORB RUSH")
                {
                    Caption = 'RUSH';
                }
                field(orbShipmentDate; Rec."ORB Shipment Date")
                {
                    Caption = 'ORB Shipment Date';
                }
                field(orbEscalationReasonCode; Rec."ORB Escalation Reason Code")
                {
                    Caption = 'Escalation Reason Code';
                }
                field(orbResolvedBy; Rec."ORB Resolved By")
                {
                    Caption = 'Resolved By';
                }
                field(orbOriginalPromisedShipDt; Rec."ORB Original Promised Ship Dt.")
                {
                    Caption = 'Original Promised Shipment Date';
                }
                field(orbDelayedShipReasonCode; Rec."ORB Delayed Ship Reason Code")
                {
                    Caption = 'Delayed Shipment Reason Code';
                }
                field(orbDelayedShipSubReason; Rec."ORB Delayed Ship Sub-Reason")
                {
                    Caption = 'Delayed Shipment Sub-Reason Code';
                }
                field(orbDSPaymentType; Rec."ORB DS Payment Type")
                {
                    Caption = 'DS Payment Type';
                }
                field(orbDSPaymentAccountNo; Rec."ORB DS Payment Account No.")
                {
                    Caption = 'DS Payment Account No.';
                }
                field(orbTotalPaymentAmount; Rec."ORB Total Payment Amount")
                {
                    Caption = 'Total Payment Amount';
                }
                field(orbFreightLine; Rec."ORB Freight Line")
                {
                    Caption = 'Freight Line';
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
                field(artEmail; Rec."Art Email")
                {
                    Caption = 'Art Email';
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
                field(createdAt; Rec."Created At")
                {
                    Caption = 'Created At';
                }
                field(caseNo; Rec."Case No.")
                {
                    Caption = 'Case No.';
                }
                field(paymentTermsOnOpenPage; Rec."Payment Terms OnOpenPage")
                {
                    Caption = 'Payment Terms OnOpenPage';
                }
                field(quoteStatus; Rec."Quote Status")
                {
                    Caption = 'Quote Status';
                }
                field(lastFollowupDate; Rec."Last Followup Date")
                {
                    Caption = 'Last Followup Date';
                }
                field(nextFollowupDate; Rec."Next Followup Date")
                {
                    Caption = 'Next Followup Date';
                }
                field(leadTime; Rec."Lead Time")
                {
                    Caption = 'Lead Time';
                }
                field(shipToCodeCustom; Rec."Ship-to Code (Custom)")
                {
                    Caption = 'Ship-to Code (Custom)';
                }
                field(shipToNameCustom; Rec."Ship-to Name (Custom)")
                {
                    Caption = 'Ship-to Name (Custom)';
                }
                field(shipToName2Custom; Rec."Ship-to Name 2 (Custom)")
                {
                    Caption = 'Ship-to Name 2 (Custom)';
                }
                field(shipToAddressCustom; Rec."Ship-to Address (Custom)")
                {
                    Caption = 'Ship-to Address (Custom)';
                }
                field(shipToAddress2Custom; Rec."Ship-to Address 2 (Custom)")
                {
                    Caption = 'Ship-to Address 2 (Custom)';
                }
                field(shipToCityCustom; Rec."Ship-to City (Custom)")
                {
                    Caption = 'Ship-to City (Custom)';
                }
                field(shipToCountyCustom; Rec."Ship-To County (Custom)")
                {
                    Caption = 'Ship-To County (Custom)';
                }
                field(shipToContactCustom; Rec."Ship-to Contact (Custom)")
                {
                    Caption = 'Ship-to Contact (Custom)';
                }
                field(shipToPostCodeCustom; Rec."Ship-To Post Code (Custom)")
                {
                    Caption = 'Ship-To Post Code (Custom)';
                }
                field(shipToCountryRegionCustom; Rec."Ship-To CountryRegion (Custom)")
                {
                    Caption = 'Ship-To CountryRegion (Custom)';
                }
                field(salesPersonEmail; Rec."SalesPerson Email")
                {
                    Caption = 'SalesPerson Email';
                }
                field(shippingAgentServiceCode2; Rec."Shipping Agent Service Code 2")
                {
                    Caption = 'Shipping Agent Service Code 2';
                }
                field(probabilityPercentage; Rec."Probability Percentage")
                {
                    Caption = 'Probability Percentage';
                }
                field(sellToCustomerNoHasValue; Rec."Sell-to-Customer No. Has Value")
                {
                    Caption = 'Sell-to-Customer No. Has Value';
                }
                field(locationCodeCustom; Rec."Location Code (Custom)")
                {
                    Caption = 'Location Code (Custom)';
                }
                field(shipToDataModified; Rec."Ship To Data Modified")
                {
                    Caption = 'Ship To Data Modified';
                }
                field(needsAssessment; Rec."Needs Assessment")
                {
                    Caption = 'Needs Assessment';
                }
                field(projectNo; Rec."Project No.")
                {
                    Caption = 'Project No.';
                }
                field(approvalDeadline; Rec."Approval Deadline")
                {
                    Caption = 'Approval Deadline';
                }
                field(productionScanTime; Rec."Production Scan Time")
                {
                    Caption = 'Production Scan Time';
                }
                field(modifiedLocationCode; Rec."Modified Location Code")
                {
                    Caption = 'Modified Location Code';
                }
                field(wmdmPOS; Rec."WMDM POS")
                {
                    Caption = 'Warehouse Insight POS';
                }
                field(netAmtAuthorizedLCYCL; Rec."Net Amt. Authorized (LCY) -CL-")
                {
                    Caption = 'Net Amount Authorized ($)';
                }
                field(netAmtToAuthSaleLCYCL; Rec."Net Amt to Auth-Sale (LCY)-CL-")
                {
                    Caption = 'Net Amt. to Auth.-Sale ($)';
                }
                field(netAmtAuthSaleLCYCL; Rec."Net Amt. Auth.-Sale (LCY) -CL-")
                {
                    Caption = 'Net Amt. Authorized-Sale ($)';
                }
                field(netAmtAuthHoldLCYCL; Rec."Net Amt. Auth.-Hold (LCY) -CL-")
                {
                    Caption = 'Net Amt. Auth. On Hold (LCY)';
                }
                field(netAmtToAuthLCYCL; Rec."Net Amt. to Auth. (LCY) -CL-")
                {
                    Caption = 'Net Amount to Authorize ($)';
                }
                field(netAmtToStlSaleLCYCL; Rec."Net Amt. to Stl-Sale (LCY)-CL-")
                {
                    Caption = 'Net Amt. to Settle-Sale ($)';
                }
                field(netAmtToSettleLCYCL; Rec."Net Amt. to Settle (LCY) -CL-")
                {
                    Caption = 'Net Amount to Settle ($)';
                }
                field(netAmountSettledLCYCL; Rec."Net Amount Settled (LCY) -CL-")
                {
                    Caption = 'Net Amount Settled ($)';
                }
                field(netAmtSetSaleLCYCL; Rec."Net Amt. Set.-Sale (LCY) -CL-")
                {
                    Caption = 'Net Amount Settled-Sale ($)';
                }
                field(amountPaidLCYCL; Rec."Amount Paid (LCY) -CL-")
                {
                    Caption = 'Amount Paid (LCY)';
                }
                field(sellToPhoneNoCL; Rec."Sell-to Phone No. -CL-")
                {
                    Caption = 'Sell-to Phone No.';
                }
                field(billToPhoneNoCL; Rec."Bill-to Phone No. -CL-")
                {
                    Caption = 'Phone No.';
                }
                field(shipToPhoneNoCL; Rec."Ship-to Phone No. -CL-")
                {
                    Caption = 'Ship-to Phone No.';
                }
                field(billToFederalIDNoCL; Rec."Bill-to Federal ID No. -CL-")
                {
                    Caption = 'Bill-to Federal ID No.';
                }
                field(billToIDNoCL; Rec."Bill-to ID No. -CL-")
                {
                    Caption = 'Bill-to Identification No.';
                }
                field(billToIDCountyCL; Rec."Bill-to ID County -CL-")
                {
                    Caption = 'Bill-to Identification State';
                }
                field(accountNumberCL; Rec."Account Number -CL-")
                {
                    Caption = 'Account Number';
                }
                field(expirationMonthCL; Rec."Expiration Month -CL-")
                {
                    Caption = 'Expiration Month';
                }
                field(expirationYearCL; Rec."Expiration Year -CL-")
                {
                    Caption = 'Expiration Year';
                }
                field(routingNumberCL; Rec."Routing Number -CL-")
                {
                    Caption = 'Routing Number';
                }
                field(checkTypeCL; Rec."Check Type -CL-")
                {
                    Caption = 'Check Type';
                }
                field(hashCL; Rec."Hash -CL-")
                {
                    Caption = 'Hash';
                }
                field(cardTypeCL; Rec."Card Type -CL-")
                {
                    Caption = 'Card Type';
                }
                field(accountTypeCL; Rec."Account Type -CL-")
                {
                    Caption = 'Account Type';
                }
                field(encryptionSaltCL; Rec."Encryption Salt -CL-")
                {
                    Caption = 'Encryption Salt';
                }
                field(protectedAccountNumberCL; Rec."Protected Account Number -CL-")
                {
                    Caption = 'Protected Account Number';
                }
                field(eftTenderTypeCL; Rec."EFT Tender Type -CL-")
                {
                    Caption = 'EFT Tender Type';
                }
                field(eftCustomerLinkTypeCL; Rec."EFT Customer Link Type -CL-")
                {
                    Caption = 'EFT Customer Link Type';
                }
                field(eftCustomerLinkNoCL; Rec."EFT Customer Link No. -CL-")
                {
                    Caption = 'EFT Customer Link No.';
                }
                field(eftCustLinkLineNoCL; Rec."EFT Cust. Link Line No. -CL-")
                {
                    Caption = 'EFT Customer Link Line No.';
                }
                field(accountNumberProtTypeCL; Rec."Account Number Prot. Type -CL-")
                {
                    Caption = 'Account Number Protection Type';
                }
                field(eftOrderIDCL; Rec."EFT Order ID -CL-")
                {
                    Caption = 'EFT Order ID';
                }
                field(eftStoreNoCL; Rec."EFT Store No. -CL-")
                {
                    Caption = 'EFT Store No.';
                }
                field(electronicInvoiceTypeCL; Rec."Electronic Invoice Type -CL-")
                {
                    Caption = 'Electronic Invoice Type';
                }
                field(posTypeCL; Rec."POS Type -CL-")
                {
                    Caption = 'POS Type';
                }
                field(eftTerminalNoCL; Rec."EFT Terminal No. -CL-")
                {
                    Caption = 'EFT Terminal No.';
                }
                field(eftGatewayNoCL; Rec."EFT Gateway No. -CL-")
                {
                    Caption = 'EFT Gateway No.';
                }
                field(eftGatewayAccountNo; Rec."EFT Gateway Account No.")
                {
                    Caption = 'EFT Gateway Account No.';
                }
                field(eftGUIDCL; Rec."EFT GUID -CL-")
                {
                    Caption = 'EFT GUID';
                }
                field(clickToPayURLCL; Rec."Click-to-Pay URL -CL-")
                {
                    Caption = 'Click-to-Pay URL';
                }
                field(noEMailedCL; Rec."No. E-mailed -CL-")
                {
                    Caption = 'No. E-mailed';
                }
                field(eftGatewayAccountNoCL; Rec."EFT Gateway Account No. -CL-")
                {
                    Caption = 'EFT Gateway Account No.';
                }
                field(issuerIDNoCL; Rec."Issuer ID No. -CL-")
                {
                    Caption = 'Issuer Identification Number';
                }
                field(demandDepositAcctTypeCL; Rec."Demand Deposit Acct. Type -CL-")
                {
                    Caption = 'Demand Deposit Account Type';
                }
                field(layawayTermsCodeCL; Rec."Layaway Terms Code -CL-")
                {
                    Caption = 'Layaway Terms Code';
                }
                field(layawayCL; Rec."Layaway -CL-")
                {
                    Caption = 'Layaway';
                }
                field(cashierNumberCL; Rec."Cashier Number -CL-")
                {
                    Caption = 'Cashier Number';
                }
                field(preventAccNumEntryCL; Rec."Prevent Acc. Num. Entry -CL-")
                {
                    Caption = 'Prevent Account Number Entry';
                }
                field(surchargeToAuthSaleCL; Rec."Surcharge to Auth-Sale -CL-")
                {
                    Caption = 'Surcharge Amount to Authorize - Sale';
                }
                field(surchargeAuthSaleCL; Rec."Surcharge Auth.-Sale -CL-")
                {
                    Caption = 'Surcharge Amount Authorized - Sale';
                }
                field(surchargeToStlSaleCL; Rec."Surcharge to Stl-Sale -CL-")
                {
                    Caption = 'Surcharge Amount to Settle - Sale';
                }
                field(surchargeSetSaleCL; Rec."Surcharge Set.-Sale -CL-")
                {
                    Caption = 'Surcharge Amount Settled - Sale';
                }
                field(surchargeToAuthCL; Rec."Surcharge to Auth. -CL-")
                {
                    Caption = 'Surcharge Amount to Authorize';
                }
                field(surchargeAuthorizedCL; Rec."Surcharge Authorized -CL-")
                {
                    Caption = 'Surcharge Amount Authorized';
                }
                field(surchargeToSettleCL; Rec."Surcharge to Settle -CL-")
                {
                    Caption = 'Surcharge Amount to Settle';
                }
                field(surchargeSettledCL; Rec."Surcharge Settled -CL-")
                {
                    Caption = 'Surcharge Amount Settled';
                }
                field(eftIgnoreAutoWorkflowsCL; Rec."EFT Ignore Auto Workflows -CL-")
                {
                    Caption = 'Ignore Auto Workflows';
                }
                field(doNotSyncVersapayARCCL; Rec."Do not Sync Versapay ARC -CL-")
                {
                    Caption = 'Do not Sync with the Versapay Cloud Platform';
                }
                field(previewModeCL; Rec."Preview Mode -CL-")
                {
                    Caption = 'Preview Mode';
                }
                field(manuallyReleasedCL; Rec."Manually Released -CL-")
                {
                    Caption = 'Manually Released';
                }
                field(orderTimeCL; Rec."Order Time -CL-")
                {
                    Caption = 'Order Time';
                }
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'SystemCreatedAt';
                }
                field(systemCreatedBy; Rec.SystemCreatedBy)
                {
                    Caption = 'SystemCreatedBy';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(systemModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'SystemModifiedAt';
                }
                field(systemModifiedBy; Rec.SystemModifiedBy)
                {
                    Caption = 'SystemModifiedBy';
                }
            }
        }
    }
}
