pageextension 53409 "ORB LIFT Bin Contents" extends "Bin Contents"
{
    layout
    {
        addlast(Control37)
        {

            field("ORB Bin Location Id"; Rec."ORB Bin Location Id")
            {
                ApplicationArea = all;
            }
            field("ORB Location Id"; Rec."ORB Location Id")
            {
                ApplicationArea = all;
            }
            field("ORB Item Material Id"; Rec."ORB Item Material Id")
            {
                ApplicationArea = all;
            }
            field("ORB Item Storage Type Id"; Rec."ORB Item Storage Type Id")
            {
                ApplicationArea = all;
            }
            field("ORB Item Var. Storage Type Id"; Rec."ORB Item Var. Storage Type Id")
            {
                ApplicationArea = all;
            }
            field("ORB Qty Conversion"; Rec."ORB Qty Conversion")
            {
                ApplicationArea = all;
            }
        }
    }
}
