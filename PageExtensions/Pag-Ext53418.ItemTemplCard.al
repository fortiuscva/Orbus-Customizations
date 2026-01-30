pageextension 53418 "ORB Item Templ. Card" extends "Item Templ. Card"
{
    layout
    {
        addlast(General)
        {
            field("ORB Family Dimension"; Rec."ORB Family Dimension")
            {
                ApplicationArea = all;
            }
            field("ORB Department Dimension"; Rec."ORB Department Dimension")
            {
                ApplicationArea = all;
            }
        }

    }

}