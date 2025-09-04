pageextension 53401 "ORB Item Variants" extends "Item Variants"
{
    layout
    {
        addlast(Control1)
        {
            field("ORB Material Id"; Rec."ORB Material Id")
            {
                ApplicationArea = all;
            }
            field("ORB Storage Type Id"; Rec."ORB Storage Type Id")
            {
                ApplicationArea = all;
            }
        }
    }
}
