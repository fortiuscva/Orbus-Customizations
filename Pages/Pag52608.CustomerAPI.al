page 52608 "ORB Customer API"
{
    APIGroup = 'orbus';
    APIPublisher = 'orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'customerAPI';
    DelayedInsert = true;
    EntityName = 'customerv2API';
    EntitySetName = 'customerv2API';
    PageType = API;
    SourceTable = Customer;

    layout
    {
        area(content)
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
                field(magentoID; Rec."Magento ID")
                {
                    Caption = 'Magento ID';
                }
                field(needsMagentoID; Rec."Needs Magento ID")
                {
                    Caption = 'Needs Magento ID';
                }
                field(address; Rec.Address)
                {
                    Caption = 'Address';
                }
                field(countryRegionCode; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                }
                field(city; Rec.City)
                {
                    Caption = 'City';
                }
                field(county; Rec.County)
                {
                    Caption = 'County';
                }
                field(postCode; Rec."Post Code")
                {
                    Caption = 'Post Code';
                }
                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                }
                field(eMail; Rec."E-Mail")
                {
                    Caption = 'Email';
                }
                field(magentoContactName; Rec."Magento Contact Name")
                {
                    Caption = 'Magento Contact Name';
                }
                field(magentoContactEmail; Rec."Magento Contact Email")
                {
                    Caption = 'Magento Contact Email';
                }
                field(vatRegistrationNo; Rec."VAT Registration No.")
                {
                    Caption = 'Tax Registration No.';
                }
                field(taxIDNo; Rec."Tax ID No. -CL-")
                {
                    Caption = 'Tax ID No.';
                }
                field(customerPriceGroup; Rec."Customer Price Group")
                {
                    Caption = 'Customer Price Group';
                }
                field(paymentTermsCode; Rec."Payment Terms Code")
                {
                    Caption = 'Payment Terms Code';
                }
            }
        }
    }
}
