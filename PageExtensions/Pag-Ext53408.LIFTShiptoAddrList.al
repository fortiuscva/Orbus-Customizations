pageextension 53408 "ORB LIFT ShiptoAddr. List" extends "Ship-to Address List"
{
    layout
    {
        addfirst(Control1)
        {
            field("ORB Active Status"; Rec."ORB Active Status")
            {
                ApplicationArea = all;
            }
        }
    }
}
