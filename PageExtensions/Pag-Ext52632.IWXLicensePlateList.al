pageextension 52632 "ORB IWX License Plate List" extends "IWX License Plate List"
{
    layout
    {
        addlast(Group)
        {
            field("ORB Payment Type"; Rec."ORB Payment Type")
            {
                ApplicationArea = all;
            }
            field("ORB Posted Sales Inv. Number"; Rec."ORB Posted Sales Inv. Number")
            {
                ApplicationArea = all;
            }
        }
    }
}
