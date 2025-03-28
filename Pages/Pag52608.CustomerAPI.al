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
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'System Created At';
                }
                field(systemModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'systemModifiedAt', Locked = true;
                }
                field(magentoContactNo; Rec."Magento Contact No.")
                {
                    Caption = 'magentoContactNo', Locked = true;
                }
                field(thisYearSales; ThisYearSales)
                {
                    Caption = 'This Year Sales Total';
                    Editable = false;
                }
                field(previousYearSales; PreviousYearSales)
                {
                    Caption = 'Previous Year Sales Total';
                    Editable = false;
                }
                field(ltmSales; LTMSales)
                {
                    Caption = 'LTM Sales Total';
                    Editable = false;
                }
                field(lifetimeSalesTotal; LifetimeSales)
                {
                    Caption = 'Lifetime Sales Total';
                    Editable = false;
                }
                field(thisYearSalesCrMemo; ThisYearSalesCrMemo)
                {
                    Caption = 'This Year Sales Cr. Memo';
                    Editable = false;
                }
                field(previousYearSalesCrMemo; PreviousYearSalesCrMemo)
                {
                    Caption = 'Previous Year Sales Cr. Memo';
                    Editable = false;
                }
                field(ltmSalesCrMemo; LTMSalesCrMemo)
                {
                    Caption = 'LTM Sales Cr. Memo';
                    Editable = false;
                }
                field(lifetimeSalesTotalCrMemo; LifetimeSalesCrMemo)
                {
                    Caption = 'Lifetime Sales Cr. Memo Total';
                    Editable = false;
                }
                field(association; Rec.ORBAPPAssociationsName)
                {
                    Caption = 'Association';
                }
                field(salespersonCode; Rec."Salesperson Code")
                {
                    Caption = 'Salesperson Code';
                }
                field(regionalSalesExecutive; Rec."ORB Regional Sales Executive")
                {
                    Caption = 'Regional Sales Executive';
                }
                field(customerSupport; Rec."ORB Customer Support")
                {
                    Caption = 'Customer Support';
                }
                field(businessDevelopment; Rec."ORB Business Development")
                {
                    Caption = 'Business Development';
                }
                field(rowID; Rec.SystemId)
                {
                    Caption = 'Row ID';
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    var
        FunctionsCU: Codeunit "ORB Functions";
    begin
        FunctionsCU.CalculateSalesTotals(ThisYearSales, PreviousYearSales, LTMSales, LifetimeSales, Rec."No.");
        FunctionsCU.CalculateCreditMemoTotals(ThisYearSalesCrMemo, PreviousYearSalesCrMemo, LTMSalesCrMemo, LifetimeSalesCrMemo, Rec."No.");
    end;

    var
        ThisYearSales: Decimal;
        PreviousYearSales: Decimal;
        LTMSales: Decimal;
        LifetimeSales: Decimal;
        ThisYearSalesCrMemo: Decimal;
        PreviousYearSalesCrMemo: Decimal;
        LTMSalesCrMemo: Decimal;
        LifetimeSalesCrMemo: Decimal;
}

