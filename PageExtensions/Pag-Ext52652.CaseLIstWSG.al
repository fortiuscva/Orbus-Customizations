pageextension 52652 "ORB Case List WSG" extends "Case List WSG"
{
    layout
    {
        addlast(General)
        {
            field("ORB Shipment Date"; Rec."Shipment Date")
            {
                Caption = 'Shipment Date';
                ApplicationArea = All;
                ToolTip = 'Shipment Date';
            }
        }
    }
}