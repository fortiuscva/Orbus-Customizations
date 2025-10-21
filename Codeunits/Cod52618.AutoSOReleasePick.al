codeunit 52618 "ORB Auto SO Release & Pick"
{

    TableNo = "Job Queue Entry";
    trigger OnRun()
    begin
        AutoReleaseAndPick();
    end;

    procedure AutoReleaseAndPick()
    var
        SalesHeaderRecLcl: Record "Sales Header";
        ORBCreateInventoryPick: Codeunit "ORB Create Inventory Pick";
        SalesLine: Record "Sales Line";
        ItemRec: Record Item;
        IsValid: Boolean;
    begin

        SalesHeaderRecLcl.Reset();
        SalesHeaderRecLcl.SetFilter("Order Status", '<%1', SalesHeaderRecLcl."Order Status"::"ReadyforPick/Release");
        SalesHeaderRecLcl.SetFilter("Shipment Date", '<=%1', Today());
        if SalesHeaderRecLcl.FindSet() then
            repeat
                SalesLine.Reset();
                SalesLine.SetRange("Document Type", SalesHeaderRecLcl."Document Type");
                SalesLine.SetRange("Document No.", SalesHeaderRecLcl."No.");
                SalesLine.SetRange(Type, SalesLine.Type::Item);

                IsValid := true;

                if SalesLine.FindSet() then
                    repeat
                        if ItemRec.Get(SalesLine."No.") then begin
                            if ItemRec."Replenishment System" <> ItemRec."Replenishment System"::Purchase then
                                IsValid := false;
                        end else
                            IsValid := false;

                        if SalesLine."Shortcut Dimension 2 Code" <> '01' then
                            IsValid := false;

                    until (SalesLine.Next() = 0) or (not IsValid);

                if IsValid then begin
                    SalesHeaderRecLcl."Order Status" := SalesHeaderRecLcl."Order Status"::"ReadyforPick/Release";
                    SalesHeaderRecLcl.Modify();
                end;

            until SalesHeaderRecLcl.Next() = 0;




        SalesHeaderRecLcl.Reset();
        SalesHeaderRecLcl.SetRange("Order Status", SalesHeaderRecLcl."Order Status"::"ReadyforPick/Release");
        IF SalesHeaderRecLcl.FindSet() then
            repeat
                if not ORBCreateInventoryPick.Run(SalesHeaderRecLcl) then;
            Until SalesHeaderRecLcl.Next() = 0;
    end;
}
