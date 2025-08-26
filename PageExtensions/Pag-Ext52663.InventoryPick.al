pageextension 52663 "ORB Inventory Pick" extends "Inventory Pick"
{

    trigger OnOpenPage()
    var
        WarehouseActHdrRec: Record "Warehouse Activity Header";
    begin
        if WarehouseActHdrRec.get(rec.Type, rec."No.") then begin
            WarehouseActHdrRec.Validate("Posting Date", WorkDate());
            WarehouseActHdrRec.Modify();
        end;
    end;
}
