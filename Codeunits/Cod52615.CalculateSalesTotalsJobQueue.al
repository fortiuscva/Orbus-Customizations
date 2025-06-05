codeunit 52615 "Calculate SalesTotals JobQueue"
{
    Trigger OnRun()
    begin
        CalculateSalesTotals();
    end;

    [TryFunction]
    local procedure CalculateSalesTotals()
    var
        Customer: Record Customer;
        FunctionsCU: Codeunit "ORB Functions";
    begin
        if Customer.FindSet() then begin
            repeat
                FunctionsCU.CalculateSalesTotals(Customer."ORB This Year Sales", Customer."ORB Prev Year Sales", Customer."ORB LTM Sales", Customer."ORB Lifetime Sales Total", Customer."No.");
                FunctionsCU.CalculateCreditMemoTotals(Customer."ORB ThisYearSalesCrMemo", Customer."ORB PreviousYearSalesCrMemo", Customer."ORB LTMSalesCrMemo", Customer."ORB LifetimeSalesTotalCrMemo", Customer."No.");
                if (Customer."ORB Lifetime Sales Total" > 0) and (Customer."ORB Lifetime Sales Total" < 10000) then
                    Customer."ORB Is Core Team" := True;
                Customer.Modify();
            until Customer.Next() = 0;
        end;
    end;
}
