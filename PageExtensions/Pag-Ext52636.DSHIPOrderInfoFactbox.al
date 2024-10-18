pageextension 52636 "ORB DSHIP Order Info. Factbox" extends "DSHIP Order Info. Factbox"
{
    layout
    {
        addafter(FreightCost)
        {
            group("ORB Freight")
            {
                Caption = 'Freight';
                field("ORB FreightQuote"; FreightQuote)
                {
                    ApplicationArea = all;
                    ToolTip = 'Freight Quote';
                    Caption = 'Freight Quote';
                }
                field("ORB FreightCOst"; ORBFreightCOst)
                {
                    ApplicationArea = all;
                    ToolTip = 'Orbus Frieght cost';
                    Caption = 'Orbus Frieght Cost';
                }
                field("ORB Handling"; Handling)
                {
                    ApplicationArea = all;
                    ToolTip = 'Handling (or) Handling per Package';
                    Caption = 'Handling (or) Handling per Package';
                }
                field("ORB Markup"; Markup)
                {
                    ApplicationArea = all;
                    ToolTip = 'Markup %';
                    Caption = 'Markup %';
                }


            }

        }

    }
    var
        ORBFreightCOst: Decimal;
        Markup: Decimal;
        Handling: Decimal;
        FreightQuote: Decimal;


    procedure InitializeValues()
    begin
        Markup := 0;
        Handling := 0;
        ORBFreightCOst := 0;
        FreightQuote := 0;
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
            //labelData.SetRange("License Plate No.", lpHeader."No.");
            labelData.SetRange("License Plate No.", LicensePlate);
            if labelData.FindFirst() then begin
                Handling := labelData."ORB Handling";
                ORBFreightCOst := labelData.Cost;
                Markup := labelData."ORB Markup %";
                FreightQuote := labelData."ORB Freight Quote";
                //labelData.Modify();
            end;

        end;
    end;

    procedure SetLicensePlateNo(LicensePlateNoVar: Code[50])
    begin
        LicensePlate := LicensePlateNoVar;
    end;

    var
        LicensePlate: Code[20];
}
