page 52660 "ORB Posted Sales Invoices"
{
    APIVersion = 'v2.0';
    APIGroup = 'orbus';
    APIPublisher = 'orbus';
    DelayedInsert = true;
    EntityName = 'postedSalesInvoice';
    EntitySetName = 'postedSalesInvoices';
    ODataKeyFields = SystemId;
    PageType = API;
    SourceTable = "Sales Invoice Header";
    Extensible = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    Editable = false;

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(SystemId));
                    end;
                }
                field(number; Rec."No.")
                {
                    Caption = 'No.';
                    Editable = false;

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("No."));
                    end;
                }
                field(magentoOrderNo; Rec."ORB Magento Order #")
                {
                    Caption = 'Magento Order #';
                }
                field(customerNumber; Rec."Sell-to Customer No.")
                {
                    Caption = 'Customer No.';

                    trigger OnValidate()
                    begin
                        if SellToCustomer."No." <> '' then begin
                            if SellToCustomer."No." <> Rec."Sell-to Customer No." then
                                Error(SellToCustomerValuesDontMatchErr);
                            exit;
                        end;

                        if not SellToCustomer.Get(Rec."Sell-to Customer No.") then
                            Error(CouldNotFindSellToCustomerErr);

                        // Rec."Customer Id" := SellToCustomer.SystemId;
                        // RegisterFieldSet(Rec.FieldNo("Customer Id"));
                        RegisterFieldSet(Rec.FieldNo("Sell-to Customer No."));
                    end;
                }
                field(customerName; Rec."Sell-to Customer Name")
                {
                    Caption = 'Customer Name';
                    Editable = false;
                }
                field(invoiceDate; Rec."Document Date")
                {
                    Caption = 'Invoice Date';

                    trigger OnValidate()
                    begin
                        DocumentDateVar := Rec."Document Date";
                        DocumentDateSet := true;

                        RegisterFieldSet(Rec.FieldNo("Document Date"));
                    end;
                }
                field(dueDate; Rec."Due Date")
                {
                    Caption = 'Due Date';

                    trigger OnValidate()
                    begin
                        DueDateVar := Rec."Due Date";
                        DueDateSet := true;

                        RegisterFieldSet(Rec.FieldNo("Due Date"));
                    end;
                }
                field(totalAmountIncludingTax; Rec."Amount Including VAT")
                {
                    Caption = 'Total Amount Including Tax';
                    Editable = false;

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Amount Including VAT"));
                    end;
                }
                field(remainingAmount; RemainingAmountVar)
                {
                    Caption = 'Remaining Amount';
                    Editable = false;
                }
                field(currencyCode; CurrencyCodeTxt)
                {
                    Caption = 'Currency Code';

                    trigger OnValidate()
                    begin
                        Rec."Currency Code" :=
                          GraphMgtGeneralTools.TranslateCurrencyCodeToNAVCurrencyCode(
                            LCYCurrencyCode, COPYSTR(CurrencyCodeTxt, 1, MAXSTRLEN(LCYCurrencyCode)));

                        if Currency.Code <> '' then begin
                            if Currency.Code <> Rec."Currency Code" then
                                Error(CurrencyValuesDontMatchErr);
                            exit;
                        end;

                        // if Rec."Currency Code" = '' then
                        //     Rec."Currency Id" := BlankGUID
                        // else begin
                        //     if not Currency.Get(Rec."Currency Code") then
                        //         Error(CurrencyCodeDoesNotMatchACurrencyErr);

                        //     Rec."Currency Id" := Currency.SystemId;
                        // end;

                        // RegisterFieldSet(Rec.FieldNo("Currency Id"));
                        RegisterFieldSet(Rec.FieldNo("Currency Code"));
                    end;
                }
                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified Date';
                    Editable = false;
                }
                field(externalDocumentNumber; Rec."External Document No.")
                {
                    Caption = 'External Document No.';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("External Document No."));
                    end;
                }
                part(pdfDocument; "Posted Sales Invoice API PDF")
                {
                    Caption = 'PDF Document';
                    Multiplicity = ZeroOrOne;
                    EntityName = 'pdfPSIDocument';
                    EntitySetName = 'pdfPSIDocument';
                    SubPageLink = "Document Id" = field(SystemId), "Document Type" = const("Sales Invoice");
                }
            }
        }
    }


    trigger OnAfterGetRecord()
    var
        SalesInvoiceAggregator: Codeunit "Sales Invoice Aggregator";
    begin
        SetCalculatedFields();
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        SalesInvoiceAggregator: Codeunit "Sales Invoice Aggregator";
    begin
        SetCalculatedFields();

        exit(false);
    end;

    trigger OnModifyRecord(): Boolean
    var
        SalesInvoiceAggregator: Codeunit "Sales Invoice Aggregator";
    begin
        if xRec.SystemId <> Rec.SystemId then
            Error(CannotChangeIDErr);
        SetCalculatedFields();

        exit(false);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        ClearCalculatedFields();
    end;

    var
        TempFieldBuffer: Record 8450 temporary;
        SellToCustomer: Record "Customer";
        BillToCustomer: Record "Customer";
        DisputeStatus: Record "Dispute Status";
        Currency: Record "Currency";
        PaymentTerms: Record "Payment Terms";
        ShipmentMethod: Record "Shipment Method";
        O365SetupEmail: Codeunit "O365 Setup Email";
        // APIV2SendSalesDocument: Codeunit "APIV2 - Send Sales Document";
        GraphMgtGeneralTools: Codeunit "Graph Mgt - General Tools";
        CannotChangeIDErr: Label 'The id cannot be changed.';
        LCYCurrencyCode: Code[10];
        CurrencyCodeTxt: Text;
        SellToCustomerNotProvidedErr: Label 'A "customerNumber" or a "customerId" must be provided.', Comment = 'customerNumber and customerId are field names and should not be translated.';
        SellToCustomerValuesDontMatchErr: Label 'The sell-to customer values do not match to a specific Customer.';
        BillToCustomerValuesDontMatchErr: Label 'The bill-to customer values do not match to a specific Customer.';
        CouldNotFindSellToCustomerErr: Label 'The sell-to customer cannot be found.';
        CouldNotFindBillToCustomerErr: Label 'The bill-to customer cannot be found.';
        CouldNotFindDisputeStatusErr: Label 'The dispute status cannot be found.';
        CurrencyValuesDontMatchErr: Label 'The currency values do not match to a specific Currency.';
        CurrencyIdDoesNotMatchACurrencyErr: Label 'The "currencyId" does not match to a Currency.', Comment = 'currencyId is a field name and should not be translated.';
        CurrencyCodeDoesNotMatchACurrencyErr: Label 'The "currencyCode" does not match to a Currency.', Comment = 'currencyCode is a field name and should not be translated.';
        BlankGUID: Guid;
        PaymentTermsIdDoesNotMatchAPaymentTermsErr: Label 'The "paymentTermsId" does not match to a Payment Terms.', Comment = 'paymentTermsId is a field name and should not be translated.';
        ShipmentMethodIdDoesNotMatchAShipmentMethodErr: Label 'The "shipmentMethodId" does not match to a Shipment Method.', Comment = 'shipmentMethodId is a field name and should not be translated.';
        DisputeStatusIdDoesNotMatchADisputeStatusErr: Label 'The "disputeStatusId" does not match to a Dispute Status.', Comment = 'disputeStatusId is a field name and should not be translated.';
        PermissionFilterFormatTxt: Label '<>%1&<>%2', Locked = true;
        PermissionInvoiceFilterformatTxt: Label '<>%1&<>%2&<>%3&<>%4', Locked = true;
        DiscountAmountSet: Boolean;
        InvoiceDiscountAmount: Decimal;
        RemainingAmountVar: Decimal;
        DocumentDateSet: Boolean;
        DocumentDateVar: Date;
        PostingDateSet: Boolean;
        PostingDateVar: Date;
        DueDateSet: Boolean;
        DueDateVar: Date;
        PostedInvoiceActionErr: Label 'The action can be applied to a posted invoice only.';
        DraftInvoiceActionErr: Label 'The action can be applied to a draft invoice only.';
        CannotFindInvoiceErr: Label 'The invoice cannot be found.';
        CancelingInvoiceFailedCreditMemoCreatedAndPostedErr: Label 'Canceling the invoice failed because of the following error: \\%1\\A credit memo is posted.', Comment = '%1 - arbitrary text (an error message)';
        CancelingInvoiceFailedCreditMemoCreatedButNotPostedErr: Label 'Canceling the invoice failed because of the following error: \\%1\\A credit memo is created but not posted.', Comment = '%1 - arbitrary text (an error message)';
        CancelingInvoiceFailedNothingCreatedErr: Label 'Canceling the invoice failed because of the following error: \\%1.', Comment = '%1 - arbitrary text (an error message)';
        EmptyEmailErr: Label 'The send-to email is empty. Specify email either for the customer or for the invoice in email preview.';
        AlreadyCanceledErr: Label 'The invoice cannot be canceled because it has already been canceled.';
        InvoiceClosedErr: Label 'The invoice is closed. The corrective credit memo will not be applied to the invoice.';
        InvoicePartiallyPaidErr: Label 'The invoice is partially paid or credited. The corrective credit memo may not be fully closed by the invoice.';
        HasWritePermissionForDraft: Boolean;

    local procedure SetCalculatedFields()
    begin
        Rec.LoadFields("No.", "Currency Code", "Amount Including VAT");
        GetRemainingAmount();
        CurrencyCodeTxt := GraphMgtGeneralTools.TranslateNAVCurrencyCodeToCurrencyCode(LCYCurrencyCode, Rec."Currency Code");
    end;

    local procedure ClearCalculatedFields()
    begin
        Clear(InvoiceDiscountAmount);
        Clear(DiscountAmountSet);
        Clear(RemainingAmountVar);
        TempFieldBuffer.DeleteAll();
    end;

    local procedure RegisterFieldSet(FieldNo: Integer)
    var
        LastOrderNo: Integer;
    begin
        LastOrderNo := 1;
        if TempFieldBuffer.FindLast() then
            LastOrderNo := TempFieldBuffer.Order + 1;

        Clear(TempFieldBuffer);
        TempFieldBuffer.Order := LastOrderNo;
        TempFieldBuffer."Table ID" := Database::"Sales Invoice Header";
        TempFieldBuffer."Field ID" := FieldNo;
        TempFieldBuffer.Insert();
    end;

    local procedure GetRemainingAmount();
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
    begin
        RemainingAmountVar := Rec.GetRemainingAmount();
    end;

    local procedure SetDates()
    var
        SalesInvoiceAggregator: Codeunit "Sales Invoice Aggregator";
    begin
        if not (DueDateSet or DocumentDateSet or PostingDateSet) then
            exit;

        TempFieldBuffer.Reset();
        TempFieldBuffer.DeleteAll();

        if DocumentDateSet then begin
            Rec."Document Date" := DocumentDateVar;
            RegisterFieldSet(Rec.FieldNo("Document Date"));
        end;

        if PostingDateSet then begin
            Rec."Posting Date" := PostingDateVar;
            RegisterFieldSet(Rec.FieldNo("Posting Date"));
        end;

        if DueDateSet then begin
            Rec."Due Date" := DueDateVar;
            RegisterFieldSet(Rec.FieldNo("Due Date"));
        end;

        Rec.Find();
    end;

    local procedure GetCustomerEmailAddress(): Text[250]
    var
        Customer: Record Customer;
    begin
        if not Customer.Get(Rec."Sell-to Customer No.") then
            exit('');
        exit(Customer."E-Mail");
    end;
}