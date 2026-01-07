pageextension 53416 "ORB Shipping and Receiving" extends "Whse. WMS Role Center"
{
    layout
    {
        addlast("RoleCenter")
        {
            group("ORB cuegroup1")
            {
                Part(Control12; "ORB Inventory Movement")
                {
                    ApplicationArea = All;

                }
            }
        }
    }
    var
        WarehouseActivityHeaderRecGbl: Record "Warehouse Activity Header";
}


