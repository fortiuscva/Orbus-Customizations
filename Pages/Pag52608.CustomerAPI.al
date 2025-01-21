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
                    Caption = 'This Year Sales';
                }
                field(previousYearSales; PreviousYearSales)
                {
                    Caption = 'Previous Year Sales';
                }
                field(ltmSales; LTMSales)
                {
                    Caption = 'LTM Sales';
                }
                field(lifetimeSalesTotal; LifetimeSales)
                {
                    Caption = 'Lifetime Sales Total';
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    var
        CustLedgEntry: Record "Cust. Ledger Entry";
    begin
        // Initialize date ranges
        ThisYearStartDate := DMY2Date(1, 1, Date2DMY(WorkDate(), 3));
        PrevYearStartDate := DMY2Date(1, 1, Date2DMY(WorkDate(), 3) - 1);
        PrevYearEndDate := DMY2Date(31, 12, Date2DMY(WorkDate(), 3) - 1);
        OneYearAgoDate := CalcDate('<-1Y>', WorkDate());

        // Calculate This Year Sales
        CustLedgEntry.Reset();
        CustLedgEntry.SetRange("Customer No.", Rec."No.");
        CustLedgEntry.SetRange("Document Type", CustLedgEntry."Document Type"::Invoice);
        CustLedgEntry.SetRange("Posting Date", ThisYearStartDate, WorkDate());
        ThisYearSales := CalculateSalesTotal(CustLedgEntry);

        // Calculate Previous Year Sales
        CustLedgEntry.Reset();
        CustLedgEntry.SetRange("Customer No.", Rec."No.");
        CustLedgEntry.SetRange("Document Type", CustLedgEntry."Document Type"::Invoice);
        CustLedgEntry.SetRange("Posting Date", PrevYearStartDate, PrevYearEndDate);
        PreviousYearSales := CalculateSalesTotal(CustLedgEntry);

        // Calculate LTM Sales
        CustLedgEntry.Reset();
        CustLedgEntry.SetRange("Customer No.", Rec."No.");
        CustLedgEntry.SetRange("Document Type", CustLedgEntry."Document Type"::Invoice);
        CustLedgEntry.SetRange("Posting Date", OneYearAgoDate, WorkDate());
        LTMSales := CalculateSalesTotal(CustLedgEntry);

        // Calculate Lifetime Sales
        CustLedgEntry.Reset();
        CustLedgEntry.SetRange("Customer No.", Rec."No.");
        CustLedgEntry.SetRange("Document Type", CustLedgEntry."Document Type"::Invoice);
        LifetimeSales := CalculateSalesTotal(CustLedgEntry);
    end;

    local procedure CalculateSalesTotal(var CustLedgEntry: Record "Cust. Ledger Entry"): Decimal
    var
        Total: Decimal;
    begin
        Total := 0;
        if CustLedgEntry.FindSet() then
            repeat
                Total += CustLedgEntry.Amount;
            until CustLedgEntry.Next() = 0;
        exit(Total);
    end;

    var
        ThisYearSales: Decimal;
        PreviousYearSales: Decimal;
        LTMSales: Decimal;
        LifetimeSales: Decimal;
        ThisYearStartDate: Date;
        PrevYearStartDate: Date;
        PrevYearEndDate: Date;
        OneYearAgoDate: Date;
}
