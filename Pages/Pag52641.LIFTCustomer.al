page 52641 "ORB LIFT Customer"
{
    APIGroup = 'Orbus';
    APIPublisher = 'Orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'LIFT Customer';
    DelayedInsert = true;
    EntityName = 'LIFTCustomer';
    EntitySetName = 'LIFTCustomer';
    PageType = API;
    SourceTable = Customer;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(searchName; Rec."Search Name")
                {
                    Caption = 'Search Name';
                }
                field(name2; Rec."Name 2")
                {
                    Caption = 'Name 2';
                }
                field(address; Rec.Address)
                {
                    Caption = 'Address';
                }
                field(address2; Rec."Address 2")
                {
                    Caption = 'Address 2';
                }
                field(city; Rec.City)
                {
                    Caption = 'City';
                }
                field(contact; Rec.Contact)
                {
                    Caption = 'Contact';
                }
                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                }
                field(telexNo; Rec."Telex No.")
                {
                    Caption = 'Telex No.';
                }
                field(documentSendingProfile; Rec."Document Sending Profile")
                {
                    Caption = 'Document Sending Profile';
                }
                field(shipToCode; Rec."Ship-to Code")
                {
                    Caption = 'Ship-to Code';
                }
                field(ourAccountNo; Rec."Our Account No.")
                {
                    Caption = 'Our Account No.';
                }
                field(territoryCode; Rec."Territory Code")
                {
                    Caption = 'Territory Code';
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                }
                field(chainName; Rec."Chain Name")
                {
                    Caption = 'Chain Name';
                }
                field(budgetedAmount; Rec."Budgeted Amount")
                {
                    Caption = 'Budgeted Amount';
                }
                field(creditLimitLCY; Rec."Credit Limit (LCY)")
                {
                    Caption = 'Credit Limit (LCY)';
                }
                field(customerPostingGroup; Rec."Customer Posting Group")
                {
                    Caption = 'Customer Posting Group';
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                }
                field(customerPriceGroup; Rec."Customer Price Group")
                {
                    Caption = 'Customer Price Group';
                }
                field(languageCode; Rec."Language Code")
                {
                    Caption = 'Language Code';
                }
                field(registrationNumber; Rec."Registration Number")
                {
                    Caption = 'Registration No.';
                }
                field(statisticsGroup; Rec."Statistics Group")
                {
                    Caption = 'Statistics Group';
                }
                field(paymentTermsCode; Rec."Payment Terms Code")
                {
                    Caption = 'Payment Terms Code';
                }
                field(finChargeTermsCode; Rec."Fin. Charge Terms Code")
                {
                    Caption = 'Fin. Charge Terms Code';
                }
                field(salespersonCode; Rec."Salesperson Code")
                {
                    Caption = 'Key/National Account Manager';
                }
                field(shipmentMethodCode; Rec."Shipment Method Code")
                {
                    Caption = 'Shipment Method Code';
                }
                field(shippingAgentCode; Rec."Shipping Agent Code")
                {
                    Caption = 'Shipping Agent Code';
                }
                field(placeOfExport; Rec."Place of Export")
                {
                    Caption = 'Place of Export';
                }
                field(invoiceDiscCode; Rec."Invoice Disc. Code")
                {
                    Caption = 'Invoice Disc. Code';
                }
                field(customerDiscGroup; Rec."Customer Disc. Group")
                {
                    Caption = 'Customer Disc. Group';
                }
                field(countryRegionCode; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                }
                field(collectionMethod; Rec."Collection Method")
                {
                    Caption = 'Collection Method';
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                }
                field(comment; Rec.Comment)
                {
                    Caption = 'Comment';
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                }
                field(invoiceCopies; Rec."Invoice Copies")
                {
                    Caption = 'Invoice Copies';
                }
                field(lastStatementNo; Rec."Last Statement No.")
                {
                    Caption = 'Last Statement No.';
                }
                field(printStatements; Rec."Print Statements")
                {
                    Caption = 'Print Statements';
                }
                field(billToCustomerNo; Rec."Bill-to Customer No.")
                {
                    Caption = 'Bill-to Customer No.';
                }
                field(priority; Rec.Priority)
                {
                    Caption = 'Priority';
                }
                field(paymentMethodCode; Rec."Payment Method Code")
                {
                    Caption = 'Payment Method Code';
                }
                field(formatRegion; Rec."Format Region")
                {
                    Caption = 'Format Region';
                }
                field(lastModifiedDateTime; Rec."Last Modified Date Time")
                {
                    Caption = 'Last Modified Date Time';
                }
                field(lastDateModified; Rec."Last Date Modified")
                {
                    Caption = 'Last Date Modified';
                }
                field(balance; Rec.Balance)
                {
                    Caption = 'Balance';
                }
                field(balanceLCY; Rec."Balance (LCY)")
                {
                    Caption = 'Balance (LCY)';
                }
                field(netChange; Rec."Net Change")
                {
                    Caption = 'Net Change';
                }
                field(netChangeLCY; Rec."Net Change (LCY)")
                {
                    Caption = 'Net Change (LCY)';
                }
                field(salesLCY; Rec."Sales (LCY)")
                {
                    Caption = 'Sales (LCY)';
                }
                field(profitLCY; Rec."Profit (LCY)")
                {
                    Caption = 'Profit (LCY)';
                }
                field(invDiscountsLCY; Rec."Inv. Discounts (LCY)")
                {
                    Caption = 'Inv. Discounts (LCY)';
                }
                field(pmtDiscountsLCY; Rec."Pmt. Discounts (LCY)")
                {
                    Caption = 'Pmt. Discounts (LCY)';
                }
                field(balanceDue; Rec."Balance Due")
                {
                    Caption = 'Balance Due';
                }
                field(balanceDueLCY; Rec."Balance Due (LCY)")
                {
                    Caption = 'Balance Due (LCY)';
                }
                field(payments; Rec.Payments)
                {
                    Caption = 'Payments';
                }
                field(invoiceAmounts; Rec."Invoice Amounts")
                {
                    Caption = 'Invoice Amounts';
                }
                field(crMemoAmounts; Rec."Cr. Memo Amounts")
                {
                    Caption = 'Cr. Memo Amounts';
                }
                field(financeChargeMemoAmounts; Rec."Finance Charge Memo Amounts")
                {
                    Caption = 'Finance Charge Memo Amounts';
                }
                field(paymentsLCY; Rec."Payments (LCY)")
                {
                    Caption = 'Payments (LCY)';
                }
                field(invAmountsLCY; Rec."Inv. Amounts (LCY)")
                {
                    Caption = 'Inv. Amounts (LCY)';
                }
                field(crMemoAmountsLCY; Rec."Cr. Memo Amounts (LCY)")
                {
                    Caption = 'Cr. Memo Amounts (LCY)';
                }
                field(finChargeMemoAmountsLCY; Rec."Fin. Charge Memo Amounts (LCY)")
                {
                    Caption = 'Fin. Charge Memo Amounts (LCY)';
                }
                field(outstandingOrders; Rec."Outstanding Orders")
                {
                    Caption = 'Outstanding Orders';
                }
                field(shippedNotInvoiced; Rec."Shipped Not Invoiced")
                {
                    Caption = 'Shipped Not Invoiced';
                }
                field(applicationMethod; Rec."Application Method")
                {
                    Caption = 'Application Method';
                }
                field(pricesIncludingVAT; Rec."Prices Including VAT")
                {
                    Caption = 'Prices Including VAT';
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }
                field(faxNo; Rec."Fax No.")
                {
                    Caption = 'Fax No.';
                }
                field(telexAnswerBack; Rec."Telex Answer Back")
                {
                    Caption = 'Telex Answer Back';
                }
                field(vatRegistrationNo; Rec."VAT Registration No.")
                {
                    Caption = 'VAT Registration No.';
                }
                field(combineShipments; Rec."Combine Shipments")
                {
                    Caption = 'Combine Shipments';
                }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                }
                field(gln; Rec.GLN)
                {
                    Caption = 'GLN';
                }
                field(postCode; Rec."Post Code")
                {
                    Caption = 'Post Code';
                }
                field(county; Rec.County)
                {
                    Caption = 'County';
                }
                field(eoriNumber; Rec."EORI Number")
                {
                    Caption = 'EORI Number';
                }
                field(useGLNInElectronicDocument; Rec."Use GLN in Electronic Document")
                {
                    Caption = 'Use GLN in Electronic Documents';
                }
                field(debitAmount; Rec."Debit Amount")
                {
                    Caption = 'Debit Amount';
                }
                field(creditAmount; Rec."Credit Amount")
                {
                    Caption = 'Credit Amount';
                }
                field(debitAmountLCY; Rec."Debit Amount (LCY)")
                {
                    Caption = 'Debit Amount (LCY)';
                }
                field(creditAmountLCY; Rec."Credit Amount (LCY)")
                {
                    Caption = 'Credit Amount (LCY)';
                }
                field(eMail; Rec."E-Mail")
                {
                    Caption = 'Email';
                }
                field(homePage; Rec."Home Page")
                {
                    Caption = 'Home Page';
                }
                field(reminderTermsCode; Rec."Reminder Terms Code")
                {
                    Caption = 'Reminder Terms Code';
                }
                field(reminderAmounts; Rec."Reminder Amounts")
                {
                    Caption = 'Reminder Amounts';
                }
                field(reminderAmountsLCY; Rec."Reminder Amounts (LCY)")
                {
                    Caption = 'Reminder Amounts (LCY)';
                }
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
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
                field(outstandingOrdersLCY; Rec."Outstanding Orders (LCY)")
                {
                    Caption = 'Outstanding Orders (LCY)';
                }
                field(shippedNotInvoicedLCY; Rec."Shipped Not Invoiced (LCY)")
                {
                    Caption = 'Shipped Not Invoiced (LCY)';
                }
                field(reserve; Rec.Reserve)
                {
                    Caption = 'Reserve';
                }
                field(blockPaymentTolerance; Rec."Block Payment Tolerance")
                {
                    Caption = 'Block Payment Tolerance';
                }
                field(pmtDiscToleranceLCY; Rec."Pmt. Disc. Tolerance (LCY)")
                {
                    Caption = 'Pmt. Disc. Tolerance (LCY)';
                }
                field(pmtToleranceLCY; Rec."Pmt. Tolerance (LCY)")
                {
                    Caption = 'Pmt. Tolerance (LCY)';
                }
                field(icPartnerCode; Rec."IC Partner Code")
                {
                    Caption = 'IC Partner Code';
                }
                field(refunds; Rec.Refunds)
                {
                    Caption = 'Refunds';
                }
                field(refundsLCY; Rec."Refunds (LCY)")
                {
                    Caption = 'Refunds (LCY)';
                }
                field(otherAmounts; Rec."Other Amounts")
                {
                    Caption = 'Other Amounts';
                }
                field(otherAmountsLCY; Rec."Other Amounts (LCY)")
                {
                    Caption = 'Other Amounts (LCY)';
                }
                field(prepayment; Rec."Prepayment %")
                {
                    Caption = 'Prepayment %';
                }
                field(outstandingInvoicesLCY; Rec."Outstanding Invoices (LCY)")
                {
                    Caption = 'Outstanding Invoices (LCY)';
                }
                field(outstandingInvoices; Rec."Outstanding Invoices")
                {
                    Caption = 'Outstanding Invoices';
                }
                field(billToNoOfArchivedDoc; Rec."Bill-to No. Of Archived Doc.")
                {
                    Caption = 'Bill-to No. Of Archived Doc.';
                }
                field(sellToNoOfArchivedDoc; Rec."Sell-to No. Of Archived Doc.")
                {
                    Caption = 'Sell-to No. Of Archived Doc.';
                }
                field(partnerType; Rec."Partner Type")
                {
                    Caption = 'Partner Type';
                }
                field(intrastatPartnerType; Rec."Intrastat Partner Type")
                {
                    Caption = 'Intrastat Partner Type';
                }
                field(excludeFromPmtPractices; Rec."Exclude from Pmt. Practices")
                {
                    Caption = 'Exclude from Payment Practices';
                }
                field(image; Rec.Image)
                {
                    Caption = 'Image';
                }
                field(privacyBlocked; Rec."Privacy Blocked")
                {
                    Caption = 'Privacy Blocked';
                }
                field(disableSearchByName; Rec."Disable Search by Name")
                {
                    Caption = 'Disable Search by Name';
                }
                field(allowMultiplePostingGroups; Rec."Allow Multiple Posting Groups")
                {
                    Caption = 'Allow Multiple Posting Groups';
                }
                field(preferredBankAccountCode; Rec."Preferred Bank Account Code")
                {
                    Caption = 'Preferred Bank Account Code';
                }
                field(coupledToDataverse; Rec."Coupled to Dataverse")
                {
                    Caption = 'Coupled to Dataverse';
                }
                field(cashFlowPaymentTermsCode; Rec."Cash Flow Payment Terms Code")
                {
                    Caption = 'Cash Flow Payment Terms Code';
                }
                field(primaryContactNo; Rec."Primary Contact No.")
                {
                    Caption = 'Primary Contact No.';
                }
                field(contactType; Rec."Contact Type")
                {
                    Caption = 'Contact Type';
                }
                field(mobilePhoneNo; Rec."Mobile Phone No.")
                {
                    Caption = 'Mobile Phone No.';
                }
                field(responsibilityCenter; Rec."Responsibility Center")
                {
                    Caption = 'Responsibility Center';
                }
                field(shippingAdvice; Rec."Shipping Advice")
                {
                    Caption = 'Shipping Advice';
                }
                field(shippingTime; Rec."Shipping Time")
                {
                    Caption = 'Shipping Time';
                }
                field(shippingAgentServiceCode; Rec."Shipping Agent Service Code")
                {
                    Caption = 'Shipping Agent Service Code';
                }
                field(serviceZoneCode; Rec."Service Zone Code")
                {
                    Caption = 'Service Zone Code';
                }
                field(contractGainLossAmount; Rec."Contract Gain/Loss Amount")
                {
                    Caption = 'Contract Gain/Loss Amount';
                }
                field(outstandingServOrdersLCY; Rec."Outstanding Serv. Orders (LCY)")
                {
                    Caption = 'Outstanding Serv. Orders (LCY)';
                }
                field(servShippedNotInvoicedLCY; Rec."Serv Shipped Not Invoiced(LCY)")
                {
                    Caption = 'Serv Shipped Not Invoiced(LCY)';
                }
                field(outstandingServInvoicesLCY; Rec."Outstanding Serv.Invoices(LCY)")
                {
                    Caption = 'Outstanding Serv.Invoices(LCY)';
                }
                field(priceCalculationMethod; Rec."Price Calculation Method")
                {
                    Caption = 'Price Calculation Method';
                }
                field(allowLineDisc; Rec."Allow Line Disc.")
                {
                    Caption = 'Allow Line Disc.';
                }
                field(noOfQuotes; Rec."No. of Quotes")
                {
                    Caption = 'No. of Quotes';
                }
                field(noOfBlanketOrders; Rec."No. of Blanket Orders")
                {
                    Caption = 'No. of Blanket Orders';
                }
                field(noOfOrders; Rec."No. of Orders")
                {
                    Caption = 'No. of Orders';
                }
                field(noOfInvoices; Rec."No. of Invoices")
                {
                    Caption = 'No. of Invoices';
                }
                field(noOfReturnOrders; Rec."No. of Return Orders")
                {
                    Caption = 'No. of Return Orders';
                }
                field(noOfCreditMemos; Rec."No. of Credit Memos")
                {
                    Caption = 'No. of Credit Memos';
                }
                field(noOfPstdShipments; Rec."No. of Pstd. Shipments")
                {
                    Caption = 'No. of Pstd. Shipments';
                }
                field(noOfPstdInvoices; Rec."No. of Pstd. Invoices")
                {
                    Caption = 'No. of Pstd. Invoices';
                }
                field(noOfPstdReturnReceipts; Rec."No. of Pstd. Return Receipts")
                {
                    Caption = 'No. of Pstd. Return Receipts';
                }
                field(noOfPstdCreditMemos; Rec."No. of Pstd. Credit Memos")
                {
                    Caption = 'No. of Pstd. Credit Memos';
                }
                field(noOfShipToAddresses; Rec."No. of Ship-to Addresses")
                {
                    Caption = 'No. of Ship-to Addresses';
                }
                field(billToNoOfQuotes; Rec."Bill-To No. of Quotes")
                {
                    Caption = 'Bill-To No. of Quotes';
                }
                field(billToNoOfBlanketOrders; Rec."Bill-To No. of Blanket Orders")
                {
                    Caption = 'Bill-To No. of Blanket Orders';
                }
                field(billToNoOfOrders; Rec."Bill-To No. of Orders")
                {
                    Caption = 'Bill-To No. of Orders';
                }
                field(billToNoOfInvoices; Rec."Bill-To No. of Invoices")
                {
                    Caption = 'Bill-To No. of Invoices';
                }
                field(billToNoOfReturnOrders; Rec."Bill-To No. of Return Orders")
                {
                    Caption = 'Bill-To No. of Return Orders';
                }
                field(billToNoOfCreditMemos; Rec."Bill-To No. of Credit Memos")
                {
                    Caption = 'Bill-To No. of Credit Memos';
                }
                field(billToNoOfPstdShipments; Rec."Bill-To No. of Pstd. Shipments")
                {
                    Caption = 'Bill-To No. of Pstd. Shipments';
                }
                field(billToNoOfPstdInvoices; Rec."Bill-To No. of Pstd. Invoices")
                {
                    Caption = 'Bill-To No. of Pstd. Invoices';
                }
                field(billToNoOfPstdReturnR; Rec."Bill-To No. of Pstd. Return R.")
                {
                    Caption = 'Bill-To No. of Pstd. Return R.';
                }
                field(billToNoOfPstdCrMemos; Rec."Bill-To No. of Pstd. Cr. Memos")
                {
                    Caption = 'Bill-To No. of Pstd. Cr. Memos';
                }
                field(baseCalendarCode; Rec."Base Calendar Code")
                {
                    Caption = 'Base Calendar Code';
                }
                field(copySellToAddrToQteFrom; Rec."Copy Sell-to Addr. to Qte From")
                {
                    Caption = 'Copy Sell-to Addr. to Qte From';
                }
                field(validateEUVatRegNo; Rec."Validate EU Vat Reg. No.")
                {
                    Caption = 'Validate EU VAT Reg. No.';
                }
                field(currencyId; Rec."Currency Id")
                {
                    Caption = 'Currency Id';
                }
                field(paymentTermsId; Rec."Payment Terms Id")
                {
                    Caption = 'Payment Terms Id';
                }
                field(shipmentMethodId; Rec."Shipment Method Id")
                {
                    Caption = 'Shipment Method Id';
                }
                field(paymentMethodId; Rec."Payment Method Id")
                {
                    Caption = 'Payment Method Id';
                }
                field(taxAreaID; Rec."Tax Area ID")
                {
                    Caption = 'Tax Area ID';
                }
                field(contactID; Rec."Contact ID")
                {
                    Caption = 'Contact ID';
                }
                field(contactGraphId; Rec."Contact Graph Id")
                {
                    Caption = 'Contact Graph Id';
                }
                field(upsZone; Rec."UPS Zone")
                {
                    Caption = 'UPS Zone';
                }
                field(taxExemptionNo; Rec."Tax Exemption No.")
                {
                    Caption = 'Tax Exemption No.';
                }
                field(bankCommunication; Rec."Bank Communication")
                {
                    Caption = 'Bank Communication';
                }
                field(checkDateFormat; Rec."Check Date Format")
                {
                    Caption = 'Check Date Format';
                }
                field(checkDateSeparator; Rec."Check Date Separator")
                {
                    Caption = 'Check Date Separator';
                }
                field(balanceOnDate; Rec."Balance on Date")
                {
                    Caption = 'Balance on Date';
                }
                field(balanceOnDateLCY; Rec."Balance on Date (LCY)")
                {
                    Caption = 'Balance on Date (LCY)';
                }
                field(rfcNo; Rec."RFC No.")
                {
                    Caption = 'RFC No.';
                }
                field(curpNo; Rec."CURP No.")
                {
                    Caption = 'CURP No.';
                }
                field(stateInscription; Rec."State Inscription")
                {
                    Caption = 'State Inscription';
                }
                field(taxIdentificationType; Rec."Tax Identification Type")
                {
                    Caption = 'Tax Identification Type';
                }
                field(cfdiPurpose; Rec."CFDI Purpose")
                {
                    Caption = 'CFDI Purpose';
                }
                field(cfdiRelation; Rec."CFDI Relation")
                {
                    Caption = 'CFDI Relation';
                }
                field(satTaxRegimeClassification; Rec."SAT Tax Regime Classification")
                {
                    Caption = 'SAT Tax Regime Classification';
                }
                field(cfdiExportCode; Rec."CFDI Export Code")
                {
                    Caption = 'CFDI Export Code';
                }
                field(cfdiGeneralPublic; Rec."CFDI General Public")
                {
                    Caption = 'CFDI General Public';
                }
                field(cfdiPeriod; Rec."CFDI Period")
                {
                    Caption = 'CFDI Period';
                }
                field(cfdiCustomerName; Rec."CFDI Customer Name")
                {
                    Caption = 'CFDI Customer Name';
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
                field(magentoID; Rec."Magento ID")
                {
                    Caption = 'Magento ID';
                }
                field(orbappAssociationsName; Rec.ORBAPPAssociationsName)
                {
                    Caption = 'Association';
                }
                field(orbAutoSendEmail; Rec."ORB Auto Send Email")
                {
                    Caption = 'Auto Send Email';
                }
                field(orbShipToState; Rec."ORB Ship-to State")
                {
                    Caption = 'Default State';
                }
                field(orbRegionalSalesExecutive; Rec."ORB Regional Sales Executive")
                {
                    Caption = 'Regional Sales Executive';
                }
                field(orbCustomerSupport; Rec."ORB Customer Support")
                {
                    Caption = 'Customer Support';
                }

                field(firstInvoiceDate; Rec."First Invoice Date")
                {
                    Caption = 'First Invoice Date';
                }
                field(magentoContactNo; Rec."Magento Contact No.")
                {
                    Caption = 'Magento Contact No.';
                }
                field(magentoContactName; Rec."Magento Contact Name")
                {
                    Caption = 'Magento Contact Name';
                }
                field(magentoContactEmail; Rec."Magento Contact Email")
                {
                    Caption = 'Magento Contact Email';
                }
                field(lastInvoiceDate; Rec."Last Invoice Date")
                {
                    Caption = 'Last Invoice Date';
                }
                field(docType; Rec.DocType)
                {
                    Caption = 'DocType';
                }
                field(shortcutDimension3Code; Rec."Shortcut Dimension 3 Code")
                {
                    Caption = 'Shortcut Dimension 3 Code';
                }
                field(shortcutDimension4Code; Rec."Shortcut Dimension 4 Code")
                {
                    Caption = 'Shortcut Dimension 4 Code';
                }
                field(shortcutDimension5Code; Rec."Shortcut Dimension 5 Code")
                {
                    Caption = 'Shortcut Dimension 5 Code';
                }
                field(shortcutDimension6Code; Rec."Shortcut Dimension 6 Code")
                {
                    Caption = 'Shortcut Dimension 6 Code';
                }
                field(shortcutDimension7Code; Rec."Shortcut Dimension 7 Code")
                {
                    Caption = 'Shortcut Dimension 7 Code';
                }
                field(shortcutDimension8Code; Rec."Shortcut Dimension 8 Code")
                {
                    Caption = 'Shortcut Dimension 8 Code';
                }
                field(needsMagentoID; Rec."Needs Magento ID")
                {
                    Caption = 'Needs Magento ID';
                }
                field(lastVisitDate; Rec."Last Visit Date")
                {
                    Caption = 'Last Visit Date';
                }
                field(defaultShipToCity; Rec."Default Ship-to City")
                {
                    Caption = 'Default Ship-to City';
                }
                field(international; Rec.International)
                {
                    Caption = 'International';
                }
                /*
                field(taxIDNoCL; Rec."Tax ID No. -CL-")
                {
                    Caption = 'Tax ID No.';
                }
                field(identificationNoCL; Rec."Identification No. -CL-")
                {
                    Caption = 'Identification No.';
                }
                field(identificationStateCL; Rec."Identification State -CL-")
                {
                    Caption = 'Identification State';
                }
                field(eftFraudProtStatusCL; Rec."EFT Fraud Prot. Status -CL-")
                {
                    Caption = 'EFT Fraud Protection Status';
                }
                field(doNotSaveCredCardNosCL; Rec."Do Not Save Cred. Card Nos-CL-")
                {
                    Caption = 'Do Not Auto-Save Credit Card Nos.';
                }
                field(doNotSaveChkActNosCL; Rec."Do Not Save Chk. Act. Nos-CL-")
                {
                    Caption = 'Do Not Auto-Save Checking Account Nos.';
                }
                field(searchEMailCL; Rec."Search E-Mail -CL-")
                {
                    Caption = 'Search E-Mail';
                }
                field(electronicInvoiceTypeCL; Rec."Electronic Invoice Type -CL-")
                {
                    Caption = 'Electronic Invoice Type';
                }
                field(lastClickToPayStmtURLCL; Rec."Last Click-to-Pay Stmt.URL-CL-")
                {
                    Caption = 'Last Click-to-Pay Statement URL';
                }
                field(lastClickToPayStmtDtCL; Rec."Last Click-to-Pay Stmt.Dt.-CL-")
                {
                    Caption = 'Last Click-to-Pay Statement Date';
                }
                field(loyaltyTierCodeCL; Rec."Loyalty Tier Code -CL-")
                {
                    Caption = 'Loyalty Tier Code';
                }
                field(loyaltyTierAwardedOnCL; Rec."Loyalty Tier Awarded On -CL-")
                {
                    Caption = 'Loyalty Tier Awarded On';
                }
                field(loyaltyTierExpiresOnCL; Rec."Loyalty Tier Expires On -CL-")
                {
                    Caption = 'Loyalty Tier Expires On';
                }
                field(tagCountCL; Rec."Tag Count -CL-")
                {
                    Caption = 'Tag Count';
                }
                field(doNotSyncVersapayARCCL; Rec."Do not Sync Versapay ARC -CL-")
                {
                    Caption = 'Do not Sync with the Versapay Cloud Platform';
                }
                field(parentCustomerNoCL; Rec."Parent Customer No. -CL-")
                {
                    Caption = 'Parent Customer No.';
                }
                field(indentationCL; Rec."Indentation -CL-")
                {
                    Caption = 'Indentation';
                }
                field(creditCardSurchargesCL; Rec."Credit Card Surcharges -CL-")
                {
                    Caption = 'Credit Card Surcharges';
                }
                field(notificationSuppressedCL; Rec."Notification Suppressed -CL-")
                {
                    Caption = 'Suppress E-Mail Notifications';
                }
                */
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
