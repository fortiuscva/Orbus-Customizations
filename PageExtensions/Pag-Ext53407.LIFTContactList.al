pageextension 53407 "ORB LIFT Contact List" extends "Contact List"
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
