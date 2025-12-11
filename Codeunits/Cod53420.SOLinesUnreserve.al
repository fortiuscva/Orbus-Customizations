codeunit 53420 "ORB SO Lines Unreserve"
{
    procedure UnreserveSalesOrder(SalesOrderNo: Code[20])
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        ReservEntry: Record "Reservation Entry";
        ReservationEngineMgt: Codeunit "Reservation Engine Mgt.";
    begin
        if not SalesHeader.Get(SalesHeader."Document Type"::Order, SalesOrderNo) then
            Error('Sales Order %1 not found.', SalesOrderNo);

        SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order);
        SalesLine.SetRange("Document No.", SalesOrderNo);

        if SalesLine.FindSet() then
            repeat
                if SalesLine.ReservEntryExist() then begin
                    SalesLine.SetHideValidationDialog(true);

                    ReservEntry.SetRange("Source Type", Database::"Sales Line");
                    ReservEntry.SetRange("Source ID", SalesLine."Document No.");
                    ReservEntry.SetRange("Source Ref. No.", SalesLine."Line No.");
                    ReservEntry.SetRange("Reservation Status", ReservEntry."Reservation Status"::Reservation);

                    if ReservEntry.FindSet() then
                        repeat
                            ReservationEngineMgt.CancelReservation(ReservEntry);
                        until ReservEntry.Next() = 0;

                    SalesLine.SetHideValidationDialog(false);
                end;
            until SalesLine.Next() = 0;
    end;
}
