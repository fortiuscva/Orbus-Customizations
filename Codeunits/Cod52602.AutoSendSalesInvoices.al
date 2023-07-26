codeunit 52602 "ORB AutoSend Sales Invoices"
{
    Permissions = tabledata "Sales Invoice Header" = rmid;
    trigger OnRun()
    var
        CustomerRecLcl: Record Customer;
        SalesInvoiceHeaderRecLcl: Record "Sales Invoice Header";
        OrbusSingleInstanceCULcl: Codeunit "ORB Orbus Single Instance";
    begin
        // Clear(SalesInvoiceHeaderRecLcl);
        // SalesInvoiceHeaderRecLcl.SetRange("Sell-to Customer No.", '11180');
        // if SalesInvoiceHeaderRecLcl.FindSet() then
        //     SalesInvoiceHeaderRecLcl.ModifyAll("Sell-to E-Mail", 'vamshi.gutha@panaceasofttech.com');

        OrbusSingleInstanceCULcl.SetOnSendCustomerRecordsOnBeforeLookupProfile(false);
        OrbusSingleInstanceCULcl.SetOnBeforeSendEmailToCust(true);
        OrbusSingleInstanceCULcl.SetOnBeforeSendEmail(true);
        OrbusSingleInstanceCULcl.SetOnBeforeCheckShowProfileSelectionMethodDialog(3, true, true);

        clear(CustomerRecLcl);
        CustomerRecLcl.SetRange("ORB Auto Send Email", true);
        if CustomerRecLcl.FindSet() then
            repeat
                clear(SalesInvoiceHeaderRecLcl);
                SalesInvoiceHeaderRecLcl.SetRange("ORB Email Sent by JQ", false);
                SalesInvoiceHeaderRecLcl.SetRange("Sell-to Customer No.", CustomerRecLcl."No.");
                if SalesInvoiceHeaderRecLcl.FindSet() then begin
                    SalesInvoiceHeaderRecLcl.SendRecords();
                    SalesInvoiceHeaderRecLcl.ModifyAll("ORB Last Email Sent DT", CurrentDateTime());
                    SalesInvoiceHeaderRecLcl.ModifyAll("ORB Email Sent by JQ", true);
                end;
            until CustomerRecLcl.Next() = 0;

        OrbusSingleInstanceCULcl.SetOnSendCustomerRecordsOnBeforeLookupProfile(false);
        OrbusSingleInstanceCULcl.SetOnBeforeSendEmailToCust(false);
        OrbusSingleInstanceCULcl.SetOnBeforeSendEmail(false);
        OrbusSingleInstanceCULcl.SetOnBeforeCheckShowProfileSelectionMethodDialog(0, false, false);
    end;
}