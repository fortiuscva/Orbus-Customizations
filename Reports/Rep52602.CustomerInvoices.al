report 52602 "ORB Customer Invoices"
{
    Caption = 'Customer Invoices';
    ProcessingOnly = true;

    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.";
            DataItemTableView = sorting("No.") where("ORB Auto Send Email" = const(true));


            trigger OnPreDataItem()
            begin
                OrbusSingleInstanceCULcl.SetEmailSendFromCustomerCardButton(true);
                OrbusSingleInstanceCULcl.SetOnSendCustomerRecordsOnBeforeLookupProfile(false);
                OrbusSingleInstanceCULcl.SetOnBeforeSendEmailToCust(true);
                OrbusSingleInstanceCULcl.SetOnBeforeSendEmail(true);
                OrbusSingleInstanceCULcl.SetOnBeforeCheckShowProfileSelectionMethodDialog(3, true, true);

                SalesReceivablesSetupRecLcl.Get();
            end;

            trigger OnAfterGetRecord()
            begin
                CustomReportSelectionRecLcl.Reset();
                CustomReportSelectionRecLcl.SetRange("Source Type", Database::Customer);
                CustomReportSelectionRecLcl.SetRange("Source No.", Customer."No.");
                CustomReportSelectionRecLcl.SetRange(Usage, CustomReportSelectionRecLcl.Usage::"S.Invoice");
                CustomReportSelectionRecLcl.SetFilter("Send To Email", '<>%1', '');
                if CustomReportSelectionRecLcl.FindLast() then begin
                    clear(SalesInvoiceHeaderRecLcl);
                    SalesInvoiceHeaderRecLcl.SetRange("ORB Email Sent by JQ", false);
                    SalesInvoiceHeaderRecLcl.SetRange("Sell-to Customer No.", Customer."No.");
                    SalesInvoiceHeaderRecLcl.SetFilter("Posting Date", '>=%1', SalesReceivablesSetupRecLcl."ORB Send Email Inv. Start Date");
                    if SalesInvoiceHeaderRecLcl.FindSet() then begin
                        if not ORBSendSalesInvByCustCUGbl.run(SalesInvoiceHeaderRecLcl) then;
                    end;
                end;
            end;

            trigger OnPostDataItem()
            begin
                OrbusSingleInstanceCULcl.SetEmailSendFromCustomerCardButton(false);
                OrbusSingleInstanceCULcl.SetOnSendCustomerRecordsOnBeforeLookupProfile(false);
                OrbusSingleInstanceCULcl.SetOnBeforeSendEmailToCust(false);
                OrbusSingleInstanceCULcl.SetOnBeforeSendEmail(false);
                OrbusSingleInstanceCULcl.SetOnBeforeCheckShowProfileSelectionMethodDialog(0, false, false);
            end;
        }
    }
    var

        SalesInvoiceHeaderRecLcl: Record "Sales Invoice Header";
        SalesReceivablesSetupRecLcl: Record "Sales & Receivables Setup";
        OrbusSingleInstanceCULcl: Codeunit "ORB Orbus Single Instance";
        CustomReportSelectionRecLcl: Record "Custom Report Selection";
        ORBSendSalesInvByCustCUGbl: Codeunit "ORB Send Sales Inv. By Cust.";
}
