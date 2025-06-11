codeunit 52615 "Calculate SalesTotals JobQueue"
{
    Trigger OnRun()
    var
        Customer: Record Customer;
        CalculateSalesTotals: Codeunit "ORB Calculate Sales Totals";
    begin
        if Customer.FindSet() then begin
            repeat
                if not CalculateSalesTotals.Run(Customer) then;
            until Customer.Next() = 0;
        end;
    end;
}
