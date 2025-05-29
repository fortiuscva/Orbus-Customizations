codeunit 52617 "ORB Calculate Sales Totals"
{
    TableNo = Customer;

    trigger OnRun()
    var
        FunctionsCU: Codeunit "ORB Functions";
    begin
        FunctionsCU.CalculateSalesTotals(Rec."ORB This Year Sales", Rec."ORB Prev Year Sales", Rec."ORB LTM Sales", Rec."ORB Lifetime Sales Total", Rec."No.");
        FunctionsCU.CalculateCreditMemoTotals(Rec."ORB ThisYearSalesCrMemo", Rec."ORB PreviousYearSalesCrMemo", Rec."ORB LTMSalesCrMemo", Rec."ORB LifetimeSalesTotalCrMemo", Rec."No.");
        if (Rec."ORB Lifetime Sales Total" > 0) and (Rec."ORB Lifetime Sales Total" < 10000) then
            Rec."ORB Is Core Team" := True;
        Rec.Modify();
    end;
}
