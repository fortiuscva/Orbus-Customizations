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
                field(creditLimitLCY; Rec."Credit Limit (LCY)")
                {
                    Caption = 'Credit Limit (LCY)';
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
                field(industryDimension; Rec."Shortcut Dimension 6 Code")
                {
                    Caption = 'Industry Dimension';
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
    begin
        InvoiceEmail := '';
        SetFiltersForCustomReportSelection(FromCustomReportSelection);
        FromCustomReportSelection.SetFilter("Send To Email", '<>%1', '');
        if FromCustomReportSelection.FindLast() then
            InvoiceEmail := FromCustomReportSelection."Send To Email";
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        if not Rec."ORB Auto Send Email" then
            exit;

        EnsureInvoiceEmailExists();

        SetFiltersForCustomReportSelection(FromCustomReportSelection);
        if not FromCustomReportSelection.FindFirst() then
            CreateDocumentLayout();
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if not Rec."ORB Auto Send Email" then
            exit;

        EnsureInvoiceEmailExists();

        SetFiltersForCustomReportSelection(FromCustomReportSelection);
        if not FromCustomReportSelection.FindFirst() then
            CreateDocumentLayout()

        else if UpdateCustomReportSelection(FromCustomReportSelection) then
            FromCustomReportSelection.Modify(true);
    end;

    local procedure EnsureInvoiceEmailExists()
    var
        EmailBlankErrorLbl: Label 'Invoice email cannot be blank if auto send email is true for the customer %1';
    begin
        if InvoiceEmail = '' then
            Error(StrSubstNo(EmailBlankErrorLbl, Rec."No."));
    end;

    local procedure SetFiltersForCustomReportSelection(var CustomReportSelectionPar: Record "Custom Report Selection")
    begin
        CustomReportSelectionPar.Reset();
        CustomReportSelectionPar.SetRange("Source Type", Database::Customer);
        CustomReportSelectionPar.SetRange("Source No.", Rec."No.");
        CustomReportSelectionPar.SetRange(Usage, CustomReportSelectionPar.Usage::"S.Invoice");
    end;

    local procedure CreateDocumentLayout()
    var
        SequenceLcl: Integer;
        CustomReportSelectionRecLcl: Record "Custom Report Selection";
        ToCustomReportSelection: Record "Custom Report Selection";
    begin
        SequenceLcl := 0;
        // CustomReportSelectionRecLcl.Reset();
        CustomReportSelectionRecLcl.SetCurrentKey(Sequence);
        if CustomReportSelectionRecLcl.FindLast() then
            SequenceLcl := CustomReportSelectionRecLcl.Sequence + 1
        else
            SequenceLcl := 1;

        ToCustomReportSelection.Init();
        ToCustomReportSelection."Source Type" := Database::Customer;
        ToCustomReportSelection."Source No." := Rec."No.";
        ToCustomReportSelection.Usage := ToCustomReportSelection.Usage::"S.Invoice";
        ToCustomReportSelection.Sequence := SequenceLcl;
        ToCustomReportSelection.Validate("Report ID", 1306);
        ToCustomReportSelection.Validate("Custom Report Layout Code", '1306-000002');
        ToCustomReportSelection.Validate("Send To Email", InvoiceEmail);
        ToCustomReportSelection.Validate("Use for Email Attachment", true);
        ToCustomReportSelection.Validate("Use for Email Body", true);
        ToCustomReportSelection.Validate("Email Body Layout Code", '1306-000002');
        ToCustomReportSelection.Validate("Use Email from Contact", false);
        ToCustomReportSelection.Insert(true);
    end;

    local procedure UpdateCustomReportSelection(var CustomReportSelectionPar2: Record "Custom Report Selection"): Boolean
    var
        IsModified: Boolean;
    begin
        IsModified := false;
        if CustomReportSelectionPar2."Send To Email" <> InvoiceEmail then begin
            CustomReportSelectionPar2.Validate("Send To Email", InvoiceEmail);
            IsModified := true;
        end;
        if not CustomReportSelectionPar2."Use for Email Attachment" then begin
            CustomReportSelectionPar2.Validate("Use for Email Attachment", true);
            CustomReportSelectionPar2.Validate("Custom Report Layout Code", '1306-000002');
            CustomReportSelectionPar2.Validate("Email Body Layout Code", '1306-000002');
            IsModified := true;
        end;
        if not CustomReportSelectionPar2."Use for Email Body" then begin
            CustomReportSelectionPar2.Validate("Use for Email Body", true);
            IsModified := true;
        end;
        exit(IsModified);
    end;

    var
        InvoiceEmail: Text[200];
        FromCustomReportSelection: Record "Custom Report Selection";
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

