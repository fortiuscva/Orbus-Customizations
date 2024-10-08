codeunit 52607 "ORB PRD API Validations"
{

    procedure CheckforSalesOrderCustomerPO(CustomerPONo: Code[20])
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.Reset();
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        SalesHeader.SetRange("External Document No.", CustomerPONo);
        if not SalesHeader.FindFirst() then
            Error(CustomerPoNoErr, 'Sales Order', CustomerPONo);
    end;

    procedure CheckforSalesReturnOrderCustomerPO(CustomerPONo: Code[20])
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.Reset();
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::"Return Order");
        SalesHeader.SetRange("External Document No.", CustomerPONo);
        if not SalesHeader.FindFirst() then
            Error(CustomerPoNoErr, 'Sales Return Order', CustomerPONo);
    end;

    var
        CustomerPoNoErr: Label '%1 doesnot exists for Customer PO No. %2';
}