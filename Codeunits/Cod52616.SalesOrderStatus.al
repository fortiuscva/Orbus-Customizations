codeunit 52616 "ORB Sales Order Status"
{
    [ServiceEnabled]
    procedure GetSalesOrderStatus(SalesOrderNo: Code[20]): Text
    var
        SalesHeader: Record "Sales Header";
        PostedSalesInvoice: Record "Sales Invoice Header";
    begin
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        SalesHeader.SetRange("No.", SalesOrderNo);
        if SalesHeader.FindFirst() then begin
            PostedSalesInvoice.SetRange("Order No.", SalesOrderNo);
            if PostedSalesInvoice.FindFirst() then
                exit('Invoiced');
            if SalesHeader."Shipped" and not SalesHeader."Shipped Not Invoiced" then
                exit('Shipped');
            if SalesHeader.Status = SalesHeader.Status::Released then
                exit('InProduction');
            if SalesHeader."No. Printed" > 0 then
                exit('OrderConfirmed')
            else
                exit('OrderReceived');
        end else
            Error('Sales Order %1 not found.', SalesOrderNo);
    end;
}
