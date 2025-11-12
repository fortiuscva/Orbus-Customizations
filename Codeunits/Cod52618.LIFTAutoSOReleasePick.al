codeunit 52618 "ORB LIFT Auto SO Release&Pick"
{

    TableNo = "Sales Header";


    trigger OnRun()
    begin
        AutoReleaseAndPick(rec);
    end;

    procedure AutoReleaseAndPick(var SalesHeaderPar: Record "Sales Header")
    var
        ORBCreateInventoryPick: Codeunit "ORB Create Inventory Pick";
        SalesLine: Record "Sales Line";
        ItemRec: Record Item;
        IsValid: Boolean;
    begin
        SalesLine.Reset();
        SalesLine.SetRange("Document Type", SalesHeaderPar."Document Type");
        SalesLine.SetRange("Document No.", SalesHeaderPar."No.");
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
            SalesHeaderPar."Order Status" := SalesHeaderPar."Order Status"::"ReadyforPick/Release";
            SalesHeaderPar.Modify();
            if not ORBCreateInventoryPick.Run(SalesHeaderPar) then;
        end;
    end;
}
