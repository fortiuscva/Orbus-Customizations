codeunit 52618 "ORB LIFT Update Status & Pick"
{
    TableNo = "Sales Header";

    trigger OnRun()
    begin
        AutoReleaseAndPick(Rec);
    end;

    procedure AutoReleaseAndPick(var SalesHeaderPar: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
        ItemRec: Record Item;
        WhseActHeader: Record "Warehouse Activity Header";
        ORBCreateInventoryPick: Codeunit "ORB Create Inventory Pick";
        ProductionOrderRec: Record "Production Order";
        HardWareSourced: Boolean;
        GraphicsHardwareSourced: Boolean;
        GraphicsHardwareProduction: Boolean;
        ProductionItem: Boolean;
        GraphicsDept: Boolean;
        HardWareDept: Boolean;

    begin

        GraphicsHardwareSourced := false;
        GraphicsHardwareProduction := false;

        SalesLine.Reset();
        SalesLine.SetRange("Document Type", SalesHeaderPar."Document Type");
        SalesLine.SetRange("Document No.", SalesHeaderPar."No.");
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        SalesLine.SetFilter("No.", '<>%1', '');
        if SalesLine.FindSet() then begin
            HardWareSourced := true;
            repeat
                ItemRec.Get(SalesLine."No.");
                if ItemRec."Replenishment System" <> ItemRec."Replenishment System"::Purchase then
                    HardWareSourced := false;

                if SalesLine."Shortcut Dimension 2 Code" <> '01' then
                    HardWareSourced := false;
            until (SalesLine.Next() = 0) or (not HardWareSourced);
        end;

        //check for Graphics + Hardware Sourced:
        //If there is at least one item which has have Replenishment System = Production with department Dimension on any sales line = ‘02’ 
        if not HardWareSourced then begin
            ProductionItem := false;
            HardWareDept := false;
            GraphicsHardwareSourced := false;

            SalesLine.Reset();
            SalesLine.SetRange("Document Type", SalesHeaderPar."Document Type");
            SalesLine.SetRange("Document No.", SalesHeaderPar."No.");
            SalesLine.SetRange(Type, SalesLine.Type::Item);
            SalesLine.SetFilter("No.", '<>%1', '');
            if SalesLine.FindSet() then begin
                repeat
                    ItemRec.Get(SalesLine."No.");
                    if ItemRec."Replenishment System" = ItemRec."Replenishment System"::"Prod. Order" then
                        ProductionItem := true;

                    if ProductionItem then
                        if SalesLine."Shortcut Dimension 2 Code" = '01' then begin
                            HardWareDept := true;
                        end;

                    if ProductionItem then
                        if SalesLine."Shortcut Dimension 2 Code" = '02' then
                            GraphicsHardwareSourced := true;

                until (SalesLine.Next() = 0);

                if GraphicsHardwareSourced and HardWareDept then
                    GraphicsHardwareSourced := false;
            end;
        end;

        //check for Graphics + Hardware Production:
        //If there is at least one item which has have Replenishment System = Production with Department Dimension on any sales line = ‘01’. 
        if (not HardWareSourced) and (not GraphicsHardwareSourced) then begin
            ProductionItem := false;
            GraphicsHardwareProduction := false;

            SalesLine.Reset();
            SalesLine.SetRange("Document Type", SalesHeaderPar."Document Type");
            SalesLine.SetRange("Document No.", SalesHeaderPar."No.");
            SalesLine.SetRange(Type, SalesLine.Type::Item);
            SalesLine.SetFilter("No.", '<>%1', '');
            if SalesLine.FindSet() then begin
                repeat
                    ItemRec.Get(SalesLine."No.");
                    if ItemRec."Replenishment System" = ItemRec."Replenishment System"::"Prod. Order" then
                        ProductionItem := true;

                    if ProductionItem then
                        if SalesLine."Shortcut Dimension 2 Code" = '01' then
                            GraphicsHardwareProduction := true;

                until (SalesLine.Next() = 0) or (GraphicsHardwareProduction);
            end;
        end;

        if HardWareSourced then begin

            WhseActHeader.Reset();
            WhseActHeader.SetRange("Source Document", WhseActHeader."Source Document"::"Sales Order");
            WhseActHeader.SetRange("Source No.", '<>%1', '');
            if not WhseActHeader.FindFirst() then begin
                SalesHeaderPar.Validate("Order Status", SalesHeaderPar."Order Status"::"ReadyforPick/Release");
                SalesHeaderPar.Modify(true);
                Commit();
                // Run pick creation
                if not SalesHeaderPar."ORB Pick Created" then
                    if SalesHeaderPar."Shipment Date" <= Today then
                        if not ORBCreateInventoryPick.Run(SalesHeaderPar) then;
            end;
        end else if GraphicsHardwareSourced then begin
            SalesHeaderPar.Validate("Order Status", SalesHeaderPar."Order Status"::"AC In Production");
            SalesHeaderPar.Modify(true);
            Commit();
        end else if GraphicsHardwareProduction then begin
            ProductionOrderRec.Reset();
            ProductionOrderRec.SetRange("Source Type", ProductionOrderRec."Source Type"::"Sales Header");
            ProductionOrderRec.SetRange("Source No.", SalesHeaderPar."No.");
            if not ProductionOrderRec.FindFirst() then begin
                SalesHeaderPar.Validate("Order Status", SalesHeaderPar."Order Status"::ReadyForProduction);
                SalesHeaderPar.Modify(true);
                Commit();
            end;
        end;
    end;
}
