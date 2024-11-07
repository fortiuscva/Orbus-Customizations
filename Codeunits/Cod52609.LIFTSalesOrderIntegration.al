codeunit 52609 "LIFT Sales Order Integration"
{
    [ServiceEnabled]
    procedure ReadSalesOrderData(salesData: text) ReturnValue: text
    begin
        ReturnValue := salesData;
    end;
}