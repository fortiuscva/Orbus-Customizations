codeunit 52609 "ORB Update SO Tax Area Code"
{

    trigger OnRun()
    begin
        SalesHeaderRecGbl.Reset();
        SalesHeaderRecGbl.SetRange("Document Type", SalesHeaderRecGbl."Document Type"::Order);
        SalesHeaderRecGbl.SetRange("Shipped Not Invoiced", true);
        if SalesHeaderRecGbl.FindSet() then
            repeat
                if UpdateTaxAreaCode(SalesHeaderRecGbl) then;
            until SalesHeaderRecGbl.Next() = 0;

        if GuiAllowed then
            Message('Sales Orders Updated.');
    end;

    [TryFunction]
    procedure UpdateTaxAreaCode(SalesHeaderPar: Record "Sales Header")
    var
        SalesLineRecLcl: Record "Sales Line";
        ReleaseSalesDoc: Codeunit "Release Sales Document";
        TaxAreaCodeVarLcl: Code[20];
    begin
        ReleaseSalesDoc.PerformManualReopen(SalesHeaderPar);
        SalesLineRecLcl.Reset();
        SalesLineRecLcl.SetFilter(Type, '<>%1', SalesLineRecLcl.Type::" ");
        SalesLineRecLcl.SetFilter("Tax Area Code", '<>%1', '');
        if SalesLineRecLcl.FindSet() then
            repeat

                TaxAreaCodeVarLcl := SalesLineRecLcl."Tax Area Code";
                SalesLineRecLcl.Validate("Tax Area Code", '');
                SalesLineRecLcl.Validate("Tax Area Code", TaxAreaCodeVarLcl);
                SalesLineRecLcl.Modify();
            until SalesLineRecLcl.Next() = 0;

        ReleaseSalesDoc.PerformManualRelease(SalesHeaderPar);
    end;

    var
        SalesHeaderRecGbl: Record "Sales Header";
}
