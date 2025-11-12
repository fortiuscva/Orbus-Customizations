pageextension 53406 "ORB LIFT Ship-to Address" extends "Ship-to Address"
{
    layout
    {
        addlast(General)
        {
            field("ORB Active Status"; Rec."ORB Active Status")
            {
                ApplicationArea = all;
            }
        }
    }
}
