codeunit 53419 "ORB LIFT OData Functions"
{
    [ServiceEnabled]
    procedure ReleaseSalesOrder(SalesOrderNo: Code[20])
    var
        SalesHeader: Record "Sales Header";
        ReleaseSalesDoc: Codeunit "Release Sales Document";
    begin
        SalesHeader.Get(SalesHeader."Document Type"::Order, SalesOrderNo);
        ReleaseSalesDoc.Run(SalesHeader);
    end;
}
