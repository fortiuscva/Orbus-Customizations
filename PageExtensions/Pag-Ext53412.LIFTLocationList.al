pageextension 53412 "ORB LIFT Location List" extends "Location List"
{
    layout
    {
        addlast(Control1)
        {
            field("ORB Location Id"; Rec."ORB Location Id")
            {
                ApplicationArea = all;
            }
        }
    }
}
