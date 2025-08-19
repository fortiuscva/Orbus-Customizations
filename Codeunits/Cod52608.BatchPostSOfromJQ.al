codeunit 52608 "ORB Batch Post SO from JQ"
{

    trigger OnRun()
    var
        BatchPostSalesOrdersCULcl: Report "Batch Post Sales Orders";
    begin
        BatchPostSalesOrdersCULcl.InitializeRequest(true, true, Today(), Today(), true, false, false, false);
        BatchPostSalesOrdersCULcl.UseRequestPage(false);
        OrbusSingleInstanceCUGbl.SetShippedNotInvoiced(true);
        BatchPostSalesOrdersCULcl.Run();
        OrbusSingleInstanceCUGbl.SetShippedNotInvoiced(false);

    end;

    var
        OrbusSingleInstanceCUGbl: Codeunit "ORB Orbus Single Instance";
}
