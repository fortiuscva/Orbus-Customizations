pageextension 53412 "ORB Shipping and Receiving" extends "Whse. WMS Role Center"
{
    layout
    {
        addlast("RoleCenter")
        {
            group("ORB cuegroup1")
            {
                Caption = 'Picks';
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


