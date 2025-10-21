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
        if SalesHeaderRecLcl.FindSet() then
            repeat
                SalesLine.SetRange("Document Type", SalesHeaderRecLcl."Document Type");
                SalesLine.SetRange("Document No.", SalesHeaderRecLcl."No.");
                if SalesLine.findset() then begin
                    IsValid := true;
                    repeat
                        if SalesLine.Type = SalesLine.Type::Item then begin
                            if not ItemRec.Get(SalesLine."No.") and (ItemRec."Replenishment System" <> ItemRec."Replenishment System"::Purchase) then begin
                                IsValid := false;
                                exit;
                            end;

                            if SalesLine."Shortcut Dimension 1 Code" <> '01' then begin
                                IsValid := false;
                                exit;
                            end;
                        end;
                    until SalesLine.Next() = 0;

                    if IsValid then begin
                        SalesHeaderRecLcl."Order Status" := SalesHeaderRecLcl."Order Status"::"ReadyforPick/Release";
                        SalesHeaderRecLcl.Modify();
                    end;
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
