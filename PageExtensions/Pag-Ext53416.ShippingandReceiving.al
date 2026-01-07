pageextension 53416 "ORB Shipping and Receiving" extends "Whse. WMS Role Center"
{
    layout
    {
        addlast("RoleCenter")
        {
            group("ORB cuegroup1")
            {
                Caption = 'Inventory Movement';
                Part(Control12; "ORB Inventory Movement")
                {
                    ApplicationArea = Warehouse;

                }
            }
        }
    }
    var
        WarehouseActivityHeaderRecGbl: Record "Warehouse Activity Header";
}


