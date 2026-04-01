pageextension 53400 "ORB LIFT Location Card" extends "Location Card"
{
    layout
    {
        addlast(General)
        {
            field("ORB Location Id"; Rec."ORB Location Id")
            {
                ApplicationArea = all;
            }
            field("ORB Pick Report Printer"; Rec."ORB Pick Report Printer")
            {
                ApplicationArea = all;
            }
        }
    }
}
