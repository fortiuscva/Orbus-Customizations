page 52650 "ORB Sales Quotes API"
{
    APIGroup = 'orbus';
    APIPublisher = 'orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'salesQuotesAPI';
    DelayedInsert = true;
    EntityName = 'salesquotesv2API';
    EntitySetName = 'salesquotesv2API';
    PageType = API;
    SourceTable = "Sales Header";
    SourceTableView = where("Document Type" = filter(Quote));

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
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(sellToCustomerNo; Rec."Sell-to Customer No.")
                {
                    Caption = 'Sell-to Customer No.';
                }
                field(sellToCustomerName; Rec."Sell-to Customer Name")
                {
                    Caption = 'Sell-to Customer Name';
                }
                field(sellToCustomerName2; Rec."Sell-to Customer Name 2")
                {
                    Caption = 'Sell-to Customer Name 2';
                }
                field(externalDocumentNo; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }
                field(quoteStatus; Rec."Quote Status")
                {
                    Caption = 'Quote Status';
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
                field(sellToCounty; Rec."Sell-to County")
                {
                    Caption = 'Sell-to County';
                }
                field(sellToPostCode; Rec."Sell-to Post Code")
                {
                    Caption = 'Sell-to Post Code';
                }
                field(sellToCountryRegionCode; Rec."Sell-to Country/Region Code")
                {
                    Caption = 'Sell-to Country/Region Code';
                }
                field(sellToContactNoCustom; Rec."Sell-To Contact No. (Custom)")
                {
                    Caption = 'Sell-To Contact No. (Custom)';
                }
                field(sellToPhoneNoCustom; Rec."Sell-To Phone No. (Custom)")
                {
                    Caption = 'Sell-To Phone No. (Custom)';
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
                field(billToCounty; Rec."Bill-to County")
                {
                    Caption = 'Bill-to County';
                }
                field(billToPostCode; Rec."Bill-to Post Code")
                {
                    Caption = 'Bill-to Post Code';
                }
                field(billToCountryRegionCode; Rec."Bill-to Country/Region Code")
                {
                    Caption = 'Bill-to Country/Region Code';
                }
                field(billToContact; Rec."Bill-to Contact")
                {
                    Caption = 'Bill-to Contact';
                }
                field(billToContactNo; Rec."Bill-to Contact No.")
                {
                    Caption = 'Bill-to Contact No.';
                }
                field(accountNumberCL; Rec."Account Number -CL-")
                {
                    Caption = 'Account Number';
                }
                field(accountNumberProtTypeCL; Rec."Account Number Prot. Type -CL-")
                {
                    Caption = 'Account Number Protection Type';
                }
                field(accountTypeCL; Rec."Account Type -CL-")
                {
                    Caption = 'Account Type';
                }
                field(allowLineDisc; Rec."Allow Line Disc.")
                {
                    Caption = 'Allow Line Disc.';
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                }
                field(amountIncludingVAT; Rec."Amount Including VAT")
                {
                    Caption = 'Amount Including VAT';
                }
                field(amountPaidLCYCL; Rec."Amount Paid (LCY) -CL-")
                {
                    Caption = 'Amount Paid (LCY)';
                }
                field(amtShipNotInvLCY; Rec."Amt. Ship. Not Inv. (LCY)")
                {
                    Caption = 'Amount Shipped Not Invoiced (LCY) Incl. VAT';
                }
                field(amtShipNotInvLCYBase; Rec."Amt. Ship. Not Inv. (LCY) Base")
                {
                    Caption = 'Amount Shipped Not Invoiced (LCY)';
                }
                field(appliesToDocNo; Rec."Applies-to Doc. No.")
                {
                    Caption = 'Applies-to Doc. No.';
                }
                field(appliesToDocType; Rec."Applies-to Doc. Type")
                {
                    Caption = 'Applies-to Doc. Type';
                }
                field(appliesToID; Rec."Applies-to ID")
                {
                    Caption = 'Applies-to ID';
                }
                field(approvalDeadline; Rec."Approval Deadline")
                {
                    Caption = 'Approval Deadline';
                }
                field("area"; Rec."Area")
                {
                    Caption = 'Area';
                }
                field(artEmail; Rec."Art Email")
                {
                    Caption = 'Art Email';
                }
                field(assignedUserID; Rec."Assigned User ID")
                {
                    Caption = 'Assigned User ID';
                }
                field(assignedUserID2; Rec."Assigned User ID 2")
                {
                    Caption = 'Assigned User ID 2';
                }
                field(balAccountNo; Rec."Bal. Account No.")
                {
                    Caption = 'Bal. Account No.';
                }
                field(balAccountType; Rec."Bal. Account Type")
                {
                    Caption = 'Bal. Account Type';
                }
                field(billToCustomerTemplCode; Rec."Bill-to Customer Templ. Code")
                {
                    Caption = 'Bill-to Customer Template Code';
                }
                field(billToFederalIDNoCL; Rec."Bill-to Federal ID No. -CL-")
                {
                    Caption = 'Bill-to Federal ID No.';
                }
                field(billToICPartnerCode; Rec."Bill-to IC Partner Code")
                {
                    Caption = 'Bill-to IC Partner Code';
                }
                field(billToIDCountyCL; Rec."Bill-to ID County -CL-")
                {
                    Caption = 'Bill-to Identification State';
                }
                field(billToIDNoCL; Rec."Bill-to ID No. -CL-")
                {
                    Caption = 'Bill-to Identification No.';
                }
                field(billToPhoneNoCL; Rec."Bill-to Phone No. -CL-")
                {
                    Caption = 'Phone No.';
                }
                field(cfdiExportCode; Rec."CFDI Export Code")
                {
                    Caption = 'CFDI Export Code';
                }
                field(cfdiPeriod; Rec."CFDI Period")
                {
                    Caption = 'CFDI Period';
                }
                field(cfdiPurpose; Rec."CFDI Purpose")
                {
                    Caption = 'CFDI Purpose';
                }
                field(cfdiRelation; Rec."CFDI Relation")
                {
                    Caption = 'CFDI Relation';
                }
                field(campaignNo; Rec."Campaign No.")
                {
                    Caption = 'Campaign No.';
                }
                field(cardTypeCL; Rec."Card Type -CL-")
                {
                    Caption = 'Card Type';
                }
                field(caseNo; Rec."Case No.")
                {
                    Caption = 'Case No.';
                }
                field(cashierNumberCL; Rec."Cashier Number -CL-")
                {
                    Caption = 'Cashier Number';
                }
                field(checkTypeCL; Rec."Check Type -CL-")
                {
                    Caption = 'Check Type';
                }
                field(clickToPayURLCL; Rec."Click-to-Pay URL -CL-")
                {
                    Caption = 'Click-to-Pay URL';
                }
                field(combineShipments; Rec."Combine Shipments")
                {
                    Caption = 'Combine Shipments';
                }
                field(comment; Rec.Comment)
                {
                    Caption = 'Comment';
                }
                field(companyBankAccountCode; Rec."Company Bank Account Code")
                {
                    Caption = 'Company Bank Account Code';
                }
                field(completelyShipped; Rec."Completely Shipped")
                {
                    Caption = 'Completely Shipped';
                }
                field(compressPrepayment; Rec."Compress Prepayment")
                {
                    Caption = 'Compress Prepayment';
                }
                field(correction; Rec.Correction)
                {
                    Caption = 'Correction';
                }
                field(coupledToDataverse; Rec."Coupled to Dataverse")
                {
                    Caption = 'Coupled to Dynamics 365 Sales';
                }
                field(createdAt; Rec."Created At")
                {
                    Caption = 'Created At';
                }
                field(createdBy; Rec.Created_By)
                {
                    Caption = 'Created_By';
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                }
                field(currencyFactor; Rec."Currency Factor")
                {
                    Caption = 'Currency Factor';
                }
                field(custom; Rec.Custom)
                {
                    Caption = 'Custom';
                }
                field(customerDiscGroup; Rec."Customer Disc. Group")
                {
                    Caption = 'Customer Disc. Group';
                }
                field(customerPostingGroup; Rec."Customer Posting Group")
                {
                    Caption = 'Customer Posting Group';
                }
                field(customerPriceGroup; Rec."Customer Price Group")
                {
                    Caption = 'Customer Price Group';
                }
                field(demandDepositAcctTypeCL; Rec."Demand Deposit Acct. Type -CL-")
                {
                    Caption = 'Demand Deposit Account Type';
                }
                field(dimensionSetID; Rec."Dimension Set ID")
                {
                    Caption = 'Dimension Set ID';
                }
                field(directDebitMandateID; Rec."Direct Debit Mandate ID")
                {
                    Caption = 'Direct Debit Mandate ID';
                }
                /* field(doNotSyncVersapayARCCL; Rec."Do not Sync Versapay ARC -CL-")
                {
                    Caption = 'Do not Sync with the Versapay Cloud Platform';
                    Replaced by new field - Versapay Sync Option -CL-
                } */
                field(VersapaySyncOptionCL; Rec."Versapay Sync Option -CL-")
                {
                    Caption = 'Versapay Sync Option -CL-';
                }

                field(docNoOccurrence; Rec."Doc. No. Occurrence")
                {
                    Caption = 'Doc. No. Occurrence';
                }
                field(documentDate; Rec."Document Date")
                {
                    Caption = 'Document Date';
                }
                field(dueDate; Rec."Due Date")
                {
                    Caption = 'Due Date';
                }
                field(eftCustLinkLineNoCL; Rec."EFT Cust. Link Line No. -CL-")
                {
                    Caption = 'EFT Customer Link Line No.';
                }
                field(eftCustomerLinkNoCL; Rec."EFT Customer Link No. -CL-")
                {
                    Caption = 'EFT Customer Link No.';
                }
                field(eftCustomerLinkTypeCL; Rec."EFT Customer Link Type -CL-")
                {
                    Caption = 'EFT Customer Link Type';
                }
                field(eftGUIDCL; Rec."EFT GUID -CL-")
                {
                    Caption = 'EFT GUID';
                }
                field(eftGatewayAccountNoCL; Rec."EFT Gateway Account No. -CL-")
                {
                    Caption = 'EFT Gateway Account No.';
                }
                field(eftGatewayNoCL; Rec."EFT Gateway No. -CL-")
                {
                    Caption = 'EFT Gateway No.';
                }
                field(eftIgnoreAutoWorkflowsCL; Rec."EFT Ignore Auto Workflows -CL-")
                {
                    Caption = 'Ignore Auto Workflows';
                }
                field(eftOrderIDCL; Rec."EFT Order ID -CL-")
                {
                    Caption = 'EFT Order ID';
                }
                field(eftStoreNoCL; Rec."EFT Store No. -CL-")
                {
                    Caption = 'EFT Store No.';
                }
                field(eftTenderTypeCL; Rec."EFT Tender Type -CL-")
                {
                    Caption = 'EFT Tender Type';
                }
                field(eftTerminalNoCL; Rec."EFT Terminal No. -CL-")
                {
                    Caption = 'EFT Terminal No.';
                }
                field(eu3PartyTrade; Rec."EU 3-Party Trade")
                {
                    Caption = 'EU 3-Party Trade';
                }
                /* field(electronicInvoiceTypeCL; Rec."Electronic Invoice Type -CL-")
                {
                    Caption = 'Electronic Invoice Type';
                    Removed - new Versapay Update
                } */
                field(encryptionSaltCL; Rec."Encryption Salt -CL-")
                {
                    Caption = 'Encryption Salt';
                }
                field(exchangeRateUSD; Rec."Exchange Rate USD")
                {
                    Caption = 'Exchange Rate USD';
                }
                field(exitPoint; Rec."Exit Point")
                {
                    Caption = 'Exit Point';
                }
                field(expirationMonthCL; Rec."Expiration Month -CL-")
                {
                    Caption = 'Expiration Month';
                }
                field(expirationYearCL; Rec."Expiration Year -CL-")
                {
                    Caption = 'Expiration Year';
                }
                field(fedExAccountNumber; Rec."FedEx Account Number")
                {
                    Caption = 'FedEx Account Number';
                }
                field(foreignTrade; Rec."Foreign Trade")
                {
                    Caption = 'Foreign Trade';
                }
                field(formatRegion; Rec."Format Region")
                {
                    Caption = 'Format Region';
                }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                }
                field(getShipmentUsed; Rec."Get Shipment Used")
                {
                    Caption = 'Get Shipment Used';
                }
                field(graphicsOnly; Rec."Graphics Only")
                {
                    Caption = 'Graphics Only';
                }
                field(hashCL; Rec."Hash -CL-")
                {
                    Caption = 'Hash';
                }
                field(icDirection; Rec."IC Direction")
                {
                    Caption = 'IC Direction';
                }
                field(icReferenceDocumentNo; Rec."IC Reference Document No.")
                {
                    Caption = 'IC Reference Document No.';
                }
                field(icStatus; Rec."IC Status")
                {
                    Caption = 'IC Status';
                }
                field(inHandsDate; Rec."In-Hands Date")
                {
                    Caption = 'In-Hands Date';
                }
                field(incomingDocumentEntryNo; Rec."Incoming Document Entry No.")
                {
                    Caption = 'Incoming Document Entry No.';
                }
                field(industryShortcutDimension; Rec."Industry Shortcut Dimension")
                {
                    Caption = 'Industry Shortcut Dimension';
                }
                field(insurerName; Rec."Insurer Name")
                {
                    Caption = 'Insurer Name';
                }
                field(insurerPolicyNumber; Rec."Insurer Policy Number")
                {
                    Caption = 'Insurer Policy Number';
                }
                field(invoice; Rec.Invoice)
                {
                    Caption = 'Invoice';
                }
                field(invoiceDiscCode; Rec."Invoice Disc. Code")
                {
                    Caption = 'Invoice Disc. Code';
                }
                field(invoiceDiscountAmount; Rec."Invoice Discount Amount")
                {
                    Caption = 'Invoice Discount Amount';
                }
                field(invoiceDiscountCalculation; Rec."Invoice Discount Calculation")
                {
                    Caption = 'Invoice Discount Calculation';
                }
                field(invoiceDiscountValue; Rec."Invoice Discount Value")
                {
                    Caption = 'Invoice Discount Value';
                }
                field(isTest; Rec.IsTest)
                {
                    Caption = 'IsTest';
                }
                field(issuerIDNoCL; Rec."Issuer ID No. -CL-")
                {
                    Caption = 'Issuer Identification Number';
                }
                field(jobQueueEntryID; Rec."Job Queue Entry ID")
                {
                    Caption = 'Job Queue Entry ID';
                }
                field(jobQueueStatus; Rec."Job Queue Status")
                {
                    Caption = 'Job Queue Status';
                }
                field(journalTemplName; Rec."Journal Templ. Name")
                {
                    Caption = 'Journal Template Name';
                }
                field(languageCode; Rec."Language Code")
                {
                    Caption = 'Language Code';
                }
                field(lastFollowupDate; Rec."Last Followup Date")
                {
                    Caption = 'Last Followup Date';
                }
                field(lastPostingNo; Rec."Last Posting No.")
                {
                    Caption = 'Last Posting No.';
                }
                field(lastPrepaymentNo; Rec."Last Prepayment No.")
                {
                    Caption = 'Last Prepayment No.';
                }
                field(lastPrepmtCrMemoNo; Rec."Last Prepmt. Cr. Memo No.")
                {
                    Caption = 'Last Prepmt. Cr. Memo No.';
                }
                field(lastReturnReceiptNo; Rec."Last Return Receipt No.")
                {
                    Caption = 'Last Return Receipt No.';
                }
                field(lastShipmentDate; Rec."Last Shipment Date")
                {
                    Caption = 'Last Shipment Date';
                }
                field(lastShippingNo; Rec."Last Shipping No.")
                {
                    Caption = 'Last Shipping No.';
                }
                field(lateOrderShipping; Rec."Late Order Shipping")
                {
                    Caption = 'Late Order Shipping';
                }
                field(layawayCL; Rec."Layaway -CL-")
                {
                    Caption = 'Layaway';
                }
                field(layawayTermsCodeCL; Rec."Layaway Terms Code -CL-")
                {
                    Caption = 'Layaway Terms Code';
                }
                field(leadTime; Rec."Lead Time")
                {
                    Caption = 'Lead Time';
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }
                field(locationCodeCustom; Rec."Location Code (Custom)")
                {
                    Caption = 'Location Code (Custom)';
                }
                field(locationOverride; Rec."Location Override")
                {
                    Caption = 'Location Override';
                }
                field(manuallyReleasedCL; Rec."Manually Released -CL-")
                {
                    Caption = 'Manually Released';
                }
                field(medicalInsPolicyNumber; Rec."Medical Ins. Policy Number")
                {
                    Caption = 'Medical Ins. Policy Number';
                }
                field(medicalInsurerName; Rec."Medical Insurer Name")
                {
                    Caption = 'Medical Insurer Name';
                }
                field(modifiedLocationCode; Rec."Modified Location Code")
                {
                    Caption = 'Modified Location Code';
                }
                field(needsAssessment; Rec."Needs Assessment")
                {
                    Caption = 'Needs Assessment';
                }
                field(needsApproval; Rec.Needs_Approval)
                {
                    Caption = 'Needs Approval';
                }
                field(netAmountSettledLCYCL; Rec."Net Amount Settled (LCY) -CL-")
                {
                    Caption = 'Net Amount Settled ($)';
                }
                field(netAmtToAuthSaleLCYCL; Rec."Net Amt to Auth-Sale (LCY)-CL-")
                {
                    Caption = 'Net Amt. to Auth.-Sale ($)';
                }
                field(netAmtAuthHoldLCYCL; Rec."Net Amt. Auth.-Hold (LCY) -CL-")
                {
                    Caption = 'Net Amt. Auth. On Hold (LCY)';
                }
                field(netAmtAuthSaleLCYCL; Rec."Net Amt. Auth.-Sale (LCY) -CL-")
                {
                    Caption = 'Net Amt. Authorized-Sale ($)';
                }
                field(netAmtAuthorizedLCYCL; Rec."Net Amt. Authorized (LCY) -CL-")
                {
                    Caption = 'Net Amount Authorized ($)';
                }
                field(netAmtSetSaleLCYCL; Rec."Net Amt. Set.-Sale (LCY) -CL-")
                {
                    Caption = 'Net Amount Settled-Sale ($)';
                }
                field(netAmtToAuthLCYCL; Rec."Net Amt. to Auth. (LCY) -CL-")
                {
                    Caption = 'Net Amount to Authorize ($)';
                }
                field(netAmtToSettleLCYCL; Rec."Net Amt. to Settle (LCY) -CL-")
                {
                    Caption = 'Net Amount to Settle ($)';
                }
                field(netAmtToStlSaleLCYCL; Rec."Net Amt. to Stl-Sale (LCY)-CL-")
                {
                    Caption = 'Net Amt. to Settle-Sale ($)';
                }
                field(nextFollowupDate; Rec."Next Followup Date")
                {
                    Caption = 'Next Followup Date';
                }
                field(noEMailedCL; Rec."No. E-mailed -CL-")
                {
                    Caption = 'No. E-mailed';
                }
                field(noPrinted; Rec."No. Printed")
                {
                    Caption = 'No. Printed';
                }
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                }
                field(noOfArchivedVersions; Rec."No. of Archived Versions")
                {
                    Caption = 'No. of Archived Versions';
                }
                // field(orbBusinessDevelopment; Rec."ORB Business Development")
                // {
                //     Caption = 'Business Development';
                // }
                // field(orbCustomerSupport; Rec."ORB Customer Support")
                // {
                //     Caption = 'Customer Support';
                // }
                field(orbDSPaymentAccountNo; Rec."ORB DS Payment Account No.")
                {
                    Caption = 'DS Payment Account No.';
                }
                field(orbDSPaymentType; Rec."ORB DS Payment Type")
                {
                    Caption = 'DS Payment Type';
                }
                field(orbDeclaredValue; Rec."ORB Declared Value")
                {
                    Caption = 'Declared Value';
                }
                field(orbDelayedShipReasonCode; Rec."ORB Delayed Ship Reason Code")
                {
                    Caption = 'Delayed Shipment Reason Code';
                }
                field(orbDelayedShipSubReason; Rec."ORB Delayed Ship Sub-Reason")
                {
                    Caption = 'Delayed Shipment Sub-Reason Code';
                }
                field(orbEscalationReasonCode; Rec."ORB Escalation Reason Code")
                {
                    Caption = 'Escalation Reason Code';
                }
                field(orbFreightLine; Rec."ORB Freight Line")
                {
                    Caption = 'Freight Line';
                }
                field(orbInternationalContact; Rec."ORB International Contact")
                {
                    Caption = 'International Contact';
                }
                field(orbLastFollowupBy; Rec."ORB Last Followup By")
                {
                    Caption = 'Last Followup By';
                }
                field(orbLiftOrder; Rec."ORB Lift Order")
                {
                    Caption = 'Lift Order';
                }
                field(orbMagentoCC4Digits; Rec."ORB Magento CC 4 Digits")
                {
                    Caption = 'Magento CC 4 Digits';
                }
                field(orbMagentoLocationCode; Rec."ORB Magento Location Code")
                {
                    Caption = 'Magento Location Code';
                }
                field(orbMagentoOrder; Rec."ORB Magento Order #")
                {
                    Caption = 'Magento Order #';
                }
                field(orbOriginalPromisedShipDt; Rec."ORB Original Promised Ship Dt.")
                {
                    Caption = 'Original Promised Shipment Date';
                }
                field(orbRUSH; Rec."ORB RUSH")
                {
                    Caption = 'RUSH';
                }
                field(orbRequireReview; Rec."ORB Require Review")
                {
                    Caption = 'Require Review';
                }
                field(orbResolvedBy; Rec."ORB Resolved By")
                {
                    Caption = 'Resolved By';
                }
                field(orbShipToContactNameAPI; Rec."ORB Ship-to Contact Name (API)")
                {
                    Caption = 'Ship-to Contact Name (API)';
                }
                field(orbShipmentDate; Rec."ORB Shipment Date")
                {
                    Caption = 'ORB Shipment Date';
                }
                field(orbTaxID; Rec."ORB Tax ID")
                {
                    Caption = 'Tax ID';
                }
                field(orbTotalPaymentAmount; Rec."ORB Total Payment Amount")
                {
                    Caption = 'Total Payment Amount';
                }
                field(orbYourReferenceAPI; Rec."ORB Your Reference (API)")
                {
                    Caption = 'Your Reference (API)';
                }
                field(orbYourReferenceCS; Rec."ORB Your Reference(CS)")
                {
                    Caption = 'Your Reference(CS)';
                }
                field(onHold; Rec."On Hold")
                {
                    Caption = 'On Hold';
                }
                field(opportunityNo; Rec."Opportunity No.")
                {
                    Caption = 'Opportunity No.';
                }
                field(orderClass; Rec."Order Class")
                {
                    Caption = 'Order Class';
                }
                field(orderDate; Rec."Order Date")
                {
                    Caption = 'Order Date';
                }
                field(orderTimeCL; Rec."Order Time -CL-")
                {
                    Caption = 'Order Time';
                }
                field(outboundWhseHandlingTime; Rec."Outbound Whse. Handling Time")
                {
                    Caption = 'Outbound Whse. Handling Time';
                }
                field(outstandingAmount; Rec."Outstanding Amount ($)")
                {
                    Caption = 'Outstanding Amount ($)';
                }
                field(posTypeCL; Rec."POS Type -CL-")
                {
                    Caption = 'POS Type';
                }
                field(paymentDiscount; Rec."Payment Discount %")
                {
                    Caption = 'Payment Discount %';
                }
                field(paymentMethodCode; Rec."Payment Method Code")
                {
                    Caption = 'Payment Method Code';
                }
                field(paymentServiceSetID; Rec."Payment Service Set ID")
                {
                    Caption = 'Payment Service Set ID';
                }
                field(paymentTermsCode; Rec."Payment Terms Code")
                {
                    Caption = 'Payment Terms Code';
                }
                field(paymentTermsOnOpenPage; Rec."Payment Terms OnOpenPage")
                {
                    Caption = 'Payment Terms OnOpenPage';
                }
                field(paymentTypeNew; Rec."Payment Type (new)")
                {
                    Caption = 'Payment Type (new)';
                }
                field(pmtDiscountDate; Rec."Pmt. Discount Date")
                {
                    Caption = 'Pmt. Discount Date';
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }
                field(postingDescription; Rec."Posting Description")
                {
                    Caption = 'Posting Description';
                }
                field(postingNo; Rec."Posting No.")
                {
                    Caption = 'Posting No.';
                }
                field(postingNoSeries; Rec."Posting No. Series")
                {
                    Caption = 'Posting No. Series';
                }
                field(postingFromWhseRef; Rec."Posting from Whse. Ref.")
                {
                    Caption = 'Posting from Whse. Ref.';
                }
                field(prepayment; Rec."Prepayment %")
                {
                    Caption = 'Prepayment %';
                }
                field(prepaymentDueDate; Rec."Prepayment Due Date")
                {
                    Caption = 'Prepayment Due Date';
                }
                field(prepaymentNo; Rec."Prepayment No.")
                {
                    Caption = 'Prepayment No.';
                }
                field(prepaymentNoSeries; Rec."Prepayment No. Series")
                {
                    Caption = 'Prepayment No. Series';
                }
                field(prepaymentReceieved; Rec."Prepayment Receieved")
                {
                    Caption = 'Prepayment Receieved';
                }
                field(prepmtCrMemoNo; Rec."Prepmt. Cr. Memo No.")
                {
                    Caption = 'Prepmt. Cr. Memo No.';
                }
                field(prepmtCrMemoNoSeries; Rec."Prepmt. Cr. Memo No. Series")
                {
                    Caption = 'Prepmt. Cr. Memo No. Series';
                }
                field(prepmtIncludeTax; Rec."Prepmt. Include Tax")
                {
                    Caption = 'Prepmt. Include Tax';
                }
                field(prepmtPaymentDiscount; Rec."Prepmt. Payment Discount %")
                {
                    Caption = 'Prepmt. Payment Discount %';
                }
                field(prepmtPaymentTermsCode; Rec."Prepmt. Payment Terms Code")
                {
                    Caption = 'Prepmt. Payment Terms Code';
                }
                field(prepmtPmtDiscountDate; Rec."Prepmt. Pmt. Discount Date")
                {
                    Caption = 'Prepmt. Pmt. Discount Date';
                }
                field(prepmtPostingDescription; Rec."Prepmt. Posting Description")
                {
                    Caption = 'Prepmt. Posting Description';
                }
                field(prepmtSalesTaxRoundingAmt; Rec."Prepmt. Sales Tax Rounding Amt")
                {
                    Caption = 'Prepayment Sales Tax Rounding Amount';
                }
                field(preventAccNumEntryCL; Rec."Prevent Acc. Num. Entry -CL-")
                {
                    Caption = 'Prevent Account Number Entry';
                }
                field(previewModeCL; Rec."Preview Mode -CL-")
                {
                    Caption = 'Preview Mode';
                }
                field(priceCalculationMethod; Rec."Price Calculation Method")
                {
                    Caption = 'Price Calculation Method';
                }
                field(pricesIncludingVAT; Rec."Prices Including VAT")
                {
                    Caption = 'Prices Including VAT';
                }
                field(printPostedDocuments; Rec."Print Posted Documents")
                {
                    Caption = 'Print Posted Documents';
                }
                field(probabilityPercentage; Rec."Probability Percentage")
                {
                    Caption = 'Probability Percentage';
                }
                field(productionScanTime; Rec."Production Scan Time")
                {
                    Caption = 'Production Scan Time';
                }
                field(projectNo; Rec."Project No.")
                {
                    Caption = 'Project No.';
                }
                field(promisedDeliveryDate; Rec."Promised Delivery Date")
                {
                    Caption = 'Promised Delivery Date';
                }
                field(protectedAccountNumberCL; Rec."Protected Account Number -CL-")
                {
                    Caption = 'Protected Account Number';
                }
                field(quoteAccepted; Rec."Quote Accepted")
                {
                    Caption = 'Quote Accepted';
                }
                field(quoteAcceptedDate; Rec."Quote Accepted Date")
                {
                    Caption = 'Quote Accepted Date';
                }
                field(quoteNo; Rec."Quote No.")
                {
                    Caption = 'Quote No.';
                }
                field(quoteSentToCustomer; Rec."Quote Sent to Customer")
                {
                    Caption = 'Quote Sent to Customer';
                }
                field(quoteValidUntilDate; Rec."Quote Valid Until Date")
                {
                    Caption = 'Quote Valid To Date';
                }
                field(rcvdFromCountRegionCode; Rec."Rcvd.-from Count./Region Code")
                {
                    Caption = 'Received-from Country/Region Code';
                }
                field(reasonCode; Rec."Reason Code")
                {
                    Caption = 'Reason Code';
                }
                field(recalculateInvoiceDisc; Rec."Recalculate Invoice Disc.")
                {
                    Caption = 'Recalculate Invoice Disc.';
                }
                field(receive; Rec.Receive)
                {
                    Caption = 'Receive';
                }
                field(registeredWarehousePickNo; Rec."Registered Warehouse Pick No.")
                {
                    Caption = 'Registered Warehouse Pick No.';
                }
                field(registrationNumber; Rec."Registration Number")
                {
                    Caption = 'Registration No.';
                }
                field(requestedDeliveryDate; Rec."Requested Delivery Date")
                {
                    Caption = 'Requested Delivery Date';
                }
                field(reserve; Rec.Reserve)
                {
                    Caption = 'Reserve';
                }
                field(responsibilityCenter; Rec."Responsibility Center")
                {
                    Caption = 'Responsibility Center';
                }
                field(returnReceiptNo; Rec."Return Receipt No.")
                {
                    Caption = 'Return Receipt No.';
                }
                field(returnReceiptNoSeries; Rec."Return Receipt No. Series")
                {
                    Caption = 'Return Receipt No. Series';
                }
                field(routingNumberCL; Rec."Routing Number -CL-")
                {
                    Caption = 'Routing Number';
                }
                field(rush; Rec.Rush)
                {
                    Caption = 'Rush';
                }
                field(satAddressID; Rec."SAT Address ID")
                {
                    Caption = 'SAT Address ID';
                }
                field(satCustomsRegime; Rec."SAT Customs Regime")
                {
                    Caption = 'SAT Customs Regime';
                }
                field(satInternationalTradeTerm; Rec."SAT International Trade Term")
                {
                    Caption = 'SAT International Trade Term';
                }
                field(satTransferReason; Rec."SAT Transfer Reason")
                {
                    Caption = 'SAT Transfer Reason';
                }
                field(satWeightUnitOfMeasure; Rec."SAT Weight Unit Of Measure")
                {
                    Caption = 'SAT Weight Unit Of Measure';
                }
                field(soPaymentAccountNo; Rec."SO Payment Account No.")
                {
                    Caption = 'Sales Order Payment Account No.';
                }
                field(steTransactionID; Rec."STE Transaction ID")
                {
                    Caption = 'STE Transaction ID';
                }
                field(salesOrderAssignedTo; Rec."Sales Order Assigned To")
                {
                    Caption = 'Sales Order Assigned To';
                }
                field(salesOrderCreatedBy; Rec."Sales Order Created By")
                {
                    Caption = 'Sales Order Created By';
                }
                field(salesOrderPaymentType; Rec."Sales Order Payment Type")
                {
                    Caption = 'Sales Order Payment Type';
                }
                field(salesOrderShipmentMethod; Rec."Sales Order Shipment Method")
                {
                    Caption = 'Sales Order Shipment Method';
                }
                field(salesTaxAmountRounding; Rec."Sales Tax Amount Rounding")
                {
                    Caption = 'Sales Tax Amount Rounding';
                }
                field(salesPersonEmail; Rec."SalesPerson Email")
                {
                    Caption = 'SalesPerson Email';
                }
                field(salespersonCode; Rec."Salesperson Code")
                {
                    Caption = 'Salesperson Code';
                }
                field(sellToContactNameCustom; Rec."Sell-To Contact Name (Custom)")
                {
                    Caption = 'Sell-To Contact Name (Custom)';
                }
                field(sellToEmailCustom; Rec."Sell-To Email (Custom)")
                {
                    Caption = 'Sell-To Email (Custom)';
                }
                field(sellToContact; Rec."Sell-to Contact")
                {
                    Caption = 'Sell-to Contact';
                }
                field(sellToContactNo; Rec."Sell-to Contact No.")
                {
                    Caption = 'Sell-to Contact No.';
                }
                field(sellToCustomerTemplCode; Rec."Sell-to Customer Templ. Code")
                {
                    Caption = 'Sell-to Customer Template Code';
                }
                field(sellToEMail; Rec."Sell-to E-Mail")
                {
                    Caption = 'Email';
                }
                field(sellToICPartnerCode; Rec."Sell-to IC Partner Code")
                {
                    Caption = 'Sell-to IC Partner Code';
                }
                field(sellToPhoneNo; Rec."Sell-to Phone No.")
                {
                    Caption = 'Sell-to Phone No.';
                }
                field(sellToCustomerNoHasValue; Rec."Sell-to-Customer No. Has Value")
                {
                    Caption = 'Sell-to-Customer No. Has Value';
                }
                field(sendICDocument; Rec."Send IC Document")
                {
                    Caption = 'Send IC Document';
                }
                field(ship; Rec.Ship)
                {
                    Caption = 'Ship';
                }
                field(shipToDataModified; Rec."Ship To Data Modified")
                {
                    Caption = 'Ship To Data Modified';
                }
                field(shipToCountryRegionCustom; Rec."Ship-To CountryRegion (Custom)")
                {
                    Caption = 'Ship-To CountryRegion (Custom)';
                }
                field(shipToCountyCustom; Rec."Ship-To County (Custom)")
                {
                    Caption = 'Ship-To County (Custom)';
                }
                field(shipToPostCodeCustom; Rec."Ship-To Post Code (Custom)")
                {
                    Caption = 'Ship-To Post Code (Custom)';
                }
                field(shipToAddress; Rec."Ship-to Address")
                {
                    Caption = 'Ship-to Address';
                }
                field(shipToAddressCustom; Rec."Ship-to Address (Custom)")
                {
                    Caption = 'Ship-to Address (Custom)';
                }
                field(shipToAddress2; Rec."Ship-to Address 2")
                {
                    Caption = 'Ship-to Address 2';
                }
                field(shipToAddress2Custom; Rec."Ship-to Address 2 (Custom)")
                {
                    Caption = 'Ship-to Address 2 (Custom)';
                }
                field(shipToCity; Rec."Ship-to City")
                {
                    Caption = 'Ship-to City';
                }
                field(shipToCityCustom; Rec."Ship-to City (Custom)")
                {
                    Caption = 'Ship-to City (Custom)';
                }
                field(shipToCode; Rec."Ship-to Code")
                {
                    Caption = 'Ship-to Code';
                }
                field(shipToCodeCustom; Rec."Ship-to Code (Custom)")
                {
                    Caption = 'Ship-to Code (Custom)';
                }
                field(shipToContact; Rec."Ship-to Contact")
                {
                    Caption = 'Ship-to Contact';
                }
                field(shipToContactCustom; Rec."Ship-to Contact (Custom)")
                {
                    Caption = 'Ship-to Contact (Custom)';
                }
                field(shipToCountryRegionCode; Rec."Ship-to Country/Region Code")
                {
                    Caption = 'Ship-to Country/Region Code';
                }
                field(shipToCounty; Rec."Ship-to County")
                {
                    Caption = 'Ship-to County';
                }
                field(shipToName; Rec."Ship-to Name")
                {
                    Caption = 'Ship-to Name';
                }
                field(shipToNameCustom; Rec."Ship-to Name (Custom)")
                {
                    Caption = 'Ship-to Name (Custom)';
                }
                field(shipToName2; Rec."Ship-to Name 2")
                {
                    Caption = 'Ship-to Name 2';
                }
                field(shipToName2Custom; Rec."Ship-to Name 2 (Custom)")
                {
                    Caption = 'Ship-to Name 2 (Custom)';
                }
                field(shipToPhoneNoCL; Rec."Ship-to Phone No. -CL-")
                {
                    Caption = 'Ship-to Phone No.';
                }
                field(shipToPostCode; Rec."Ship-to Post Code")
                {
                    Caption = 'Ship-to Post Code';
                }
                field(shipToUPSZone; Rec."Ship-to UPS Zone")
                {
                    Caption = 'Ship-to UPS Zone';
                }
                field(shipmentDate; Rec."Shipment Date")
                {
                    Caption = 'Shipment Date';
                }
                field(shipmentMethodCode; Rec."Shipment Method Code")
                {
                    Caption = 'Shipment Method Code';
                }
                field(shipped; Rec.Shipped)
                {
                    Caption = 'Shipped';
                }
                field(shippedNotInvoiced; Rec."Shipped Not Invoiced")
                {
                    Caption = 'Shipped Not Invoiced';
                }
                field(shippingAdvice; Rec."Shipping Advice")
                {
                    Caption = 'Shipping Advice';
                }
                field(shippingAgentCode; Rec."Shipping Agent Code")
                {
                    Caption = 'Shipping Agent Code';
                }
                field(shippingAgentServiceCode; Rec."Shipping Agent Service Code")
                {
                    Caption = 'Shipping Agent Service Code';
                }
                field(shippingAgentServiceCode2; Rec."Shipping Agent Service Code 2")
                {
                    Caption = 'Shipping Agent Service Code 2';
                }
                field(shippingNo; Rec."Shipping No.")
                {
                    Caption = 'Shipping No.';
                }
                field(shippingNoSeries; Rec."Shipping No. Series")
                {
                    Caption = 'Shipping No. Series';
                }
                field(shippingTime; Rec."Shipping Time")
                {
                    Caption = 'Shipping Time';
                }
                field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
                {
                    Caption = 'Shortcut Dimension 1 Code';
                }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                {
                    Caption = 'Shortcut Dimension 2 Code';
                }
                field(surchargeAuthSaleCL; Rec."Surcharge Auth.-Sale -CL-")
                {
                    Caption = 'Surcharge Amount Authorized - Sale';
                }
                field(surchargeAuthorizedCL; Rec."Surcharge Authorized -CL-")
                {
                    Caption = 'Surcharge Amount Authorized';
                }
                field(surchargeSetSaleCL; Rec."Surcharge Set.-Sale -CL-")
                {
                    Caption = 'Surcharge Amount Settled - Sale';
                }
                field(surchargeSettledCL; Rec."Surcharge Settled -CL-")
                {
                    Caption = 'Surcharge Amount Settled';
                }
                field(surchargeToAuthSaleCL; Rec."Surcharge to Auth-Sale -CL-")
                {
                    Caption = 'Surcharge Amount to Authorize - Sale';
                }
                field(surchargeToAuthCL; Rec."Surcharge to Auth. -CL-")
                {
                    Caption = 'Surcharge Amount to Authorize';
                }
                field(surchargeToSettleCL; Rec."Surcharge to Settle -CL-")
                {
                    Caption = 'Surcharge Amount to Settle';
                }
                field(surchargeToStlSaleCL; Rec."Surcharge to Stl-Sale -CL-")
                {
                    Caption = 'Surcharge Amount to Settle - Sale';
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
                field(tFlowStatus; Rec.TFlowStatus)
                {
                    Caption = 'TFlowStatus';
                }
                field(taxAreaCode; Rec."Tax Area Code")
                {
                    Caption = 'Tax Area Code';
                }
                field(taxExemptionNo; Rec."Tax Exemption No.")
                {
                    Caption = 'Tax Exemption No.';
                }
                field(taxLiable; Rec."Tax Liable")
                {
                    Caption = 'Tax Liable';
                }
                field(trailer1; Rec."Trailer 1")
                {
                    Caption = 'Trailer 1';
                }
                field(trailer2; Rec."Trailer 2")
                {
                    Caption = 'Trailer 2';
                }
                field(transactionSpecification; Rec."Transaction Specification")
                {
                    Caption = 'Transaction Specification';
                }
                field(transactionType; Rec."Transaction Type")
                {
                    Caption = 'Transaction Type';
                }
                field(transitDistance; Rec."Transit Distance")
                {
                    Caption = 'Transit Distance';
                }
                field(transitHours; Rec."Transit Hours")
                {
                    Caption = 'Transit Hours';
                }
                field(transitFromDateTime; Rec."Transit-from Date/Time")
                {
                    Caption = 'Transit-from Date/Time';
                }
                field(transportMethod; Rec."Transport Method")
                {
                    Caption = 'Transport Method';
                }
                field(transportOperators; Rec."Transport Operators")
                {
                    Caption = 'Transport Operators';
                }
                field(upsAccountNumber; Rec."UPS Account Number")
                {
                    Caption = 'UPS Account Number';
                }
                field(vatBaseDiscount; Rec."VAT Base Discount %")
                {
                    Caption = 'VAT Base Discount %';
                }
                field(vatBusPostingGroup; Rec."VAT Bus. Posting Group")
                {
                    Caption = 'VAT Bus. Posting Group';
                }
                field(vatCountryRegionCode; Rec."VAT Country/Region Code")
                {
                    Caption = 'VAT Country/Region Code';
                }
                field(vatRegistrationNo; Rec."VAT Registration No.")
                {
                    Caption = 'VAT Registration No.';
                }
                field(vatReportingDate; Rec."VAT Reporting Date")
                {
                    Caption = 'VAT Date';
                }
                field(vehicleCode; Rec."Vehicle Code")
                {
                    Caption = 'Vehicle Code';
                }
                field(wmdmPOS; Rec."WMDM POS")
                {
                    Caption = 'Warehouse Insight POS';
                }
                field(warehousePickNo; Rec."Warehouse Pick No.")
                {
                    Caption = 'Warehouse Pick No.';
                }
                field(workDescription; Rec."Work Description")
                {
                    Caption = 'Work Description';
                }
                field(yourReference; Rec."Your Reference")
                {
                    Caption = 'Your Reference';
                }
            }
        }
    }
}
