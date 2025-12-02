page 53416 "ORB LIFT Customer API"
{
    APIGroup = 'Orbus';
    APIPublisher = 'Orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'liftCustomerAPI';
    DelayedInsert = true;
    EntityName = 'LIFTCustomerAPI';
    EntitySetName = 'LIFTCustomerAPI';
    PageType = API;
    SourceTable = "ORB LIFT Customer Buffer";

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
                field(address; Rec.Address)
                {
                    Caption = 'Address';
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
                field(shipToCode; Rec."Ship-to Code")
                {
                    Caption = 'Ship-to Code';
                }
                field(creditLimitLCY; Rec."Credit Limit (LCY)")
                {
                    Caption = 'Credit Limit (LCY)';
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                }
                field(currencyId; Rec."Currency Id")
                {
                    Caption = 'Currency Id';
                }
                field(customerPostingGroup; Rec."Customer Posting Group")
                {
                    Caption = 'Customer Posting Group';
                }
                field(customerPriceGroup; Rec."Customer Price Group")
                {
                    Caption = 'Customer Price Group';
                }
                field(paymentTermsCode; Rec."Payment Terms Code")
                {
                    Caption = 'Payment Terms Code';
                }
                field(salespersonCode; Rec."Salesperson Code")
                {
                    Caption = 'Salesperson Code';
                }
                field(customerDiscGroup; Rec."Customer Disc. Group")
                {
                    Caption = 'Customer Disc. Group';
                }
                field(countryRegionCode; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                }
                field(paymentMethodCode; Rec."Payment Method Code")
                {
                    Caption = 'Payment Method Code';
                }
                field(lastDateModified; Rec."Last Date Modified")
                {
                    Caption = 'Last Date Modified';
                }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                }
                field(postCode; Rec."Post Code")
                {
                    Caption = 'Post Code';
                }
                field(county; Rec.County)
                {
                    Caption = 'County';
                }
                field(eMail; Rec."E-Mail")
                {
                    Caption = 'E-Mail';
                }
                field(TaxExempt; Rec."ORB LIFT TaxExempt")
                {
                    Caption = 'Tax Exempt';
                }
                field(shippingAdvice; Rec."Shipping Advice")
                {
                    Caption = 'Shipping Advice';
                }
                field(contactID; Rec."Contact ID")
                {
                    Caption = 'Contact ID';
                }
                field(TermsStatus; Rec."ORB LIFT TermsStatus")
                {
                    Caption = 'TermsStatus';
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
                    Caption = 'ORBAPPAssociationsName';
                }
                field(orbRegionalSalesExecutive; Rec."ORB Regional Sales Executive")
                {
                    Caption = 'ORB Regional Sales Executive';
                }
                field(orbBusinessDevelopment; Rec."ORB Business Development")
                {
                    Caption = 'ORB Business Development';
                }
                field(orbCustomerSupport; Rec."ORB Customer Support")
                {
                    Caption = 'ORB Customer Support';
                }
                field(orbLIFTCustomer; Rec."ORB LIFT Customer")
                {
                    Caption = 'ORB LIFT Customer';
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
                field(needsMagentoID; Rec."Needs Magento ID")
                {
                    Caption = 'Needs Magento ID';
                }
                field(lastVisitDate; Rec."Last Visit Date")
                {
                    Caption = 'Last Visit Date';
                }
                field(international; Rec.International)
                {
                    Caption = 'International';
                }
                field(channel; Rec.Channel)
                {
                    Caption = 'Channel';
                }
                field(industry; Rec.Industry)
                {
                    Caption = 'Industry';
                }
                field(customerType; Rec.CustomerType)
                {
                    Caption = 'CustomerType';
                }
                field(paymentTermsId; Rec."Payment Terms Id")
                {
                    Caption = 'Payment Terms Id';
                }
                field(tpsaDescription; Rec.TPSADescription)
                {
                    Caption = 'Third Party Shipping Account Description';
                }
            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        LIFTCustomerMgmt.PropagateOnCustomerInsert(Rec);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        LIFTCustomerMgmt.PropagateOnCustomerModify(Rec);
    end;

    var
        LIFTCustomerMgmt: Codeunit "ORB LIFT Customer Mgmt";
}

