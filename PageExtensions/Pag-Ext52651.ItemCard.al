pageextension 52651 "ORB Item Card" extends "Item Card"
{
    layout
    {
        addafter(Height)
        {
            field("ORB Master Qty Count"; Rec."ORB Master Qty Count")
            {
                Caption = 'Master Carton QTY';
                ApplicationArea = All;
                Tooltip = 'Quantity in the Master Carton';
            }
            field("ORB Bagging Quantity"; Rec."ORB Bagging Quantity")
            {
                Caption = 'Bag QTY';
                ApplicationArea = All;
                ToolTip = 'Quantity packed in a bag';
            }
        }
    }
}