pageextension 53402 "ORB Item Variant Card" extends "Item Variant Card"
{
    layout
    {
        addlast(ItemVariant)
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
