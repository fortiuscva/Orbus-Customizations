codeunit 53407 "ORB Test Codeunit for LIFT"
{
    trigger OnRun()
    begin
        if LIFTSOBuffer.Get(LIFTSOBuffer."Document Type"::Order, 'O0000763') then begin
            LIFTSOBuffer."Sell-to Customer No." := 'NOR00030';
            LIFTSOBuffer."Bill-to Customer No." := 'NOR00030';
            LIFTSOBuffer."Document Date" := 20250611D;
            LIFTSOBuffer."Posting Date" := 20250612D;
            LIFTSOBuffer."Order Date" := 20250611D;
            LIFTSOBuffer."Due Date" := 20250611D;
            LIFTSOBuffer."In-Hands Date" := 20250612D;
            LIFTSOBuffer."External Document No." := '123456789';
            LIFTSOBuffer."Salesperson Code" := 'SARAH RYBARCZYK';
            LIFTSOBuffer."Order Status" := LIFTSOBuffer."Order Status"::"AC In Production";
            LIFTSOBuffer.Created_By := 'JAIME@ORBUS.COM';
            LIFTSOBuffer."Location Code" := 'WR';
            LIFTSOBuffer."Shortcut Dimension 1 Code" := 'WR';
            LIFTSOBuffer."Shipping Agent Code" := 'FEDEX';
            LIFTSOBuffer."Shipping Agent Service Code" := '2DAY';
            LIFTSOBuffer."Ship-to Address" := '28 Morning Glen Lane';
            LIFTSOBuffer."Ship-to City" := 'Newark';
            LIFTSOBuffer."Ship-to County" := 'DE';
            LIFTSOBuffer."Ship-to Post Code" := '19711';
            LIFTSOBuffer."Shipment Date" := 20250616D;
            LIFTSOBuffer."Ship-to Country/Region Code" := 'US';
            LIFTSOBuffer."Sales Order Payment Type" := LIFTSOBuffer."Sales Order Payment Type"::"3rd Party";
            LIFTSOBuffer.Modify();
        end;
    end;

    var
        LIFTSOBuffer: Record "ORB LIFT Sales Order Buffer";
}
