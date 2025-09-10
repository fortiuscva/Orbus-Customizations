codeunit 52608 "ORB Batch Post SO from JQ"
{

    trigger OnRun()
    var
        BatchPostSalesOrdersCULcl: Report "Batch Post Sales Orders";
        SalesHeaderLcl: Record "Sales Header";
        SalesLineLcl: Record "Sales Line";
    begin
        SalesHeaderLcl.Reset();
        SalesHeaderLcl.SetRange("Document Type", SalesHeaderLcl."Document Type"::Order);
        SalesHeaderLcl.SetRange("Shipped Not Invoiced", true);
        // SalesHeaderLcl.SetFilter("Package Tracking No.", '<>%1', '');
        if SalesHeaderLcl.FindSet() then begin
            repeat
                SalesLineLcl.Reset();
                SalesLineLcl.SetRange("Document Type", SalesHeaderLcl."Document Type");
                SalesLineLcl.SetRange("Document No.", SalesHeaderLcl."No.");
                if SalesLineLcl.FindSet() then begin
                    repeat
                        if (SalesLineLcl.Type = SalesLineLcl.Type::Resource) and (SalesLineLcl."No." = 'RES0000018') and (SalesLineLcl."Outstanding Quantity" > 0) then begin
                            if SalesHeaderLcl."Package Tracking No." <> '' then
                                SalesLineLcl.Validate("Qty. to Ship", SalesLineLcl."Outstanding Quantity")
                            else
                                SalesLineLcl.Validate("Qty. to Ship", 0);
                        end else begin
                            if SalesLineLcl."Qty. to Ship" <> 0 then
                                SalesLineLcl.Validate("Qty. to Ship", 0);
                        end;
                        SalesLineLcl.Modify();
                    until SalesLineLcl.Next() = 0;
                end;
            until SalesHeaderLcl.Next() = 0;
        end;
        BatchPostSalesOrdersCULcl.InitializeRequest(true, true, Today(), Today(), true, false, false, false);
        BatchPostSalesOrdersCULcl.UseRequestPage(false);
        OrbusSingleInstanceCUGbl.SetShippedNotInvoiced(true);
        BatchPostSalesOrdersCULcl.Run();
        OrbusSingleInstanceCUGbl.SetShippedNotInvoiced(false);

    end;

    var
        OrbusSingleInstanceCUGbl: Codeunit "ORB Orbus Single Instance";
}
