codeunit 52615 "Calculate SalesTotals JobQueue"
{
    Trigger OnRun()
    var
        Customer: Record Customer;
        CalculateSalesTotals: Codeunit "ORB Calculate Sales Totals";
    begin
        if Customer.FindSet() then begin
            repeat
                CalculateSalesTotals.CalculateSalesTotalsForEveryCustomer(Customer);
            until Customer.Next() = 0;
        end;
    end;
}
