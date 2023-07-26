codeunit 52604 "ORB Send Sales Inv. By Cust."
{
    Permissions = tabledata "Sales Invoice Header" = rmid;
    TableNo = "Sales Invoice Header";

    trigger OnRun()
    begin
        OrbusSingleInstanceCUGbl.SetOnSendCustomerRecordsOnBeforeLookupProfile(false);
        OrbusSingleInstanceCUGbl.SetOnBeforeSendEmailToCust(true);
        OrbusSingleInstanceCUGbl.SetOnBeforeSendEmail(true);
        OrbusSingleInstanceCUGbl.SetOnBeforeCheckShowProfileSelectionMethodDialog(3, true, true);

        Rec.SendRecords();
        Rec.ModifyAll("ORB Last Email Sent DT", CurrentDateTime());
        Rec.ModifyAll("ORB Email Sent by JQ", true);

        OrbusSingleInstanceCUGbl.SetOnSendCustomerRecordsOnBeforeLookupProfile(false);
        OrbusSingleInstanceCUGbl.SetOnBeforeSendEmailToCust(false);
        OrbusSingleInstanceCUGbl.SetOnBeforeSendEmail(false);
        OrbusSingleInstanceCUGbl.SetOnBeforeCheckShowProfileSelectionMethodDialog(0, false, false);
    end;

    var
        OrbusSingleInstanceCUGbl: Codeunit "ORB Orbus Single Instance";

}
