codeunit 52602 "ORB Auto Send Sales Invoices"
{
    Permissions = tabledata "Sales Invoice Header" = rmid;
    trigger OnRun()
    var
        CustomerRecLcl: Record Customer;
        SalesInvoiceHeaderRecLcl: Record "Sales Invoice Header";
        SalesReceivablesSetupRecLcl: Record "Sales & Receivables Setup";
        OrbusSingleInstanceCULcl: Codeunit "ORB Orbus Single Instance";
    begin
        OrbusSingleInstanceCULcl.SetOnSendCustomerRecordsOnBeforeLookupProfile(false);
        OrbusSingleInstanceCULcl.SetOnBeforeSendEmailToCust(true);
        OrbusSingleInstanceCULcl.SetOnBeforeSendEmail(true);
        OrbusSingleInstanceCULcl.SetOnBeforeCheckShowProfileSelectionMethodDialog(3, true, true);

        SalesReceivablesSetupRecLcl.Get();

        clear(CustomerRecLcl);
        CustomerRecLcl.SetRange("ORB Auto Send Email", true);
        if CustomerRecLcl.FindSet() then
            repeat
                clear(SalesInvoiceHeaderRecLcl);
                SalesInvoiceHeaderRecLcl.SetRange("ORB Email Sent by JQ", false);
                SalesInvoiceHeaderRecLcl.SetRange("Sell-to Customer No.", CustomerRecLcl."No.");
                SalesInvoiceHeaderRecLcl.SetFilter("Posting Date", '>=%1', SalesReceivablesSetupRecLcl."ORB Send Email Inv. Start Date");
                if SalesInvoiceHeaderRecLcl.FindSet() then begin
                    if not ORBSendSalesInvByCustCUGbl.run(SalesInvoiceHeaderRecLcl) then;
                end;
            until CustomerRecLcl.Next() = 0;

        OrbusSingleInstanceCULcl.SetOnSendCustomerRecordsOnBeforeLookupProfile(false);
        OrbusSingleInstanceCULcl.SetOnBeforeSendEmailToCust(false);
        OrbusSingleInstanceCULcl.SetOnBeforeSendEmail(false);
        OrbusSingleInstanceCULcl.SetOnBeforeCheckShowProfileSelectionMethodDialog(0, false, false);
    end;

    var
        ORBSendSalesInvByCustCUGbl: Codeunit "ORB Send Sales Inv. By Cust.";

}