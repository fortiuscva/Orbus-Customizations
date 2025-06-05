codeunit 52617 "ORB Calculate Sales Totals"
{
    [TryFunction]
    procedure CalculateSalesTotalsForEveryCustomer(var Customer: Record Customer)
    var
        FunctionsCU: Codeunit "ORB Functions";
    begin
        FunctionsCU.CalculateSalesTotals(Customer."ORB This Year Sales", Customer."ORB Prev Year Sales", Customer."ORB LTM Sales", Customer."ORB Lifetime Sales Total", Customer."No.");
        FunctionsCU.CalculateCreditMemoTotals(Customer."ORB ThisYearSalesCrMemo", Customer."ORB PreviousYearSalesCrMemo", Customer."ORB LTMSalesCrMemo", Customer."ORB LifetimeSalesTotalCrMemo", Customer."No.");
        if (Customer."ORB Lifetime Sales Total" > 0) and (Customer."ORB Lifetime Sales Total" < 10000) then
            Customer."ORB Is Core Team" := True;
        Customer.Modify();
    end;
}
