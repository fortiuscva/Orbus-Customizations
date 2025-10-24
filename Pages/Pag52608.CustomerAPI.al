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
                field(thisYearSales; Rec."ORB This Year Sales")
                {
                    Caption = 'This Year Sales Total';
                    Editable = false;
                }
                field(previousYearSales; Rec."ORB Prev Year Sales")
                {
                    Caption = 'Previous Year Sales Total';
                    Editable = false;
                }
                field(ltmSales; Rec."ORB LTM Sales")
                {
                    Caption = 'LTM Sales Total';
                    Editable = false;
                }
                field(lifetimeSalesTotal; Rec."ORB Lifetime Sales Total")
                {
                    Caption = 'Lifetime Sales Total';
                    Editable = false;
                }
                field(thisYearSalesCrMemo; Rec."ORB ThisYearSalesCrMemo")
                {
                    Caption = 'This Year Sales Cr. Memo';
                    Editable = false;
                }
                field(previousYearSalesCrMemo; Rec."ORB PreviousYearSalesCrMemo")
                {
                    Caption = 'Previous Year Sales Cr. Memo';
                    Editable = false;
                }
                field(ltmSalesCrMemo; Rec."ORB LTMSalesCrMemo")
                {
                    Caption = 'LTM Sales Cr. Memo';
                    Editable = false;
                }
                field(lifetimeSalesTotalCrMemo; Rec."ORB LifetimeSalesTotalCrMemo")
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
                field(customerDiscGroup; Rec."Customer Disc. Group")
                {
                    caption = 'Customer Disc. Group';
                }
                field(isCoreTeam; Rec."ORB Is Core Team")
                {
                    caption = 'Is Core Team';
                }
                field(lastVisitDate; Rec."Last Visit Date")
                {
                    Caption = 'Last Visit Date';
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                }
                field(channelCode; Rec."Shortcut Dimension 5 Code")
                {
                    Caption = 'Channel Code';
                }
                field(customerPostingGroup; Rec."Customer Posting Group")
                {
                    Caption = 'Customer Posting Group';
                }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                }
                field(invoiceEmail; InvoiceEmail)
                {
                    Caption = 'Send Invoice Email';
                }
                field(orbAutoSendEmail; Rec."ORB Auto Send Email")
                {
                    Caption = 'Auto Send Email';
                }
                field(documentSendingProfile; Rec."Document Sending Profile")
                {
                    Caption = 'Document Sending Profile';
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    var
        CustomReportSelectionRecLcl: Record "Custom Report Selection";
    begin
        InvoiceEmail := '';
        SetFiltersForCustomReporSelection(CustomReportSelectionRecLcl);
        CustomReportSelectionRecLcl.SetFilter("Send To Email", '<>%1', '');
        if CustomReportSelectionRecLcl.FindLast() then
            InvoiceEmail := CustomReportSelectionRecLcl."Send To Email";
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        FromCustomReportSelection, ToCustomReportSelection : Record "Custom Report Selection";
        SequenceLcl: Integer;
    begin
        SequenceLcl := 0;
        if FromCustomReportSelection.FindLast() then
            SequenceLcl := FromCustomReportSelection.Sequence + 1
        else
            SequenceLcl := 1;

        if Rec."ORB Auto Send Email" then begin
            SetFiltersForCustomReporSelection(FromCustomReportSelection);
            if not FromCustomReportSelection.FindFirst() then begin
                ToCustomReportSelection.Init();
                ToCustomReportSelection."Source Type" := Database::Customer;
                ToCustomReportSelection."Source No." := Rec."No.";
                ToCustomReportSelection.Usage := ToCustomReportSelection.Usage::"S.Invoice";
                ToCustomReportSelection.Sequence := SequenceLcl;
                ToCustomReportSelection.Insert(true);
                ToCustomReportSelection.Validate("Report ID", 1306);
                ToCustomReportSelection.Validate("Custom Report Layout Code", '1306-000002');
                ToCustomReportSelection.Validate("Send To Email", InvoiceEmail);
                ToCustomReportSelection.Validate("Use for Email Attachment", true);
                ToCustomReportSelection.Validate("Use for Email Body", true);
                ToCustomReportSelection.Validate("Email Body Layout Code", '1306-000002');
                ToCustomReportSelection.Validate("Use Email from Contact", false);
                ToCustomReportSelection.Modify(true);
            end;
        end
    end;

    trigger OnModifyRecord(): Boolean
    var
        CustomReportSelectionLcl: Record "Custom Report Selection";
    begin
        SetFiltersForCustomReporSelection(CustomReportSelectionLcl);
        if CustomReportSelectionLcl.FindLast() then begin
            if CustomReportSelectionLcl."Send To Email" <> InvoiceEmail then begin
                CustomReportSelectionLcl."Send To Email" := InvoiceEmail;
                CustomReportSelectionLcl.Modify(true);
            end;
        end;
    end;

    local procedure SetFiltersForCustomReporSelection(var CustomReportSelectionPar: Record "Custom Report Selection")
    begin
        CustomReportSelectionPar.Reset();
        CustomReportSelectionPar.SetRange("Source Type", Database::Customer);
        CustomReportSelectionPar.SetRange("Source No.", Rec."No.");
        CustomReportSelectionPar.SetRange(Usage, CustomReportSelectionPar.Usage::"S.Invoice");
    end;

    var
        InvoiceEmail: Text[200];
    /*
    trigger OnAfterGetRecord()
    var
        FunctionsCU: Codeunit "ORB Functions";
    begin
        FunctionsCU.CalculateSalesTotals(ThisYearSales, PreviousYearSales, LTMSales, Rec."ORB Lifetime Sales Total", Rec."No.");
        FunctionsCU.CalculateCreditMemoTotals(ThisYearSalesCrMemo, PreviousYearSalesCrMemo, LTMSalesCrMemo, LifetimeSalesCrMemo, Rec."No.");
    end;

    var
        ThisYearSales: Decimal;
        PreviousYearSales: Decimal;
        LTMSales: Decimal;
        ThisYearSalesCrMemo: Decimal;
        PreviousYearSalesCrMemo: Decimal;
        LTMSalesCrMemo: Decimal;
        LifetimeSalesCrMemo: Decimal;
    */
}

