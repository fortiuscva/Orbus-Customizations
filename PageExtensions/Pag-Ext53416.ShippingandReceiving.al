pageextension 53416 "ORB Shipping and Receiving" extends "Whse. WMS Role Center"
{
    layout
    {
        addafter(Control1903327208)
        {
            Part(Control12; "ORB Inventory Movement")
            {
                Caption = 'Inventory Movement - All';
                ApplicationArea = Warehouse;
            }
        }
    }
    var
        WarehouseActivityHeaderRecGbl: Record "Warehouse Activity Header";
}


