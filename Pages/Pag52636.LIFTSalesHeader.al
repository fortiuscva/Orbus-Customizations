page 52636 "ORB LIFT Sales Header"
{
    ApplicationArea = All;
    Caption = 'LIFT Sales Header';
    PageType = List;
    SourceTable = "Sales Header";
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the type of the document.';
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ToolTip = 'Specifies the value of the Sell-to Customer No. field.';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the estimate.';
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ToolTip = 'Specifies the number of the customer that the invoice is sent to.';
                }
                field("Bill-to Name"; Rec."Bill-to Name")
                {
                    ToolTip = 'Specifies the name of the customer that the items are shipped to.';
                }
                field("Bill-to Name 2"; Rec."Bill-to Name 2")
                {
                    ToolTip = 'Specifies the value of the Bill-to Name 2 field.', Comment = '%';
                }
                field("Bill-to Address"; Rec."Bill-to Address")
                {
                    ToolTip = 'Specifies the address of the customer that you will send the invoice to.';
                }
                field("Bill-to Address 2"; Rec."Bill-to Address 2")
                {
                    ToolTip = 'Specifies an additional part of the billing address.';
                }
                field("Bill-to City"; Rec."Bill-to City")
                {
                    ToolTip = 'Specifies the city of the billing address.';
                }
                field("Bill-to Contact"; Rec."Bill-to Contact")
                {
                    ToolTip = 'Specifies the value of the Bill-to Contact field.';
                }
                field("Your Reference"; Rec."Your Reference")
                {
                    ToolTip = 'Specifies the customer''s reference. The content will be printed on sales documents.';
                }
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ToolTip = 'Specifies the code for another shipment address than the customer''s own address, which is entered by default.';
                }
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ToolTip = 'Specifies the name that products on the sales document will be shipped to.';
                }
                field("Ship-to Name 2"; Rec."Ship-to Name 2")
                {
                    ToolTip = 'Specifies the value of the Ship-to Name 2 field.', Comment = '%';
                }
                field("Ship-to Address"; Rec."Ship-to Address")
                {
                    ToolTip = 'Specifies the address that products on the sales document will be shipped to. By default, the field is filled with the value in the Address field on the customer card or with the value in the Address field in the Ship-to Address window.';
                }
                field("Ship-to Address 2"; Rec."Ship-to Address 2")
                {
                    ToolTip = 'Specifies an additional part of the shipping address.';
                }
                field("Ship-to City"; Rec."Ship-to City")
                {
                    ToolTip = 'Specifies the city of the shipping address.';
                }
                field("Ship-to Contact"; Rec."Ship-to Contact")
                {
                    ToolTip = 'Specifies the value of the Ship-to Contact field.';
                }
                field("Order Date"; Rec."Order Date")
                {
                    ToolTip = 'Specifies the date the order was created. The order date is also used to determine the prices and discounts on the document.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the date when the posting of the sales document will be recorded.';
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ToolTip = 'Specifies when items on the document are shipped or were shipped. A shipment date is usually calculated from a requested delivery date plus lead time.';
                }
                field("Posting Description"; Rec."Posting Description")
                {
                    ToolTip = 'Specifies additional posting information for the document. After you post the document, the description can add detail to vendor and customer ledger entries.';
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ToolTip = 'Specifies a formula that calculates the payment due date, payment discount date, and payment discount amount.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ToolTip = 'Specifies when the related sales invoice must be paid.';
                }
                field("Payment Discount %"; Rec."Payment Discount %")
                {
                    ToolTip = 'Specifies the payment discount percentage that is granted if the customer pays on or before the date entered in the Pmt. Discount Date field. The discount percentage is specified in the Payment Terms Code field.';
                }
                field("Pmt. Discount Date"; Rec."Pmt. Discount Date")
                {
                    ToolTip = 'Specifies the date on which the amount in the entry must be paid for a payment discount to be granted.';
                }
                field("Shipment Method Code"; Rec."Shipment Method Code")
                {
                    ToolTip = 'Specifies how items on the sales document are shipped to the customer.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the location from where inventory items to the customer on the sales document are to be shipped by default.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("Customer Posting Group"; Rec."Customer Posting Group")
                {
                    ToolTip = 'Specifies the customer s market type to link business transactions to.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ToolTip = 'Specifies the currency that is used on the entry.';
                }
                field("Currency Factor"; Rec."Currency Factor")
                {
                    ToolTip = 'Specifies the value of the Currency Factor field.', Comment = '%';
                }
                field("Customer Price Group"; Rec."Customer Price Group")
                {
                    ToolTip = 'Specifies the value of the Customer Price Group field.', Comment = '%';
                }
                field("Prices Including VAT"; Rec."Prices Including VAT")
                {
                    ToolTip = 'Specifies if the Unit Price and Line Amount fields on document lines should be shown with or without VAT.';
                }
                field("Invoice Disc. Code"; Rec."Invoice Disc. Code")
                {
                    ToolTip = 'Specifies the value of the Invoice Disc. Code field.', Comment = '%';
                }
                field("Customer Disc. Group"; Rec."Customer Disc. Group")
                {
                    ToolTip = 'Specifies the value of the Customer Disc. Group field.', Comment = '%';
                }
                field("Language Code"; Rec."Language Code")
                {
                    ToolTip = 'Specifies the language to be used on printouts for this document.';
                }
                field("Format Region"; Rec."Format Region")
                {
                    ToolTip = 'Specifies the format to be used on printouts for this document.';
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ToolTip = 'Specifies the name of the salesperson who is assigned to the customer.';
                }
                field("Order Class"; Rec."Order Class")
                {
                    ToolTip = 'Specifies the value of the Order Class field.', Comment = '%';
                }
                field(Comment; Rec.Comment)
                {
                    ToolTip = 'Specifies the value of the Comment field.', Comment = '%';
                }
                field("No. Printed"; Rec."No. Printed")
                {
                    ToolTip = 'Specifies the value of the No. Printed field.', Comment = '%';
                }
                field("On Hold"; Rec."On Hold")
                {
                    ToolTip = 'Specifies if the document was put on hold when it was posted, for example because payment of the resulting customer ledger entries is overdue.';
                }
                field("Applies-to Doc. Type"; Rec."Applies-to Doc. Type")
                {
                    ToolTip = 'Specifies the type of the posted document that this document or journal line will be applied to when you post, for example to register payment.';
                }
                field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
                {
                    ToolTip = 'Specifies the number of the posted document that this document or journal line will be applied to when you post, for example to register payment.';
                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {
                    ToolTip = 'Specifies the value of the Bal. Account No. field.', Comment = '%';
                }
                field("Recalculate Invoice Disc."; Rec."Recalculate Invoice Disc.")
                {
                    ToolTip = 'Specifies the value of the Recalculate Invoice Disc. field.', Comment = '%';
                }
                field(Ship; Rec.Ship)
                {
                    ToolTip = 'Specifies the value of the Ship field.', Comment = '%';
                }
                field(Invoice; Rec.Invoice)
                {
                    ToolTip = 'Specifies the value of the Invoice field.', Comment = '%';
                }
                field("Print Posted Documents"; Rec."Print Posted Documents")
                {
                    ToolTip = 'Specifies the value of the Print Posted Documents field.', Comment = '%';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the sum of amounts on all the lines in the document. This will include invoice discounts.';
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                    ToolTip = 'Specifies the sum of the amounts in the Amount Including VAT fields on the associated sales lines.';
                }
                field("Shipping No."; Rec."Shipping No.")
                {
                    ToolTip = 'Specifies the value of the Shipping No. field.', Comment = '%';
                }
                field("Posting No."; Rec."Posting No.")
                {
                    ToolTip = 'Specifies the value of the Posting No. field.', Comment = '%';
                }
                field("Last Shipping No."; Rec."Last Shipping No.")
                {
                    ToolTip = 'Specifies the value of the Last Shipping No. field.', Comment = '%';
                }
                field("Last Posting No."; Rec."Last Posting No.")
                {
                    ToolTip = 'Specifies the value of the Last Posting No. field.', Comment = '%';
                }
                field("Prepayment No."; Rec."Prepayment No.")
                {
                    ToolTip = 'Specifies the value of the Prepayment No. field.', Comment = '%';
                }
                field("Last Prepayment No."; Rec."Last Prepayment No.")
                {
                    ToolTip = 'Specifies the value of the Last Prepayment No. field.', Comment = '%';
                }
                field("Prepmt. Cr. Memo No."; Rec."Prepmt. Cr. Memo No.")
                {
                    ToolTip = 'Specifies the value of the Prepmt. Cr. Memo No. field.', Comment = '%';
                }
                field("Last Prepmt. Cr. Memo No."; Rec."Last Prepmt. Cr. Memo No.")
                {
                    ToolTip = 'Specifies the value of the Last Prepmt. Cr. Memo No. field.', Comment = '%';
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                    ToolTip = 'Specifies the customer''s VAT registration number for customers.';
                }
                field("Combine Shipments"; Rec."Combine Shipments")
                {
                    ToolTip = 'Specifies whether the order will be included when you use the Combine Shipments function.';
                }
                // field("Registration Number"; Rec."Registration Number")
                // {
                //     ToolTip = 'Specifies the customer''s registration number.';
                // }
                field("Reason Code"; Rec."Reason Code")
                {
                    ToolTip = 'Specifies the reason code, a supplementary source code that enables you to trace the document.';
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ToolTip = 'Specifies the value of the Gen. Bus. Posting Group field.', Comment = '%';
                }
                field("EU 3-Party Trade"; Rec."EU 3-Party Trade")
                {
                    ToolTip = 'Specifies if the transaction is related to trade with a third party within the EU.';
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ToolTip = 'Specifies the type of transaction that the document represents, for the purpose of reporting to INTRASTAT.';
                }
                field("Transport Method"; Rec."Transport Method")
                {
                    ToolTip = 'Specifies the transport method, for the purpose of reporting to INTRASTAT.';
                }
                field("VAT Country/Region Code"; Rec."VAT Country/Region Code")
                {
                    ToolTip = 'Specifies the value of the VAT Country/Region Code field.', Comment = '%';
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ToolTip = 'Specifies the customer''s name.';
                }
                field("Sell-to Customer Name 2"; Rec."Sell-to Customer Name 2")
                {
                    ToolTip = 'Specifies the value of the Sell-to Customer Name 2 field.', Comment = '%';
                }
                field("Sell-to Address"; Rec."Sell-to Address")
                {
                    ToolTip = 'Specifies the customer''s address.';
                }
                field("Sell-to Address 2"; Rec."Sell-to Address 2")
                {
                    ToolTip = 'Specifies an additional part of the customer''s address.';
                }
                field("Sell-to City"; Rec."Sell-to City")
                {
                    ToolTip = 'Specifies the city of the customer''s address.';
                }
                field("Sell-to Contact"; Rec."Sell-to Contact")
                {
                    ToolTip = 'Specifies the name of the contact person at the customer.';
                }
                field("Bill-to Post Code"; Rec."Bill-to Post Code")
                {
                    ToolTip = 'Specifies the postal code of the billing address.';
                }
                field("Bill-to County"; Rec."Bill-to County")
                {
                    ToolTip = 'Specifies the state that is used to calculate and post sales tax.';
                }
                field("Bill-to Country/Region Code"; Rec."Bill-to Country/Region Code")
                {
                    ToolTip = 'Specifies the country/region code of the customer''s billing address.';
                }
                field("Sell-to Post Code"; Rec."Sell-to Post Code")
                {
                    ToolTip = 'Specifies the postal code of the customer''s address.';
                }
                field("Sell-to County"; Rec."Sell-to County")
                {
                    ToolTip = 'Specifies the state that is used to calculate and post sales tax.';
                }
                field("Sell-to Country/Region Code"; Rec."Sell-to Country/Region Code")
                {
                    ToolTip = 'Specifies the country/region code of the customer''s main address.';
                }
                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    ToolTip = 'Specifies the postal code of the shipping address.';
                }
                field("Ship-to County"; Rec."Ship-to County")
                {
                    ToolTip = 'Specifies the state that is used to calculate and post sales tax.';
                }
                field("Ship-to Country/Region Code"; Rec."Ship-to Country/Region Code")
                {
                    ToolTip = 'Specifies the country/region of the shipping address.';
                }
                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                    ToolTip = 'Specifies the value of the Bal. Account Type field.', Comment = '%';
                }
                field("Exit Point"; Rec."Exit Point")
                {
                    ToolTip = 'Specifies the point of exit through which you ship the items out of your country/region, for reporting to Intrastat.';
                }
                field(Correction; Rec.Correction)
                {
                    ToolTip = 'Specifies the entry as a corrective entry. You can use the field if you need to post a corrective entry to a customer account. If you place a check mark in this field when posting a corrective entry, the system will post a negative debit instead of a credit or a negative credit instead of a debit. Correction flag does not affect how inventory reconciled with general ledger.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the date when the related document was created.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ToolTip = 'Specifies the value of the External Document No. field.';
                }
                field("Area"; Rec."Area")
                {
                    ToolTip = 'Specifies the country or region of origin for the purpose of Intrastat reporting.';
                }
                field("Transaction Specification"; Rec."Transaction Specification")
                {
                    ToolTip = 'Specifies a specification of the document''s transaction, for the purpose of reporting to INTRASTAT.';
                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    ToolTip = 'Specifies how to make payment, such as with bank transfer, cash, or check.';
                }
                field("Shipping Agent Code"; Rec."Shipping Agent Code")
                {
                    ToolTip = 'Specifies the value of the Shipping Agent Code field.';
                }
                field("Package Tracking No."; Rec."Package Tracking No.")
                {
                    ToolTip = 'Specifies the shipping agent''s package number.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ToolTip = 'Specifies the value of the No. Series field.', Comment = '%';
                }
                field("Posting No. Series"; Rec."Posting No. Series")
                {
                    ToolTip = 'Specifies the value of the Posting No. Series field.', Comment = '%';
                }
                field("Shipping No. Series"; Rec."Shipping No. Series")
                {
                    ToolTip = 'Specifies the value of the Shipping No. Series field.', Comment = '%';
                }
                field("Tax Area Code"; Rec."Tax Area Code")
                {
                    ToolTip = 'Specifies the tax area that is used to calculate and post sales tax.';
                }
                field("Tax Liable"; Rec."Tax Liable")
                {
                    ToolTip = 'Specifies if this vendor charges you sales tax for purchases.';
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ToolTip = 'Specifies the VAT specification of the involved customer or vendor to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
                }
                field(Reserve; Rec.Reserve)
                {
                    ToolTip = 'Specifies the value of the Reserve field.', Comment = '%';
                }
                field("Applies-to ID"; Rec."Applies-to ID")
                {
                    ToolTip = 'Specifies the ID of entries that will be applied to when you choose the Apply Entries action.';
                }
                field("VAT Base Discount %"; Rec."VAT Base Discount %")
                {
                    ToolTip = 'Specifies the value of the VAT Base Discount % field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies whether the document is open, waiting to be approved, has been invoiced for prepayment, or has been released to the next stage of processing.';
                }
                field("Invoice Discount Calculation"; Rec."Invoice Discount Calculation")
                {
                    ToolTip = 'Specifies the value of the Invoice Discount Calculation field.', Comment = '%';
                }
                field("Invoice Discount Value"; Rec."Invoice Discount Value")
                {
                    ToolTip = 'Specifies the value of the Invoice Discount Value field.', Comment = '%';
                }
                field("Send IC Document"; Rec."Send IC Document")
                {
                    ToolTip = 'Specifies the value of the Send IC Document field.', Comment = '%';
                }
                field("IC Status"; Rec."IC Status")
                {
                    ToolTip = 'Specifies the value of the IC Status field.', Comment = '%';
                }
                field("Sell-to IC Partner Code"; Rec."Sell-to IC Partner Code")
                {
                    ToolTip = 'Specifies the value of the Sell-to IC Partner Code field.', Comment = '%';
                }
                field("Bill-to IC Partner Code"; Rec."Bill-to IC Partner Code")
                {
                    ToolTip = 'Specifies the value of the Bill-to IC Partner Code field.', Comment = '%';
                }
                field("IC Reference Document No."; Rec."IC Reference Document No.")
                {
                    ToolTip = 'Specifies the value of the IC Reference Document No. field.', Comment = '%';
                }
                field("IC Direction"; Rec."IC Direction")
                {
                    ToolTip = 'Specifies the value of the IC Direction field.', Comment = '%';
                }
                field("Prepayment %"; Rec."Prepayment %")
                {
                    ToolTip = 'Specifies the prepayment percentage to use to calculate the prepayment for sales.';
                }
                field("Prepayment No. Series"; Rec."Prepayment No. Series")
                {
                    ToolTip = 'Specifies the value of the Prepayment No. Series field.', Comment = '%';
                }
                field("Compress Prepayment"; Rec."Compress Prepayment")
                {
                    ToolTip = 'Specifies that prepayments on the sales order are combined if they have the same general ledger account for prepayments or the same dimensions.';
                }
                field("Prepayment Due Date"; Rec."Prepayment Due Date")
                {
                    ToolTip = 'Specifies when the prepayment invoice for this sales order is due.';
                }
                field("Prepmt. Cr. Memo No. Series"; Rec."Prepmt. Cr. Memo No. Series")
                {
                    ToolTip = 'Specifies the value of the Prepmt. Cr. Memo No. Series field.', Comment = '%';
                }
                field("Prepmt. Posting Description"; Rec."Prepmt. Posting Description")
                {
                    ToolTip = 'Specifies the value of the Prepmt. Posting Description field.', Comment = '%';
                }
                field("Prepmt. Pmt. Discount Date"; Rec."Prepmt. Pmt. Discount Date")
                {
                    ToolTip = 'Specifies the last date the customer can pay the prepayment invoice and still receive a payment discount on the prepayment amount.';
                }
                field("Prepmt. Payment Terms Code"; Rec."Prepmt. Payment Terms Code")
                {
                    ToolTip = 'Specifies the code that represents the payment terms for prepayment invoices related to the sales document.';
                }
                field("Prepmt. Payment Discount %"; Rec."Prepmt. Payment Discount %")
                {
                    ToolTip = 'Specifies the payment discount percent granted on the prepayment if the customer pays on or before the date entered in the Prepmt. Pmt. Discount Date field.';
                }
                field("Quote No."; Rec."Quote No.")
                {
                    ToolTip = 'Specifies the number of the sales quote that the sales order was created from. You can track the number to sales quote documents that you have printed, saved, or emailed.';
                }
                field("Quote Valid Until Date"; Rec."Quote Valid Until Date")
                {
                    ToolTip = 'Specifies how long the quote is valid.';
                }
                field("Quote Sent to Customer"; Rec."Quote Sent to Customer")
                {
                    ToolTip = 'Specifies the value of the Quote Sent to Customer field.', Comment = '%';
                }
                field("Quote Accepted"; Rec."Quote Accepted")
                {
                    ToolTip = 'Specifies the value of the Quote Accepted field.', Comment = '%';
                }
                field("Quote Accepted Date"; Rec."Quote Accepted Date")
                {
                    ToolTip = 'Specifies the value of the Quote Accepted Date field.', Comment = '%';
                }
                field("Job Queue Status"; Rec."Job Queue Status")
                {
                    ToolTip = 'Specifies the status of a job queue entry or task that handles the posting of sales credit memos.';
                }
                field("Job Queue Entry ID"; Rec."Job Queue Entry ID")
                {
                    ToolTip = 'Specifies the value of the Job Queue Entry ID field.', Comment = '%';
                }
                field("Company Bank Account Code"; Rec."Company Bank Account Code")
                {
                    ToolTip = 'Specifies the bank account to use for bank information when the document is printed.';
                }
                field("Incoming Document Entry No."; Rec."Incoming Document Entry No.")
                {
                    ToolTip = 'Specifies the number of the incoming document that this sales document is created for.';
                }
                field(IsTest; Rec.IsTest)
                {
                    ToolTip = 'Specifies the value of the IsTest field.', Comment = '%';
                }
                field("Sell-to Phone No."; Rec."Sell-to Phone No.")
                {
                    ToolTip = 'Specifies the customer''s telephone number.';
                }
                field("Sell-to E-Mail"; Rec."Sell-to E-Mail")
                {
                    ToolTip = 'Specifies the value of the Sell-to E-Mail field.';
                }
                field("Journal Templ. Name"; Rec."Journal Templ. Name")
                {
                    ToolTip = 'Specifies the name of the journal template in which the sales header is to be posted.';
                }
                field("VAT Reporting Date"; Rec."VAT Reporting Date")
                {
                    ToolTip = 'Specifies the date used to include entries on VAT reports in a VAT period. This is either the date that the document was created or posted, depending on your setting on the General Ledger Setup page.';
                }
                field("Rcvd.-from Count./Region Code"; Rec."Rcvd.-from Count./Region Code")
                {
                    ToolTip = 'Specifies the country or region from which the items are returned for the purpose of Intrastat reporting.';
                }
                field("Work Description"; Rec."Work Description")
                {
                    ToolTip = 'Specifies the value of the Work Description field.', Comment = '%';
                }
                field("Amt. Ship. Not Inv. (LCY)"; Rec."Amt. Ship. Not Inv. (LCY)")
                {
                    ToolTip = 'Specifies the sum, in LCY, for items that have been shipped but not yet been invoiced. The amount is calculated as Amount Including VAT x Qty. Shipped Not Invoiced / Quantity.';
                }
                field("Amt. Ship. Not Inv. (LCY) Base"; Rec."Amt. Ship. Not Inv. (LCY) Base")
                {
                    ToolTip = 'Specifies the sum, in LCY, for items that have been shipped but not yet been invoiced. The amount is calculated as Amount Including VAT x Qty. Shipped Not Invoiced / Quantity.';
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ToolTip = 'Specifies the value of the Dimension Set ID field.', Comment = '%';
                }
                field("Payment Service Set ID"; Rec."Payment Service Set ID")
                {
                    ToolTip = 'Specifies the value of the Payment Service Set ID field.', Comment = '%';
                }
                field("Coupled to CRM"; Rec."Coupled to CRM")
                {
                    ToolTip = 'Specifies that the sales order is coupled to an order in Dynamics 365 Sales.';
                }
                field("Coupled to Dataverse"; Rec."Coupled to Dataverse")
                {
                    ToolTip = 'Specifies that the sales order is coupled to an order in Dynamics 365 Sales.';
                }
                field("Direct Debit Mandate ID"; Rec."Direct Debit Mandate ID")
                {
                    ToolTip = 'Specifies the direct-debit mandate that the customer has signed to allow direct debit collection of payments.';
                }
                field("Invoice Discount Amount"; Rec."Invoice Discount Amount")
                {
                    ToolTip = 'Specifies the value of the Invoice Discount Amount field.', Comment = '%';
                }
                field("No. of Archived Versions"; Rec."No. of Archived Versions")
                {
                    ToolTip = 'Specifies the number of archived versions for this document.';
                }
                field("Doc. No. Occurrence"; Rec."Doc. No. Occurrence")
                {
                    ToolTip = 'Specifies the value of the Doc. No. Occurrence field.', Comment = '%';
                }
                field("Campaign No."; Rec."Campaign No.")
                {
                    ToolTip = 'Specifies the number of the campaign that the document is linked to.';
                }
                field("Sell-to Contact No."; Rec."Sell-to Contact No.")
                {
                    ToolTip = 'Specifies the number of the contact person at the customer.';
                }
                field("Bill-to Contact No."; Rec."Bill-to Contact No.")
                {
                    ToolTip = 'Specifies the number of the contact person at the billing address.';
                }
                field("Opportunity No."; Rec."Opportunity No.")
                {
                    ToolTip = 'Specifies the number of the opportunity that the sales quote is assigned to.';
                }
                field("Sell-to Customer Templ. Code"; Rec."Sell-to Customer Templ. Code")
                {
                    ToolTip = 'Specifies the code for the template to create a new customer';
                }
                field("Bill-to Customer Templ. Code"; Rec."Bill-to Customer Templ. Code")
                {
                    ToolTip = 'Specifies the value of the Bill-to Customer Template Code field.', Comment = '%';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ToolTip = 'Specifies the code of the responsibility center, such as a distribution hub, that is associated with the involved user, company, customer, or vendor.';
                }
                field("Shipping Advice"; Rec."Shipping Advice")
                {
                    ToolTip = 'Specifies if the customer accepts partial shipment of orders.';
                }
                field("Shipped Not Invoiced"; Rec."Shipped Not Invoiced")
                {
                    ToolTip = 'Specifies the value of the Shipped Not Invoiced field.', Comment = '%';
                }
                field("Completely Shipped"; Rec."Completely Shipped")
                {
                    ToolTip = 'Specifies whether all the items on the order have been shipped or, in the case of inbound items, completely received.';
                }
                field("Posting from Whse. Ref."; Rec."Posting from Whse. Ref.")
                {
                    ToolTip = 'Specifies the value of the Posting from Whse. Ref. field.', Comment = '%';
                }
                field(Shipped; Rec.Shipped)
                {
                    ToolTip = 'Specifies the value of the Shipped field.', Comment = '%';
                }
                field("Last Shipment Date"; Rec."Last Shipment Date")
                {
                    ToolTip = 'Specifies the value of the Last Shipment Date field.', Comment = '%';
                }
                field("Requested Delivery Date"; Rec."Requested Delivery Date")
                {
                    ToolTip = 'Specifies the date that the customer has asked for the order to be delivered.';
                }
                field("Promised Delivery Date"; Rec."Promised Delivery Date")
                {
                    ToolTip = 'Specifies the date that you have promised to deliver the order, as a result of the Order Promising function.';
                }
                field("Shipping Time"; Rec."Shipping Time")
                {
                    ToolTip = 'Specifies how long it takes from when the items are shipped from the warehouse to when they are delivered.';
                }
                field("Outbound Whse. Handling Time"; Rec."Outbound Whse. Handling Time")
                {
                    ToolTip = 'Specifies a date formula for the time it takes to get items ready to ship from this location. The time element is used in the calculation of the delivery date as follows: Shipment Date + Outbound Warehouse Handling Time = Planned Shipment Date + Shipping Time = Planned Delivery Date.';
                }
                field("Shipping Agent Service Code"; Rec."Shipping Agent Service Code")
                {
                    ToolTip = 'Specifies the value of the Shipping Agent Service Code field.';
                }
                field("Late Order Shipping"; Rec."Late Order Shipping")
                {
                    ToolTip = 'Indicates a delay in the shipment of one or more lines, or that the shipment date is either the same as or earlier than the work date.';
                }
                field(Receive; Rec.Receive)
                {
                    ToolTip = 'Specifies the value of the Receive field.', Comment = '%';
                }
                field("Return Receipt No."; Rec."Return Receipt No.")
                {
                    ToolTip = 'Specifies the value of the Return Receipt No. field.', Comment = '%';
                }
                field("Return Receipt No. Series"; Rec."Return Receipt No. Series")
                {
                    ToolTip = 'Specifies the value of the Return Receipt No. Series field.', Comment = '%';
                }
                field("Last Return Receipt No."; Rec."Last Return Receipt No.")
                {
                    ToolTip = 'Specifies the value of the Last Return Receipt No. field.', Comment = '%';
                }
                field("Price Calculation Method"; Rec."Price Calculation Method")
                {
                    ToolTip = 'Specifies the value of the Price Calculation Method field.', Comment = '%';
                }
                field("Allow Line Disc."; Rec."Allow Line Disc.")
                {
                    ToolTip = 'Specifies the value of the Allow Line Disc. field.', Comment = '%';
                }
                field("Get Shipment Used"; Rec."Get Shipment Used")
                {
                    ToolTip = 'Specifies the value of the Get Shipment Used field.', Comment = '%';
                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ToolTip = 'Specifies the ID of the user who is responsible for the document.';
                }
                field("Sales Tax Amount Rounding"; Rec."Sales Tax Amount Rounding")
                {
                    ToolTip = 'Specifies the value of the Sales Tax Amount Rounding field.', Comment = '%';
                }
                field("Prepmt. Sales Tax Rounding Amt"; Rec."Prepmt. Sales Tax Rounding Amt")
                {
                    ToolTip = 'Specifies the value of the Prepayment Sales Tax Rounding Amount field.', Comment = '%';
                }
                field("Ship-to UPS Zone"; Rec."Ship-to UPS Zone")
                {
                    ToolTip = 'Specifies a UPS Zone code for this document if UPS is used for shipments.';
                }
                field("Outstanding Amount ($)"; Rec."Outstanding Amount ($)")
                {
                    ToolTip = 'Specifies the outstanding amount that is calculated, based on the Sales Line table and the Outstanding Amount (LCY) field.';
                }
                field("Tax Exemption No."; Rec."Tax Exemption No.")
                {
                    ToolTip = 'Specifies the value of the Tax Exemption No. field.', Comment = '%';
                }
                field("STE Transaction ID"; Rec."STE Transaction ID")
                {
                    ToolTip = 'Specifies the value of the STE Transaction ID field.', Comment = '%';
                }
                field("Transport Operators"; Rec."Transport Operators")
                {
                    ToolTip = 'Specifies the operator of the vehicle that transports the goods or merchandise.';
                }
                field("Transit-from Date/Time"; Rec."Transit-from Date/Time")
                {
                    ToolTip = 'Specifies the estimated date and time at which the goods or merchandise leave the start address.';
                }
                field("Transit Hours"; Rec."Transit Hours")
                {
                    ToolTip = 'Specifies the estimated time in hours that it will take to transit from the start address to the temporary or final destination.';
                }
                field("Transit Distance"; Rec."Transit Distance")
                {
                    ToolTip = 'Specifies the distance travelled in kilometers from the start address to the temporary or final destination as a combination of the distances that are travelled by the different means of transport that move the goods or merchandise.';
                }
                field("Insurer Name"; Rec."Insurer Name")
                {
                    ToolTip = 'Specifies the name of the insurer that covers the risks of the motor transport used for the transfer of goods or merchandise.';
                }
                field("Insurer Policy Number"; Rec."Insurer Policy Number")
                {
                    ToolTip = 'Specifies the policy number assigned by the insurer, which covers the risks of the motor transport used for the transfer of goods or merchandise.';
                }
                field("Foreign Trade"; Rec."Foreign Trade")
                {
                    ToolTip = 'Specifies whether the goods or merchandise that are transported enter or leave the national territory.';
                }
                field("Vehicle Code"; Rec."Vehicle Code")
                {
                    ToolTip = 'Specifies the vehicle that transports the goods or merchandise.';
                }
                field("Trailer 1"; Rec."Trailer 1")
                {
                    ToolTip = 'Specifies the trailer or semi-trailer that is used with the vehicle for the transfer of goods or merchandise.';
                }
                field("Trailer 2"; Rec."Trailer 2")
                {
                    ToolTip = 'Specifies the second trailer or semi-trailer that is used with the vehicle for the transfer of goods or merchandise.';
                }
                field("Transit-to Location"; Rec."Transit-to Location")
                {
                    ToolTip = 'Specifies the location that the goods or merchandise are moved to.';
                }
                field("Medical Insurer Name"; Rec."Medical Insurer Name")
                {
                    ToolTip = 'Specifies the insurer that covers potential damage to the environment if the transport includes materials, residues or remnants, or hazardous waste.';
                }
                field("Medical Ins. Policy Number"; Rec."Medical Ins. Policy Number")
                {
                    ToolTip = 'Specifies the insurance policy number if the transport includes materials, residues or remnants, or hazardous waste.';
                }
                field("SAT Weight Unit Of Measure"; Rec."SAT Weight Unit Of Measure")
                {
                    ToolTip = 'Specifies the unit of measurement of the weight of the goods and / or merchandise that are moved in this transport.';
                }
                field("SAT International Trade Term"; Rec."SAT International Trade Term")
                {
                    ToolTip = 'Specifies an international commercial terms code that are used in international sale contracts according to the SAT internatoinal trade terms definition.';
                }
                field("Exchange Rate USD"; Rec."Exchange Rate USD")
                {
                    ToolTip = 'Specifies the USD to MXN exchange rate that is used to report foreign trade documents to Mexican SAT authorities. This rate must match the rate used by the Mexican National Bank.';
                }
                field("SAT Customs Regime"; Rec."SAT Customs Regime")
                {
                    ToolTip = 'Specifies the system that regulates the transfer of goods of foreign origin when it enters or exits the country. This information is required by Carte Porte in Mexico.';
                }
                field("SAT Transfer Reason"; Rec."SAT Transfer Reason")
                {
                    ToolTip = 'Specifies the reason that is associated with the transfer of goods and merchandise in exports. This information is required by Carte Porte in Mexico.';
                }
                field("Prepmt. Include Tax"; Rec."Prepmt. Include Tax")
                {
                    ToolTip = 'Specifies if sales tax is calculated during Post Prepayment.';
                }
                field("CFDI Purpose"; Rec."CFDI Purpose")
                {
                    ToolTip = 'Specifies the CFDI purpose required for reporting to the Mexican tax authorities (SAT).';
                }
                field("CFDI Relation"; Rec."CFDI Relation")
                {
                    ToolTip = 'Specifies the relation of the CFDI document.';
                }
                field("CFDI Export Code"; Rec."CFDI Export Code")
                {
                    ToolTip = 'Specifies a code to indicate if the document is used for exports to other countries.';
                }
                field("CFDI Period"; Rec."CFDI Period")
                {
                    ToolTip = 'Specifies the period to use when reporting for general public customers';
                }
                field("SAT Address ID"; Rec."SAT Address ID")
                {
                    ToolTip = 'Specifies the SAT address that the goods or merchandise are moved to.';
                }
                field("Order Status"; Rec."Order Status")
                {
                    ToolTip = 'Specifies the value of the Order Status field.';
                }
                field("Location Override"; Rec."Location Override")
                {
                    ToolTip = 'Specifies the value of the Location Override field.', Comment = '%';
                }
                field(Created_By; Rec.Created_By)
                {
                    ToolTip = 'Specifies the value of the Created_By field.', Comment = '%';
                }
                field("Assigned User ID 2"; Rec."Assigned User ID 2")
                {
                    ToolTip = 'Specifies the value of the Assigned User ID 2 field.', Comment = '%';
                }
                field(Needs_Approval; Rec.Needs_Approval)
                {
                    ToolTip = 'Specifies the value of the Needs Approval field.', Comment = '%';
                }
                field(ArtEmail; Rec.ArtEmail)
                {
                    ToolTip = 'Specifies the value of the Email (Art) field.', Comment = '%';
                }
                field("UPS Account Number"; Rec."UPS Account Number")
                {
                    ToolTip = 'Specifies the value of the UPS Account Number field.', Comment = '%';
                }
                field("FedEx Account Number"; Rec."FedEx Account Number")
                {
                    ToolTip = 'Specifies the value of the FedEx Account Number field.', Comment = '%';
                }
                field("Graphics Only"; Rec."Graphics Only")
                {
                    ToolTip = 'Specifies the value of the Graphics Only field.', Comment = '%';
                }
                field(Custom; Rec.Custom)
                {
                    ToolTip = 'Specifies the value of the Custom field.', Comment = '%';
                }
                field(Rush; Rec.Rush)
                {
                    ToolTip = 'Specifies the value of the Rush field.', Comment = '%';
                }
                field(TFlowStatus; Rec.TFlowStatus)
                {
                    ToolTip = 'Specifies the value of the TFlowStatus field.', Comment = '%';
                }
                field("ORB Tax ID"; Rec."ORB Tax ID")
                {
                    ToolTip = 'Specifies the Tax ID of Sales';
                }
                field("ORB Declared Value"; Rec."ORB Declared Value")
                {
                    ToolTip = 'Specifies the Declared Value of Sales';
                }
                field("ORB International Contact"; Rec."ORB International Contact")
                {
                    ToolTip = 'Specifies the International Contact of Sales';
                }
                field("ORB Magento Order #"; Rec."ORB Magento Order #")
                {
                    ToolTip = 'Specifies the value of the Magento Order # field.';
                }
                field("ORB Magento CC 4 Digits"; Rec."ORB Magento CC 4 Digits")
                {
                    ToolTip = 'Specifies the Magento CC 4 Digits of Sales';
                }
                field("ORB Magento Location Code"; Rec."ORB Magento Location Code")
                {
                    ToolTip = 'Specifies the value of the Location Code" field.';
                }
                field("ORB Require Review"; Rec."ORB Require Review")
                {
                    ToolTip = 'Specifies the value of the Require Review field.', Comment = '%';
                }
                field("ORB Last Followup By"; Rec."ORB Last Followup By")
                {
                    ToolTip = 'Followup by the sales person';
                }
                field("ORB RUSH"; Rec."ORB RUSH")
                {
                    ToolTip = 'Specifies the value of the RUSH field.';
                }
                field("ORB Shipment Date"; Rec."ORB Shipment Date")
                {
                    ToolTip = 'Specifies the value of the Shipment Date field.';
                }
                field("ORB Escalation Reason Code"; Rec."ORB Escalation Reason Code")
                {
                    ToolTip = 'Specifies the reasons for escalation';
                }
                field("ORB Resolved By"; Rec."ORB Resolved By")
                {
                    ToolTip = 'Specifies the user who resolved escalated issue';
                }
                field("ORB Original Promised Ship Dt."; Rec."ORB Original Promised Ship Dt.")
                {
                    ToolTip = 'Specifies Original Ship. Date';
                }
                field("ORB Delayed Ship Reason Code"; Rec."ORB Delayed Ship Reason Code")
                {
                    ToolTip = 'Specifies reasons for delayed shipment';
                }
                field("ORB Delayed Ship Sub-Reason"; Rec."ORB Delayed Ship Sub-Reason")
                {
                    ToolTip = 'Specifies the sub-reason code for Shipment Delay';
                }
                field("ORB DS Payment Type"; Rec."ORB DS Payment Type")
                {
                    ToolTip = 'Specifies the value of the Payment Type field.', Comment = '%';
                }
                field("ORB DS Payment Account No."; Rec."ORB DS Payment Account No.")
                {
                    ToolTip = 'Specifies the value of the Payment Account No. field.', Comment = '%';
                }
                field("ORB Total Payment Amount"; Rec."ORB Total Payment Amount")
                {
                    ToolTip = 'Specifies the Total Payment Amount Field value';
                }
                field("ORB Freight Line"; Rec."ORB Freight Line")
                {
                    ToolTip = 'Specifies the field Freight Line value';
                }
                field("Sales Order Created By"; Rec."Sales Order Created By")
                {
                    ToolTip = 'Specifies the value of the Sales Order Created By field.', Comment = '%';
                }
                field("Sales Order Assigned To"; Rec."Sales Order Assigned To")
                {
                    ToolTip = 'Specifies the value of the Sales Order Assigned To field.', Comment = '%';
                }
                field("Sales Order Payment Type"; Rec."Sales Order Payment Type")
                {
                    ToolTip = 'Specifies the value of the Sales Order Payment Type field.', Comment = '%';
                }
                field("SO Payment Account No."; Rec."SO Payment Account No.")
                {
                    ToolTip = 'Specifies the value of the Sales Order Payment Account No. field.', Comment = '%';
                }
                field("Sales Order Shipment Method"; Rec."Sales Order Shipment Method")
                {
                    ToolTip = 'Specifies the value of the Sales Order Shipment Method field.', Comment = '%';
                }
                field("Warehouse Pick No."; Rec."Warehouse Pick No.")
                {
                    ToolTip = 'Specifies the value of the Warehouse Pick No. field.', Comment = '%';
                }
                field("Registered Warehouse Pick No."; Rec."Registered Warehouse Pick No.")
                {
                    ToolTip = 'Specifies the value of the Registered Warehouse Pick No. field.', Comment = '%';
                }
                field("Industry Shortcut Dimension"; Rec."Industry Shortcut Dimension")
                {
                    ToolTip = 'Specifies the value of the Industry Shortcut Dimension field.', Comment = '%';
                }
                field("Payment Type (new)"; Rec."Payment Type (new)")
                {
                    ToolTip = 'Specifies the value of the Payment Type (new) field.', Comment = '%';
                }
                field("Prepayment Receieved"; Rec."Prepayment Receieved")
                {
                    ToolTip = 'Specifies the value of the Prepayment Receieved field.', Comment = '%';
                }
                field("Art Email"; Rec."Art Email")
                {
                    ToolTip = 'Specifies the value of the Art Email field.', Comment = '%';
                }
                field("In-Hands Date"; Rec."In-Hands Date")
                {
                    ToolTip = 'Specifies the value of the In-Hands Date field.';
                }
                field("Sell-To Contact No. (Custom)"; Rec."Sell-To Contact No. (Custom)")
                {
                    ToolTip = 'Specifies the value of the Sell-To Contact No. (Custom) field.', Comment = '%';
                }
                field("Sell-To Phone No. (Custom)"; Rec."Sell-To Phone No. (Custom)")
                {
                    ToolTip = 'Specifies the value of the Sell-To Phone No. (Custom) field.', Comment = '%';
                }
                field("Sell-To Email (Custom)"; Rec."Sell-To Email (Custom)")
                {
                    ToolTip = 'Specifies the value of the Sell-To Email (Custom) field.', Comment = '%';
                }
                field("Sell-To Contact Name (Custom)"; Rec."Sell-To Contact Name (Custom)")
                {
                    ToolTip = 'Specifies the value of the Sell-To Contact Name (Custom) field.', Comment = '%';
                }
                field("Created At"; Rec."Created At")
                {
                    ToolTip = 'Specifies the value of the Created At field.', Comment = '%';
                }
                field("Case No."; Rec."Case No.")
                {
                    ToolTip = 'Specifies the value of the Case No. field.', Comment = '%';
                }
                field("Payment Terms OnOpenPage"; Rec."Payment Terms OnOpenPage")
                {
                    ToolTip = 'Specifies the value of the Payment Terms OnOpenPage field.', Comment = '%';
                }
                field("Quote Status"; Rec."Quote Status")
                {
                    ToolTip = 'Specifies the value of the Quote Status field.', Comment = '%';
                }
                field("Last Followup Date"; Rec."Last Followup Date")
                {
                    ToolTip = 'Specifies the value of the Last Followup Date field.', Comment = '%';
                }
                field("Next Followup Date"; Rec."Next Followup Date")
                {
                    ToolTip = 'Specifies the value of the Next Followup Date field.', Comment = '%';
                }
                field("Lead Time"; Rec."Lead Time")
                {
                    ToolTip = 'Specifies the value of the Lead Time field.', Comment = '%';
                }
                field("Ship-to Code (Custom)"; Rec."Ship-to Code (Custom)")
                {
                    ToolTip = 'Specifies the value of the Ship-to Code (Custom) field.', Comment = '%';
                }
                field("Ship-to Name (Custom)"; Rec."Ship-to Name (Custom)")
                {
                    ToolTip = 'Specifies the value of the Ship-to Name field.';
                }
                field("Ship-to Name 2 (Custom)"; Rec."Ship-to Name 2 (Custom)")
                {
                    ToolTip = 'Specifies the value of the Ship-to Name 2 (Custom) field.', Comment = '%';
                }
                field("Ship-to Address (Custom)"; Rec."Ship-to Address (Custom)")
                {
                    ToolTip = 'Specifies the value of the Ship-to Address field.';
                }
                field("Ship-to Address 2 (Custom)"; Rec."Ship-to Address 2 (Custom)")
                {
                    ToolTip = 'Specifies the value of the Ship-to-Address 2 field.';
                }
                field("Ship-to City (Custom)"; Rec."Ship-to City (Custom)")
                {
                    ToolTip = 'Specifies the value of the Ship-to City field.';
                }
                field("Ship-To County (Custom)"; Rec."Ship-To County (Custom)")
                {
                    ToolTip = 'Specifies the value of the Ship-to County field.';
                }
                field("Ship-to Contact (Custom)"; Rec."Ship-to Contact (Custom)")
                {
                    ToolTip = 'Specifies the value of the Ship-to Contact (Custom) field.', Comment = '%';
                }
                field("Ship-To Post Code (Custom)"; Rec."Ship-To Post Code (Custom)")
                {
                    ToolTip = 'Specifies the value of the Ship-to Post Code field.';
                }
                field("Ship-To CountryRegion (Custom)"; Rec."Ship-To CountryRegion (Custom)")
                {
                    ToolTip = 'Specifies the value of the Ship-to Country/Region Code field.';
                }
                field("SalesPerson Email"; Rec."SalesPerson Email")
                {
                    ToolTip = 'Specifies the value of the SalesPerson Email field.', Comment = '%';
                }
                field("Shipping Agent Service Code 2"; Rec."Shipping Agent Service Code 2")
                {
                    ToolTip = 'Specifies the value of the Shipping Agent Service Code 2 field.', Comment = '%';
                }
                field("Probability Percentage"; Rec."Probability Percentage")
                {
                    ToolTip = 'Specifies the value of the Probability Percentage field.', Comment = '%';
                }
                field("Sell-to-Customer No. Has Value"; Rec."Sell-to-Customer No. Has Value")
                {
                    ToolTip = 'Specifies the value of the Sell-to-Customer No. Has Value field.', Comment = '%';
                }
                field("Location Code (Custom)"; Rec."Location Code (Custom)")
                {
                    ToolTip = 'Specifies the value of the Location Code (Custom) field.', Comment = '%';
                }
                field("Ship To Data Modified"; Rec."Ship To Data Modified")
                {
                    ToolTip = 'Specifies the value of the Ship To Data Modified field.', Comment = '%';
                }
                field("Needs Assessment"; Rec."Needs Assessment")
                {
                    ToolTip = 'Specifies the value of the Needs Assessment field.', Comment = '%';
                }
                field("Project No."; Rec."Project No.")
                {
                    ToolTip = 'Specifies the value of the Project No. field.', Comment = '%';
                }
                field("Approval Deadline"; Rec."Approval Deadline")
                {
                    ToolTip = 'Specifies the value of the Approval Deadline field.', Comment = '%';
                }
                field("Production Scan Time"; Rec."Production Scan Time")
                {
                    ToolTip = 'Specifies the value of the Production Scan Time field.', Comment = '%';
                }
                field("Modified Location Code"; Rec."Modified Location Code")
                {
                    ToolTip = 'Specifies the value of the Modified Location Code field.', Comment = '%';
                }
                field("WMDM POS"; Rec."WMDM POS")
                {
                    ToolTip = 'Specifies the value of the Warehouse Insight POS field.', Comment = '%';
                }
                field("Net Amt. Authorized (LCY) -CL-"; Rec."Net Amt. Authorized (LCY) -CL-")
                {
                    ToolTip = 'Specifies a sum of the Signed Transaction Amount field for all approved authorize transactions attached to this sales document. The amount is displayed in your local currency.';
                }
                field("Net Amt to Auth-Sale (LCY)-CL-"; Rec."Net Amt to Auth-Sale (LCY)-CL-")
                {
                    ToolTip = 'Specifies a sum of the Signed Transaction Amount field for all authorize and reversal transactions attached to this sales document that are currently in the Queue. The amount is displayed in your local currency.';
                }
                field("Net Amt. Auth.-Sale (LCY) -CL-"; Rec."Net Amt. Auth.-Sale (LCY) -CL-")
                {
                    ToolTip = 'Specifies a sum of the Signed Transaction Amount field for all approved authorize transactions attached to this sales document. The amount is displayed in your local currency.';
                }
                field("Net Amt. Auth.-Hold (LCY) -CL-"; Rec."Net Amt. Auth.-Hold (LCY) -CL-")
                {
                    ToolTip = 'Specifies the value of the Net Amt. Auth. On Hold (LCY) field.', Comment = '%';
                }
                field("Net Amt. to Auth. (LCY) -CL-"; Rec."Net Amt. to Auth. (LCY) -CL-")
                {
                    ToolTip = 'Specifies a sum of the Signed Transaction Amount field for all authorize and reversal transactions attached to this sales document that are currently in the Queue. The amount is displayed in your local currency.';
                }
                field("Net Amt. to Stl-Sale (LCY)-CL-"; Rec."Net Amt. to Stl-Sale (LCY)-CL-")
                {
                    ToolTip = 'Specifies a sum of the Signed Transaction Amount field for all charge, settle, capture, refund, and credit transactions attached to this sales document that are currently in the Queue. The amount is displayed in your local currency.';
                }
                field("Net Amt. to Settle (LCY) -CL-"; Rec."Net Amt. to Settle (LCY) -CL-")
                {
                    ToolTip = 'Specifies a sum of the Signed Transaction Amount field for all charge, settle, capture, refund, and credit transactions attached to this sales document that are currently in the Queue. The amount is displayed in your local currency.';
                }
                field("Net Amount Settled (LCY) -CL-"; Rec."Net Amount Settled (LCY) -CL-")
                {
                    ToolTip = 'Specifies a sum of the Signed Transaction Amount field for all approved charge, settle, capture, refund, and credit transactions attached to this sales document. The amount is displayed in your local currency.';
                }
                field("Net Amt. Set.-Sale (LCY) -CL-"; Rec."Net Amt. Set.-Sale (LCY) -CL-")
                {
                    ToolTip = 'Specifies a sum of the Signed Transaction Amount field for all approved charge, settle, capture, refund, and credit transactions attached to this sales document. The amount is displayed in your local currency.';
                }
                field("Amount Paid (LCY) -CL-"; Rec."Amount Paid (LCY) -CL-")
                {
                    ToolTip = 'Specifies the value of the Amount Paid (LCY) field.', Comment = '%';
                }
                field("Sell-to Phone No. -CL-"; Rec."Sell-to Phone No. -CL-")
                {
                    ToolTip = 'Specifies the value of the Sell-to Phone No. field.', Comment = '%';
                }
                field("Bill-to Phone No. -CL-"; Rec."Bill-to Phone No. -CL-")
                {
                    ToolTip = 'Specifies the value of the Phone No. field.', Comment = '%';
                }
                field("Ship-to Phone No. -CL-"; Rec."Ship-to Phone No. -CL-")
                {
                    ToolTip = 'Specifies the value of the Ship-to Phone No. field.';
                }
                field("Bill-to Federal ID No. -CL-"; Rec."Bill-to Federal ID No. -CL-")
                {
                    ToolTip = 'Specifies the value of the Bill-to Federal ID No. field.', Comment = '%';
                }
                field("Bill-to ID No. -CL-"; Rec."Bill-to ID No. -CL-")
                {
                    ToolTip = 'Specifies the value of the Bill-to Identification No. field.', Comment = '%';
                }
                field("Bill-to ID County -CL-"; Rec."Bill-to ID County -CL-")
                {
                    ToolTip = 'Specifies the value of the Bill-to Identification State field.', Comment = '%';
                }
                field("Account Number -CL-"; Rec."Account Number -CL-")
                {
                    ToolTip = 'Specifies the Account Number related to this sales invoice.';
                }
                field("Expiration Month -CL-"; Rec."Expiration Month -CL-")
                {
                    ToolTip = 'Specifies the Expiration Month related to this sales invoice, if applicable.';
                }
                field("Expiration Year -CL-"; Rec."Expiration Year -CL-")
                {
                    ToolTip = 'Specifies the Expiration Year related to this sales invoice, if applicable.';
                }
                field("Routing Number -CL-"; Rec."Routing Number -CL-")
                {
                    ToolTip = 'Specifies the Routing Number related to this sales invoice, if applicable.';
                }
                field("Check Type -CL-"; Rec."Check Type -CL-")
                {
                    ToolTip = 'Specifies the Check Type related to this sales credit memo, if applicable.';
                }
                field("Hash -CL-"; Rec."Hash -CL-")
                {
                    ToolTip = 'Specifies the value of the Hash field.', Comment = '%';
                }
                field("Card Type -CL-"; Rec."Card Type -CL-")
                {
                    ToolTip = 'Specifies the value of the Card Type field.', Comment = '%';
                }
                field("Account Type -CL-"; Rec."Account Type -CL-")
                {
                    ToolTip = 'Specifies the Account Type related to this sales invoice.';
                }
                field("Encryption Salt -CL-"; Rec."Encryption Salt -CL-")
                {
                    ToolTip = 'Specifies the value of the Encryption Salt field.', Comment = '%';
                }
                field("Protected Account Number -CL-"; Rec."Protected Account Number -CL-")
                {
                    ToolTip = 'Specifies the value of the Protected Account Number field.', Comment = '%';
                }
                field("EFT Tender Type -CL-"; Rec."EFT Tender Type -CL-")
                {
                    ToolTip = 'Specifies the value of the EFT Tender Type field.', Comment = '%';
                }
                field("EFT Customer Link Type -CL-"; Rec."EFT Customer Link Type -CL-")
                {
                    ToolTip = 'Specifies the value of the EFT Customer Link Type field.', Comment = '%';
                }
                field("EFT Customer Link No. -CL-"; Rec."EFT Customer Link No. -CL-")
                {
                    ToolTip = 'Specifies the value of the EFT Customer Link No. field.', Comment = '%';
                }
                field("EFT Cust. Link Line No. -CL-"; Rec."EFT Cust. Link Line No. -CL-")
                {
                    ToolTip = 'Specifies the value of the EFT Customer Link Line No. field.', Comment = '%';
                }
                field("Account Number Prot. Type -CL-"; Rec."Account Number Prot. Type -CL-")
                {
                    ToolTip = 'Specifies the value of the Account Number Protection Type field.', Comment = '%';
                }
                field("EFT Order ID -CL-"; Rec."EFT Order ID -CL-")
                {
                    ToolTip = 'Specifies the value of the EFT Order ID field.', Comment = '%';
                }
                field("EFT Store No. -CL-"; Rec."EFT Store No. -CL-")
                {
                    ToolTip = 'Specifies the number of the store associated with the transaction.';
                }
                field("Electronic Invoice Type -CL-"; Rec."Electronic Invoice Type -CL-")
                {
                    ToolTip = 'Specifies the Electronic Invoice Type for this sales invoice.  Please note the value should be set to None if the customer''s invoices and credit memos are currently being sent to the Versapay Cloud Platform.';
                }
                field("POS Type -CL-"; Rec."POS Type -CL-")
                {
                    ToolTip = 'Specifies the type of the transaction.';
                }
                field("EFT Terminal No. -CL-"; Rec."EFT Terminal No. -CL-")
                {
                    ToolTip = 'Specifies the value of the EFT Terminal No. field.', Comment = '%';
                }
                field("EFT Gateway No. -CL-"; Rec."EFT Gateway No. -CL-")
                {
                    ToolTip = 'Specifies the value of the EFT Gateway No. field.', Comment = '%';
                }
                field("EFT Gateway Account No."; Rec."EFT Gateway Account No.")
                {
                    ToolTip = 'Specifies the value of the EFT Gateway Account No. field.', Comment = '%';
                }
                field("EFT GUID -CL-"; Rec."EFT GUID -CL-")
                {
                    ToolTip = 'Specifies the value of the EFT GUID field.', Comment = '%';
                }
                field("Click-to-Pay URL -CL-"; Rec."Click-to-Pay URL -CL-")
                {
                    ToolTip = 'Specifies the value of the Click-to-Pay URL field.', Comment = '%';
                }
                field("No. E-mailed -CL-"; Rec."No. E-mailed -CL-")
                {
                    ToolTip = 'Specifies the number of times the Electronic Payment Request has been emailed.';
                }
                field("EFT Gateway Account No. -CL-"; Rec."EFT Gateway Account No. -CL-")
                {
                    ToolTip = 'Specifies the value of the EFT Gateway Account No. field.', Comment = '%';
                }
                field("Issuer ID No. -CL-"; Rec."Issuer ID No. -CL-")
                {
                    ToolTip = 'Specifies the value of the Issuer Identification Number field.', Comment = '%';
                }
                field("Demand Deposit Acct. Type -CL-"; Rec."Demand Deposit Acct. Type -CL-")
                {
                    ToolTip = 'Specifies the Demand Deposit Account Type related to this sales credit memo, if applicable.';
                }
                field("Layaway Terms Code -CL-"; Rec."Layaway Terms Code -CL-")
                {
                    ToolTip = 'Specifies the value of the Layaway Terms Code field.', Comment = '%';
                }
                field("Layaway -CL-"; Rec."Layaway -CL-")
                {
                    ToolTip = 'Specifies the value of the Layaway field.', Comment = '%';
                }
                field("Cashier Number -CL-"; Rec."Cashier Number -CL-")
                {
                    ToolTip = 'Specifies the cashier who started the sale';
                }
                field("Prevent Acc. Num. Entry -CL-"; Rec."Prevent Acc. Num. Entry -CL-")
                {
                    ToolTip = 'Specifies the value of the Prevent Account Number Entry field.', Comment = '%';
                }
                field("Surcharge to Auth-Sale -CL-"; Rec."Surcharge to Auth-Sale -CL-")
                {
                    ToolTip = 'Specifies the value of the Surcharge Amount to Authorize - Sale field.', Comment = '%';
                }
                field("Surcharge Auth.-Sale -CL-"; Rec."Surcharge Auth.-Sale -CL-")
                {
                    ToolTip = 'Specifies the value of the Surcharge Amount Authorized - Sale field.', Comment = '%';
                }
                field("Surcharge to Stl-Sale -CL-"; Rec."Surcharge to Stl-Sale -CL-")
                {
                    ToolTip = 'Specifies the value of the Surcharge Amount to Settle - Sale field.', Comment = '%';
                }
                field("Surcharge Set.-Sale -CL-"; Rec."Surcharge Set.-Sale -CL-")
                {
                    ToolTip = 'Specifies the value of the Surcharge Amount Settled - Sale field.', Comment = '%';
                }
                field("Surcharge to Auth. -CL-"; Rec."Surcharge to Auth. -CL-")
                {
                    ToolTip = 'Specifies the value of the Surcharge Amount to Authorize field.', Comment = '%';
                }
                field("Surcharge Authorized -CL-"; Rec."Surcharge Authorized -CL-")
                {
                    ToolTip = 'Specifies the value of the Surcharge Amount Authorized field.', Comment = '%';
                }
                field("Surcharge to Settle -CL-"; Rec."Surcharge to Settle -CL-")
                {
                    ToolTip = 'Specifies the value of the Surcharge Amount to Settle field.', Comment = '%';
                }
                field("Surcharge Settled -CL-"; Rec."Surcharge Settled -CL-")
                {
                    ToolTip = 'Specifies the value of the Surcharge Amount Settled field.', Comment = '%';
                }
                // field("EFT Ignore Auto Workflows -CL-"; Rec."EFT Ignore Auto Workflows -CL-")
                // {
                //     ToolTip = 'Specifies that the auto workflows defined on EFT Setup should be ignored.';
                // }
                field("Do not Sync Versapay ARC -CL-"; Rec."Do not Sync Versapay ARC -CL-")
                {
                    ToolTip = 'Specifies if the credit memo should NOT be sent to the Versapay Cloud Platform.';
                }
                field("Preview Mode -CL-"; Rec."Preview Mode -CL-")
                {
                    ToolTip = 'Specifies the value of the Preview Mode field.', Comment = '%';
                }
                // field("Manually Released -CL-"; Rec."Manually Released -CL-")
                // {
                //     ToolTip = 'Specifies the value of the Manually Released field.', Comment = '%';
                // }
                field("Order Time -CL-"; Rec."Order Time -CL-")
                {
                    ToolTip = 'Specifies the value of the Order Time field.', Comment = '%';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.', Comment = '%';
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.', Comment = '%';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.', Comment = '%';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.', Comment = '%';
                }
            }
        }
    }
}
