pageextension 52636 "ORB DSHIP Order Info. Factbox" extends "DSHIP Order Info. Factbox"
{
    layout
    {
        addafter(FreightCost)
        {
            group("ORB Freight")
            {
                field("ORB FreightCOst"; ORBFreightCOst)
                {
                    ApplicationArea = all;
                    ToolTip = 'Frieght cost';
                }
                field("ORB Margin"; Margin)
                {
                    ApplicationArea = all;
                    ToolTip = 'MArgin';
                }
                field("ORB Handling"; Handling)
                {
                    ApplicationArea = all;
                    ToolTip = 'Handling';
                }
            }

        }

    }
    var
        ORBFreightCOst: Decimal;
        Margin: Decimal;
        Handling: Decimal;

    procedure SetORBValues(HandlingVar: Decimal)
    begin
        Handling := HandlingVar
    end;

    trigger OnAfterGetRecord()

    begin
        OnBeforeSetShipmentDetails(recrRecRef);
    end;

    internal procedure OnBeforeSetShipmentDetails(recRef: RecordRef)
    var
        WhseShipmentHeader: Record "Warehouse Shipment Header";
        labelData: Record "DSHIP Label Data";
        lpHeader: Record "IWX LP Header";
        SingleInstance: Codeunit "ORB Orbus Single Instance";
    begin
        if recRef.Number() = Database::"Warehouse Shipment Header" then
            recRef.SetTable(WhseShipmentHeader);
        lpHeader.SetRange("Source No.", WhseShipmentHeader."No.");
        if lpHeader.FindFirst() then begin
            labelData.SetRange("Label Type", labelData."Label Type"::Shipping);
            labelData.SetRange("Label Format", labelData."Label Format"::PNG);
            labelData.SetRange("License Plate No.", lpHeader."No.");
            if labelData.FindFirst() then begin
                Handling := labelData."ORB Handling";
                ORBFreightCOst := labelData.Cost;
                //labelData.Modify();
            end;

        end;
    end;
}
