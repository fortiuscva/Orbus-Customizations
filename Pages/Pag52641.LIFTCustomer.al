page 52641 "ORB LIFT Customer"
{
    ApplicationArea = All;
    Caption = 'LIFT Customer';
    PageType = List;
    SourceTable = Customer;
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the unique No. of the customer.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the Name of the customer.';
                }
                field("Search Name"; Rec."Search Name")
                {
                    ToolTip = 'Specifies an alternate name that you can use to search for a customer.';
                }
                field("Name 2"; Rec."Name 2")
                {
                    ToolTip = 'Specifies an additional part of the name.';
                }
                field(Address; Rec.Address)
                {
                    ToolTip = 'Specifies the customer''s address. This address will appear on all sales documents for the customer.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ToolTip = 'Specifies additional address information.';
                }
                field(City; Rec.City)
                {
                    ToolTip = 'Specifies the customer''s city.';
                }
                field(Contact; Rec.Contact)
                {
                    ToolTip = 'Specifies the contact person at the customer''s company.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ToolTip = 'Specifies the customer''s telephone number.';
                }
                field("Telex No."; Rec."Telex No.")
                {
                    ToolTip = 'Specifies the value of the Telex No. field.', Comment = '%';
                }
                field("Document Sending Profile"; Rec."Document Sending Profile")
                {
                    ToolTip = 'Specifies the preferred method of sending documents to this customer, so that you do not have to select a sending option every time that you post and send a document to the customer. Sales documents to this customer will be sent using the specified sending profile and will override the default document sending profile.';
                }
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ToolTip = 'Specifies the code for another shipment address than the customer''s own address, which is entered by default.';
                }
                field("Our Account No."; Rec."Our Account No.")
                {
                    ToolTip = 'Specifies the value of the Our Account No. field.', Comment = '%';
                }
                field("Territory Code"; Rec."Territory Code")
                {
                    ToolTip = 'Specifies the value of the Territory Code field.', Comment = '%';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.', Comment = '%';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.', Comment = '%';
                }
                field("Chain Name"; Rec."Chain Name")
                {
                    ToolTip = 'Specifies the value of the Chain Name field.', Comment = '%';
                }
                field("Budgeted Amount"; Rec."Budgeted Amount")
                {
                    ToolTip = 'Specifies the Balance ($) amount rolled-up within the hierarchy for the customer.';
                }
                field("Credit Limit (LCY)"; Rec."Credit Limit (LCY)")
                {
                    ToolTip = 'Specifies the maximum amount you allow the customer to exceed the payment balance before warnings are issued.';
                }
                field("Customer Posting Group"; Rec."Customer Posting Group")
                {
                    ToolTip = 'Specifies the customer''s market type to link business transactions to.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ToolTip = 'Specifies the default currency for the customer.';
                }
                field("Customer Price Group"; Rec."Customer Price Group")
                {
                    ToolTip = 'Specifies the customer price group code, which you can use to set up special sales prices in the Sales Prices window.';
                }
                field("Language Code"; Rec."Language Code")
                {
                    ToolTip = 'Specifies the language to be used on printouts for this customer.';
                }
                field("Registration Number"; Rec."Registration Number")
                {
                    ToolTip = 'Specifies the registration number of the customer. You can enter a maximum of 20 characters, both numbers and letters.';
                }
                field("Statistics Group"; Rec."Statistics Group")
                {
                    ToolTip = 'Specifies the value of the Statistics Group field.', Comment = '%';
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ToolTip = 'Specifies a code that indicates the payment terms that you require of the customer.';
                }
                field("Fin. Charge Terms Code"; Rec."Fin. Charge Terms Code")
                {
                    ToolTip = 'Specifies finance charges are calculated for the customer.';
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ToolTip = 'Specifies a code for the salesperson who normally handles this customer''s account.';
                }
                field("Shipment Method Code"; Rec."Shipment Method Code")
                {
                    ToolTip = 'Specifies which shipment method to use when you ship items to the customer.';
                }
                field("Shipping Agent Code"; Rec."Shipping Agent Code")
                {
                    ToolTip = 'Specifies which shipping company is used when you ship items to the customer.';
                }
                field("Place of Export"; Rec."Place of Export")
                {
                    ToolTip = 'Specifies the value of the Place of Export field.', Comment = '%';
                }
                field("Invoice Disc. Code"; Rec."Invoice Disc. Code")
                {
                    ToolTip = 'Specifies a code for the invoice discount terms that you have defined for the customer.';
                }
                field("Customer Disc. Group"; Rec."Customer Disc. Group")
                {
                    ToolTip = 'Specifies the customer discount group code, which you can use as a criterion to set up special discounts in the Sales Line Discounts window.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ToolTip = 'Specifies the country/region of the address.';
                }
                field("Collection Method"; Rec."Collection Method")
                {
                    ToolTip = 'Specifies the method you normally use to collect payment from this customer, such as bank transfer or check.';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                }
                field(Comment; Rec.Comment)
                {
                    ToolTip = 'Specifies the value of the Comment field.', Comment = '%';
                }
                field(Blocked; Rec.Blocked)
                {
                    ToolTip = 'Specifies which transactions with the customer that cannot be processed, for example, because the customer is insolvent.';
                }
                field("Invoice Copies"; Rec."Invoice Copies")
                {
                    ToolTip = 'Specifies the value of the Invoice Copies field.', Comment = '%';
                }
                field("Last Statement No."; Rec."Last Statement No.")
                {
                    ToolTip = 'Specifies the number of the last statement that was printed for this customer.';
                }
                field("Print Statements"; Rec."Print Statements")
                {
                    ToolTip = 'Specifies whether to include this customer when you print the Statement report.';
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ToolTip = 'Specifies a different customer who will be invoiced for products that you sell to the customer in the Name field on the customer card.';
                }
                field(Priority; Rec.Priority)
                {
                    ToolTip = 'Specifies a number that corresponds to the priority you give the customer. The higher the number, the higher the priority.';
                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    ToolTip = 'Specifies how the customer usually submits payment, such as bank transfer or check.';
                }
                field("Format Region"; Rec."Format Region")
                {
                    ToolTip = 'Specifies the Format Region to be used on printouts for this customer.';
                }
                field("Last Modified Date Time"; Rec."Last Modified Date Time")
                {
                    ToolTip = 'Specifies the value of the Last Modified Date Time field.', Comment = '%';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ToolTip = 'Specifies when the customer card was last modified.';
                }
                field(Balance; Rec.Balance)
                {
                    ToolTip = 'Specifies the value of the Balance field.', Comment = '%';
                }
                field("Balance (LCY)"; Rec."Balance (LCY)")
                {
                    ToolTip = 'Specifies the payment amount that the customer owes for completed sales. This value is also known as the customer''s balance.';
                }
                field("Net Change"; Rec."Net Change")
                {
                    ToolTip = 'Specifies the value of the Net Change field.', Comment = '%';
                }
                field("Net Change (LCY)"; Rec."Net Change (LCY)")
                {
                    ToolTip = 'Specifies the value of the Net Change (LCY) field.', Comment = '%';
                }
                field("Sales (LCY)"; Rec."Sales (LCY)")
                {
                    ToolTip = 'Specifies the total net amount of sales to the customer in LCY.';
                }
                field("Profit (LCY)"; Rec."Profit (LCY)")
                {
                    ToolTip = 'Specifies the profit, in local currency.';
                }
                field("Inv. Discounts (LCY)"; Rec."Inv. Discounts (LCY)")
                {
                    ToolTip = 'Specifies the value of the Inv. Discounts (LCY) field.', Comment = '%';
                }
                field("Pmt. Discounts (LCY)"; Rec."Pmt. Discounts (LCY)")
                {
                    ToolTip = 'Specifies the value of the Pmt. Discounts (LCY) field.', Comment = '%';
                }
                field("Balance Due"; Rec."Balance Due")
                {
                    ToolTip = 'Specifies the value of the Balance Due field.', Comment = '%';
                }
                field("Balance Due (LCY)"; Rec."Balance Due (LCY)")
                {
                    ToolTip = 'Specifies the balance due for this customer in local currency.';
                }
                field(Payments; Rec.Payments)
                {
                    ToolTip = 'Specifies the value of the Payments field.', Comment = '%';
                }
                field("Invoice Amounts"; Rec."Invoice Amounts")
                {
                    ToolTip = 'Specifies the value of the Invoice Amounts field.', Comment = '%';
                }
                field("Cr. Memo Amounts"; Rec."Cr. Memo Amounts")
                {
                    ToolTip = 'Specifies the value of the Cr. Memo Amounts field.', Comment = '%';
                }
                field("Finance Charge Memo Amounts"; Rec."Finance Charge Memo Amounts")
                {
                    ToolTip = 'Specifies the value of the Finance Charge Memo Amounts field.', Comment = '%';
                }
                field("Payments (LCY)"; Rec."Payments (LCY)")
                {
                    ToolTip = 'Specifies the sum of payments received from the customer.';
                }
                field("Inv. Amounts (LCY)"; Rec."Inv. Amounts (LCY)")
                {
                    ToolTip = 'Specifies the value of the Inv. Amounts (LCY) field.', Comment = '%';
                }
                field("Cr. Memo Amounts (LCY)"; Rec."Cr. Memo Amounts (LCY)")
                {
                    ToolTip = 'Specifies the value of the Cr. Memo Amounts (LCY) field.', Comment = '%';
                }
                field("Fin. Charge Memo Amounts (LCY)"; Rec."Fin. Charge Memo Amounts (LCY)")
                {
                    ToolTip = 'Specifies the value of the Fin. Charge Memo Amounts (LCY) field.', Comment = '%';
                }
                field("Outstanding Orders"; Rec."Outstanding Orders")
                {
                    ToolTip = 'Specifies the value of the Outstanding Orders field.', Comment = '%';
                }
                field("Shipped Not Invoiced"; Rec."Shipped Not Invoiced")
                {
                    ToolTip = 'Specifies the value of the Shipped Not Invoiced field.', Comment = '%';
                }
                field("Application Method"; Rec."Application Method")
                {
                    ToolTip = 'Specifies how to apply payments to entries for this customer.';
                }
                field("Prices Including VAT"; Rec."Prices Including VAT")
                {
                    ToolTip = 'Specifies if the Unit Price and Line Amount fields on document lines should be shown with or without VAT.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies from which location sales to this customer will be processed by default.';
                }
                field("Fax No."; Rec."Fax No.")
                {
                    ToolTip = 'Specifies the customer''s fax number.';
                }
                field("Telex Answer Back"; Rec."Telex Answer Back")
                {
                    ToolTip = 'Specifies the value of the Telex Answer Back field.', Comment = '%';
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                    ToolTip = 'Specifies the customer''s VAT registration number for customers in EU countries/regions.';
                }
                field("Combine Shipments"; Rec."Combine Shipments")
                {
                    ToolTip = 'Specifies if several orders delivered to the customer can appear on the same sales invoice.';
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ToolTip = 'Specifies the customer''s trade type to link transactions made for this customer with the appropriate general ledger account according to the general posting setup.';
                }
                field(GLN; Rec.GLN)
                {
                    ToolTip = 'Specifies the customer in connection with electronic document sending.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ToolTip = 'Specifies the ZIP code.';
                }
                field(County; Rec.County)
                {
                    ToolTip = 'Specifies the state as a part of the address.';
                }
                field("EORI Number"; Rec."EORI Number")
                {
                    ToolTip = 'Specifies the Economic Operators Registration and Identification number that is used when you exchange information with the customs authorities due to trade into or out of the European Union.';
                }
                field("Use GLN in Electronic Document"; Rec."Use GLN in Electronic Document")
                {
                    ToolTip = 'Specifies whether the GLN is used in electronic documents as a party identification number.';
                }
                field("Debit Amount"; Rec."Debit Amount")
                {
                    ToolTip = 'Specifies the value of the Debit Amount field.', Comment = '%';
                }
                field("Credit Amount"; Rec."Credit Amount")
                {
                    ToolTip = 'Specifies the value of the Credit Amount field.', Comment = '%';
                }
                field("Debit Amount (LCY)"; Rec."Debit Amount (LCY)")
                {
                    ToolTip = 'Specifies the value of the Debit Amount (LCY) field.', Comment = '%';
                }
                field("Credit Amount (LCY)"; Rec."Credit Amount (LCY)")
                {
                    ToolTip = 'Specifies the value of the Credit Amount (LCY) field.', Comment = '%';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ToolTip = 'Specifies the customer''s email address.';
                }
                field("Home Page"; Rec."Home Page")
                {
                    ToolTip = 'Specifies the customer''s home page address.';
                }
                field("Reminder Terms Code"; Rec."Reminder Terms Code")
                {
                    ToolTip = 'Specifies how reminders about late payments are handled for this customer.';
                }
                field("Reminder Amounts"; Rec."Reminder Amounts")
                {
                    ToolTip = 'Specifies the value of the Reminder Amounts field.', Comment = '%';
                }
                field("Reminder Amounts (LCY)"; Rec."Reminder Amounts (LCY)")
                {
                    ToolTip = 'Specifies the value of the Reminder Amounts (LCY) field.', Comment = '%';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ToolTip = 'Specifies the value of the No. Series field.', Comment = '%';
                }
                field("Tax Area Code"; Rec."Tax Area Code")
                {
                    ToolTip = 'Specifies the tax area that is used to calculate and post sales tax.';
                }
                field("Tax Liable"; Rec."Tax Liable")
                {
                    ToolTip = 'Specifies if the customer or vendor is liable for sales tax.';
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ToolTip = 'Specifies the customer''s VAT specification to link transactions made for this customer to.';
                }
                field("Outstanding Orders (LCY)"; Rec."Outstanding Orders (LCY)")
                {
                    ToolTip = 'Specifies your expected sales income from the customer in LCY based on ongoing sales orders.';
                }
                field("Shipped Not Invoiced (LCY)"; Rec."Shipped Not Invoiced (LCY)")
                {
                    ToolTip = 'Specifies your expected sales income from the customer in LCY based on ongoing sales orders where items have been shipped.';
                }
                field(Reserve; Rec.Reserve)
                {
                    ToolTip = 'Specifies whether items will never, automatically (Always), or optionally be reserved for this customer.';
                }
                field("Block Payment Tolerance"; Rec."Block Payment Tolerance")
                {
                    ToolTip = 'Specifies that the customer is not allowed a payment tolerance.';
                }
                field("Pmt. Disc. Tolerance (LCY)"; Rec."Pmt. Disc. Tolerance (LCY)")
                {
                    ToolTip = 'Specifies the value of the Pmt. Disc. Tolerance (LCY) field.', Comment = '%';
                }
                field("Pmt. Tolerance (LCY)"; Rec."Pmt. Tolerance (LCY)")
                {
                    ToolTip = 'Specifies the value of the Pmt. Tolerance (LCY) field.', Comment = '%';
                }
                field("IC Partner Code"; Rec."IC Partner Code")
                {
                    ToolTip = 'Specifies the customer''s intercompany partner code.';
                }
                field(Refunds; Rec.Refunds)
                {
                    ToolTip = 'Specifies the value of the Refunds field.', Comment = '%';
                }
                field("Refunds (LCY)"; Rec."Refunds (LCY)")
                {
                    ToolTip = 'Specifies the sum of refunds received from the customer.';
                }
                field("Other Amounts"; Rec."Other Amounts")
                {
                    ToolTip = 'Specifies the value of the Other Amounts field.', Comment = '%';
                }
                field("Other Amounts (LCY)"; Rec."Other Amounts (LCY)")
                {
                    ToolTip = 'Specifies the value of the Other Amounts (LCY) field.', Comment = '%';
                }
                field("Prepayment %"; Rec."Prepayment %")
                {
                    ToolTip = 'Specifies a prepayment percentage that applies to all orders for this customer, regardless of the items or services on the order lines.';
                }
                field("Outstanding Invoices (LCY)"; Rec."Outstanding Invoices (LCY)")
                {
                    ToolTip = 'Specifies your expected sales income from the customer in LCY based on unpaid sales invoices.';
                }
                field("Outstanding Invoices"; Rec."Outstanding Invoices")
                {
                    ToolTip = 'Specifies the value of the Outstanding Invoices field.', Comment = '%';
                }
                field("Bill-to No. Of Archived Doc."; Rec."Bill-to No. Of Archived Doc.")
                {
                    ToolTip = 'Specifies the value of the Bill-to No. Of Archived Doc. field.', Comment = '%';
                }
                field("Sell-to No. Of Archived Doc."; Rec."Sell-to No. Of Archived Doc.")
                {
                    ToolTip = 'Specifies the value of the Sell-to No. Of Archived Doc. field.', Comment = '%';
                }
                field("Partner Type"; Rec."Partner Type")
                {
                    ToolTip = 'Specifies for direct debit collections if the customer that the payment is collected from is a person or a company.';
                }
                field("Intrastat Partner Type"; Rec."Intrastat Partner Type")
                {
                    ToolTip = 'Specifies for Intrastat reporting if the customer is a person or a company.';
                }
                field("Exclude from Pmt. Practices"; Rec."Exclude from Pmt. Practices")
                {
                    ToolTip = 'Specifies that the customer must be excluded from Payment Practices calculations.';
                }
                field(Image; Rec.Image)
                {
                    ToolTip = 'Specifies the picture of the customer, for example, a logo.';
                }
                field("Privacy Blocked"; Rec."Privacy Blocked")
                {
                    ToolTip = 'Specifies whether to limit access to data for the data subject during daily operations. This is useful, for example, when protecting data from changes while it is under privacy review.';
                }
                field("Disable Search by Name"; Rec."Disable Search by Name")
                {
                    ToolTip = 'Specifies that you can change the customer name on open sales documents. The change applies only to the documents.';
                }
                field("Allow Multiple Posting Groups"; Rec."Allow Multiple Posting Groups")
                {
                    ToolTip = 'Specifies if multiple posting groups can be used for posting business transactions for this customer.';
                }
                field("Preferred Bank Account Code"; Rec."Preferred Bank Account Code")
                {
                    ToolTip = 'Specifies the customer''s bank account that will be used by default when you process refunds to the customer and direct debit collections.';
                }
                field("Coupled to CRM"; Rec."Coupled to CRM")
                {
                    ToolTip = 'Specifies that the customer is coupled to an account in Dataverse.';
                }
                field("Coupled to Dataverse"; Rec."Coupled to Dataverse")
                {
                    ToolTip = 'Specifies that the customer is coupled to an account in Dataverse.';
                }
                field("Cash Flow Payment Terms Code"; Rec."Cash Flow Payment Terms Code")
                {
                    ToolTip = 'Specifies a payment term that will be used to calculate cash flow for the customer.';
                }
                field("Primary Contact No."; Rec."Primary Contact No.")
                {
                    ToolTip = 'Specifies the contact number for the customer.';
                }
                field("Contact Type"; Rec."Contact Type")
                {
                    ToolTip = 'Specifies the value of the Contact Type field.', Comment = '%';
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ToolTip = 'Specifies the customer''s mobile telephone number.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ToolTip = 'Specifies the code for the responsibility center that will administer this customer by default.';
                }
                field("Shipping Advice"; Rec."Shipping Advice")
                {
                    ToolTip = 'Specifies if the customer accepts partial shipment of orders.';
                }
                field("Shipping Time"; Rec."Shipping Time")
                {
                    ToolTip = 'Specifies how long it takes from when the items are shipped from the warehouse to when they are delivered.';
                }
                field("Shipping Agent Service Code"; Rec."Shipping Agent Service Code")
                {
                    ToolTip = 'Specifies the code for the shipping agent service to use for this customer.';
                }
                field("Service Zone Code"; Rec."Service Zone Code")
                {
                    ToolTip = 'Specifies the code for the service zone that is assigned to the customer.';
                }
                field("Contract Gain/Loss Amount"; Rec."Contract Gain/Loss Amount")
                {
                    ToolTip = 'Specifies the value of the Contract Gain/Loss Amount field.', Comment = '%';
                }
                field("Outstanding Serv. Orders (LCY)"; Rec."Outstanding Serv. Orders (LCY)")
                {
                    ToolTip = 'Specifies your expected service income from the customer in LCY based on ongoing service orders.';
                }
                field("Serv Shipped Not Invoiced(LCY)"; Rec."Serv Shipped Not Invoiced(LCY)")
                {
                    ToolTip = 'Specifies your expected service income from the customer in LCY based on service orders that are shipped but not invoiced.';
                }
                field("Outstanding Serv.Invoices(LCY)"; Rec."Outstanding Serv.Invoices(LCY)")
                {
                    ToolTip = 'Specifies your expected service income from the customer in LCY based on unpaid service invoices.';
                }
                field("Price Calculation Method"; Rec."Price Calculation Method")
                {
                    ToolTip = 'Specifies the default price calculation method.';
                }
                field("Allow Line Disc."; Rec."Allow Line Disc.")
                {
                    ToolTip = 'Specifies if a sales line discount is calculated when a special sales price is offered according to setup in the Sales Prices window.';
                }
                field("No. of Quotes"; Rec."No. of Quotes")
                {
                    ToolTip = 'Specifies the number of sales quotes that have been registered for the customer.';
                }
                field("No. of Blanket Orders"; Rec."No. of Blanket Orders")
                {
                    ToolTip = 'Specifies the number of sales blanket orders that have been registered for the customer.';
                }
                field("No. of Orders"; Rec."No. of Orders")
                {
                    ToolTip = 'Specifies the number of sales orders that have been registered for the customer.';
                }
                field("No. of Invoices"; Rec."No. of Invoices")
                {
                    ToolTip = 'Specifies the number of unposted sales invoices that have been registered for the customer.';
                }
                field("No. of Return Orders"; Rec."No. of Return Orders")
                {
                    ToolTip = 'Specifies the number of sales return orders that have been registered for the customer.';
                }
                field("No. of Credit Memos"; Rec."No. of Credit Memos")
                {
                    ToolTip = 'Specifies the number of unposted sales credit memos that have been registered for the customer.';
                }
                field("No. of Pstd. Shipments"; Rec."No. of Pstd. Shipments")
                {
                    ToolTip = 'Specifies the number of posted sales shipments that have been registered for the customer.';
                }
                field("No. of Pstd. Invoices"; Rec."No. of Pstd. Invoices")
                {
                    ToolTip = 'Specifies the number of posted sales invoices that have been registered for the customer.';
                }
                field("No. of Pstd. Return Receipts"; Rec."No. of Pstd. Return Receipts")
                {
                    ToolTip = 'Specifies the number of posted sales return receipts that have been registered for the customer.';
                }
                field("No. of Pstd. Credit Memos"; Rec."No. of Pstd. Credit Memos")
                {
                    ToolTip = 'Specifies the number of posted sales credit memos that have been registered for the customer.';
                }
                field("No. of Ship-to Addresses"; Rec."No. of Ship-to Addresses")
                {
                    ToolTip = 'Specifies the value of the No. of Ship-to Addresses field.', Comment = '%';
                }
                field("Bill-To No. of Quotes"; Rec."Bill-To No. of Quotes")
                {
                    ToolTip = 'Specifies how many quotes have been registered for the customer when the customer acts as the bill-to customer.';
                }
                field("Bill-To No. of Blanket Orders"; Rec."Bill-To No. of Blanket Orders")
                {
                    ToolTip = 'Specifies how many blanket orders have been registered for the customer when the customer acts as the bill-to customer.';
                }
                field("Bill-To No. of Orders"; Rec."Bill-To No. of Orders")
                {
                    ToolTip = 'Specifies how many sales orders have been registered for the customer when the customer acts as the bill-to customer.';
                }
                field("Bill-To No. of Invoices"; Rec."Bill-To No. of Invoices")
                {
                    ToolTip = 'Specifies how many invoices have been registered for the customer when the customer acts as the bill-to customer.';
                }
                field("Bill-To No. of Return Orders"; Rec."Bill-To No. of Return Orders")
                {
                    ToolTip = 'Specifies how many return orders have been registered for the customer when the customer acts as the bill-to customer.';
                }
                field("Bill-To No. of Credit Memos"; Rec."Bill-To No. of Credit Memos")
                {
                    ToolTip = 'Specifies how many credit memos have been registered for the customer when the customer acts as the bill-to customer.';
                }
                field("Bill-To No. of Pstd. Shipments"; Rec."Bill-To No. of Pstd. Shipments")
                {
                    ToolTip = 'Specifies how many posted shipments have been registered for the customer when the customer acts as the bill-to customer.';
                }
                field("Bill-To No. of Pstd. Invoices"; Rec."Bill-To No. of Pstd. Invoices")
                {
                    ToolTip = 'Specifies how many posted invoices have been registered for the customer when the customer acts as the bill-to customer.';
                }
                field("Bill-To No. of Pstd. Return R."; Rec."Bill-To No. of Pstd. Return R.")
                {
                    ToolTip = 'Specifies how many posted return receipts have been registered for the customer when the customer acts as the bill-to customer.';
                }
                field("Bill-To No. of Pstd. Cr. Memos"; Rec."Bill-To No. of Pstd. Cr. Memos")
                {
                    ToolTip = 'Specifies how many posted credit memos have been registered for the customer when the customer acts as the bill-to customer.';
                }
                field("Base Calendar Code"; Rec."Base Calendar Code")
                {
                    ToolTip = 'Specifies a customizable calendar for shipment planning that holds the customer''s working days and holidays.';
                }
                field("Copy Sell-to Addr. to Qte From"; Rec."Copy Sell-to Addr. to Qte From")
                {
                    ToolTip = 'Specifies which customer address is inserted on sales quotes that you create for the customer.';
                }
                field("Validate EU Vat Reg. No."; Rec."Validate EU Vat Reg. No.")
                {
                    ToolTip = 'Specifies the value of the Validate EU VAT Reg. No. field.', Comment = '%';
                }
                field("Currency Id"; Rec."Currency Id")
                {
                    ToolTip = 'Specifies the value of the Currency Id field.', Comment = '%';
                }
                field("Payment Terms Id"; Rec."Payment Terms Id")
                {
                    ToolTip = 'Specifies the value of the Payment Terms Id field.', Comment = '%';
                }
                field("Shipment Method Id"; Rec."Shipment Method Id")
                {
                    ToolTip = 'Specifies the value of the Shipment Method Id field.', Comment = '%';
                }
                field("Payment Method Id"; Rec."Payment Method Id")
                {
                    ToolTip = 'Specifies the value of the Payment Method Id field.', Comment = '%';
                }
                field("Tax Area ID"; Rec."Tax Area ID")
                {
                    ToolTip = 'Specifies the value of the Tax Area ID field.', Comment = '%';
                }
                field("Contact ID"; Rec."Contact ID")
                {
                    ToolTip = 'Specifies the value of the Contact ID field.', Comment = '%';
                }
                field("Contact Graph Id"; Rec."Contact Graph Id")
                {
                    ToolTip = 'Specifies the value of the Contact Graph Id field.', Comment = '%';
                }
                field("UPS Zone"; Rec."UPS Zone")
                {
                    ToolTip = 'Specifies the value of the UPS Zone field.', Comment = '%';
                }
                field("Tax Exemption No."; Rec."Tax Exemption No.")
                {
                    ToolTip = 'Specifies the customer''s tax exemption number. If the customer has been registered exempt for sales and use tax this number would have been assigned by the taxing authority.';
                }
                field("Bank Communication"; Rec."Bank Communication")
                {
                    ToolTip = 'Specifies the language of the check image.';
                }
                field("Check Date Format"; Rec."Check Date Format")
                {
                    ToolTip = 'Specifies how the date will appear on the printed check image for this bank account.';
                }
                field("Check Date Separator"; Rec."Check Date Separator")
                {
                    ToolTip = 'Specifies the character that separates Month, Day and Year of the date that prints on the check image.';
                }
                field("Balance on Date"; Rec."Balance on Date")
                {
                    ToolTip = 'Specifies the value of the Balance on Date field.', Comment = '%';
                }
                field("Balance on Date (LCY)"; Rec."Balance on Date (LCY)")
                {
                    ToolTip = 'Specifies a balance amount in local currency.';
                }
                field("RFC No."; Rec."RFC No.")
                {
                    ToolTip = 'Specifies the federal registration number for taxpayers.';
                }
                field("CURP No."; Rec."CURP No.")
                {
                    ToolTip = 'Specifies the unique fiscal card identification number. The CURP number must contain 18 digits.';
                }
                field("State Inscription"; Rec."State Inscription")
                {
                    ToolTip = 'Specifies the tax ID number that is assigned by state tax authorities to every person or corporation.';
                }
                field("Tax Identification Type"; Rec."Tax Identification Type")
                {
                    ToolTip = 'Specifies the tax identification type for the customer. This information is used for tax reporting. The identification type used for a customer depends on whether the customer is classified as a company or as a person.';
                }
                field("CFDI Purpose"; Rec."CFDI Purpose")
                {
                    ToolTip = 'Specifies the purpose of the CFDI document.';
                }
                field("CFDI Relation"; Rec."CFDI Relation")
                {
                    ToolTip = 'Specifies the relation of the CFDI document.';
                }
                field("SAT Tax Regime Classification"; Rec."SAT Tax Regime Classification")
                {
                    ToolTip = 'Specifies the tax scheme required for reporting to the Mexican tax authorities (SAT).';
                }
                field("CFDI Export Code"; Rec."CFDI Export Code")
                {
                    ToolTip = 'Specifies a code to indicate if the customer is typically used for exports to other countries.';
                }
                field("CFDI General Public"; Rec."CFDI General Public")
                {
                    ToolTip = 'Specifies that the customer is considered a client that reports general public information according to the Mexican tax authorities (SAT).';
                }
                field("CFDI Period"; Rec."CFDI Period")
                {
                    ToolTip = 'Specifies the period to use when reporting for general public customers';
                }
                field("CFDI Customer Name"; Rec."CFDI Customer Name")
                {
                    ToolTip = 'Specifies the customer''s name that will be reported in CFDI electronic invoicing.';
                }
                field(Needs_Approval; Rec.Needs_Approval)
                {
                    ToolTip = 'Specifies the value of the Needs Approval field.', Comment = '%';
                }
                field("UPS Account Number"; Rec."UPS Account Number")
                {
                    ToolTip = 'Specifies the value of the UPS Account Number field.', Comment = '%';
                }
                field("FedEx Account Number"; Rec."FedEx Account Number")
                {
                    ToolTip = 'Specifies the value of the FedEx Account Number field.', Comment = '%';
                }
                field("Magento ID"; Rec."Magento ID")
                {
                    ToolTip = 'Specifies the value of the Magento ID field.', Comment = '%';
                }
                field(ORBAPPAssociationsName; Rec.ORBAPPAssociationsName)
                {
                    ToolTip = 'Specifies the value of the Association field.', Comment = '%';
                }
                field("ORB Auto Send Email"; Rec."ORB Auto Send Email")
                {
                    ToolTip = 'Specifies Auto Send Email from JQ for the customer';
                }
                field("ORB Ship-to State"; Rec."ORB Ship-to State")
                {
                    ToolTip = 'Filter By State';
                }
                field("ORB Regional Sales Executive"; Rec."ORB Regional Sales Executive")
                {
                    ToolTip = 'Specifies Orbus Regional Sales Executive';
                }
                field("ORB Customer Support"; Rec."ORB Customer Support")
                {
                    ToolTip = 'Specifies Orbus ustomer Support';
                }
                field("First Invoice Date"; Rec."First Invoice Date")
                {
                    ToolTip = 'First Invoice Date';
                }
                field("Magento Contact No."; Rec."Magento Contact No.")
                {
                    ToolTip = 'Specifies the value of the Magento Contact No. field.', Comment = '%';
                }
                field("Magento Contact Name"; Rec."Magento Contact Name")
                {
                    ToolTip = 'Specifies the value of the Magento Contact Name field.', Comment = '%';
                }
                field("Magento Contact Email"; Rec."Magento Contact Email")
                {
                    ToolTip = 'Specifies the value of the Magento Contact Email field.', Comment = '%';
                }
                field("Last Invoice Date"; Rec."Last Invoice Date")
                {
                    ToolTip = 'Specifies the value of the Last Invoice Date field.', Comment = '%';
                }
                field(DocType; Rec.DocType)
                {
                    ToolTip = 'Specifies the value of the DocType field.', Comment = '%';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.', Comment = '%';
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.', Comment = '%';
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 5 Code field.', Comment = '%';
                }
                field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 6 Code field.', Comment = '%';
                }
                field("Shortcut Dimension 7 Code"; Rec."Shortcut Dimension 7 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 7 Code field.', Comment = '%';
                }
                field("Shortcut Dimension 8 Code"; Rec."Shortcut Dimension 8 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 8 Code field.', Comment = '%';
                }
                field("Needs Magento ID"; Rec."Needs Magento ID")
                {
                    ToolTip = 'Specifies the value of the Needs Magento ID field.', Comment = '%';
                }
                field("Last Visit Date"; Rec."Last Visit Date")
                {
                    ToolTip = 'Specifies the value of the Last Visit Date field.', Comment = '%';
                }
                field("Default Ship-to City"; Rec."Default Ship-to City")
                {
                    ToolTip = 'Specifies the value of the Default Ship-to City field.', Comment = '%';
                }
                field(International; Rec.International)
                {
                    ToolTip = 'Specifies the value of the International field.', Comment = '%';
                }
                field("Tax ID No. -CL-"; Rec."Tax ID No. -CL-")
                {
                    ToolTip = 'The federal tax identification number.';
                }
                field("Identification No. -CL-"; Rec."Identification No. -CL-")
                {
                    ToolTip = 'Specifies an Identification No. (e.g., driver''s license) to use when processing EFT transactions.';
                }
                field("Identification State -CL-"; Rec."Identification State -CL-")
                {
                    ToolTip = 'Specifies the state / province that issued the Identification No.';
                }
                field("EFT Fraud Prot. Status -CL-"; Rec."EFT Fraud Prot. Status -CL-")
                {
                    ToolTip = 'Specifies the current fraud protection status for this customer.';
                }
                field("Do Not Save Cred. Card Nos-CL-"; Rec."Do Not Save Cred. Card Nos-CL-")
                {
                    ToolTip = 'Specifies that credit cards used by this customer should not be retained.';
                }
                field("Do Not Save Chk. Act. Nos-CL-"; Rec."Do Not Save Chk. Act. Nos-CL-")
                {
                    ToolTip = 'Specifies that checking account numbers used by this customer should not be retained.';
                }
                field("Search E-Mail -CL-"; Rec."Search E-Mail -CL-")
                {
                    ToolTip = 'Specifies the value of the Search E-Mail field.', Comment = '%';
                }
                field("Electronic Invoice Type -CL-"; Rec."Electronic Invoice Type -CL-")
                {
                    ToolTip = 'Specifies the default value for the customer''s Electronic Invoice Type.  Please note the value should be set to None if the customer''s invoices and credit memos are currently being sent to the Versapay Cloud Platform.';
                }
                field("Last Click-to-Pay Stmt.URL-CL-"; Rec."Last Click-to-Pay Stmt.URL-CL-")
                {
                    ToolTip = 'Specifies the value of the Last Click-to-Pay Statement URL field.', Comment = '%';
                }
                field("Last Click-to-Pay Stmt.Dt.-CL-"; Rec."Last Click-to-Pay Stmt.Dt.-CL-")
                {
                    ToolTip = 'Specifies the value of the Last Click-to-Pay Statement Date field.', Comment = '%';
                }
                field("Loyalty Tier Code -CL-"; Rec."Loyalty Tier Code -CL-")
                {
                    ToolTip = 'Specifies the loyalty tier code for this customer.';
                }
                field("Loyalty Tier Awarded On -CL-"; Rec."Loyalty Tier Awarded On -CL-")
                {
                    ToolTip = 'Specifies the date the loyalty tier code is effective for this customer.';
                }
                field("Loyalty Tier Expires On -CL-"; Rec."Loyalty Tier Expires On -CL-")
                {
                    ToolTip = 'Specifies the date the loyalty tier code expired for this customer.';
                }
                field("Tag Count -CL-"; Rec."Tag Count -CL-")
                {
                    ToolTip = 'Specifies the value of the Tag Count field.', Comment = '%';
                }
                field("Do not Sync Versapay ARC -CL-"; Rec."Do not Sync Versapay ARC -CL-")
                {
                    ToolTip = 'Specifies whether the customer''s posted documents should be synchronized with the Versapay Cloud Platform.';
                }
                field("Parent Customer No. -CL-"; Rec."Parent Customer No. -CL-")
                {
                    ToolTip = 'Specifies the parent customer of this customer which is used for hierarchy purposes.  Leave blank for the customer at the top of the hierarchy.';
                }
                field("Indentation -CL-"; Rec."Indentation -CL-")
                {
                    ToolTip = 'Specifies the value of the Indentation field.', Comment = '%';
                }
                field("Credit Card Surcharges -CL-"; Rec."Credit Card Surcharges -CL-")
                {
                    ToolTip = 'Specifies whether the customer is exempt from credit card surcharges.';
                }
                field("Notification Suppressed -CL-"; Rec."Notification Suppressed -CL-")
                {
                    ToolTip = 'Specifies if E-Mail notifications should be suppressed on the Versapay Cloud Platform for this customer.';
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
