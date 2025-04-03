pageextension 53651 "ORB Item Card" extends "Item Card"
{
    layout
    {
        addafter(Height)
        {
            field("ORB Master Qty Count"; Rec."ORB Master Qty Count")
            {
                Caption = 'Master Quantity/Carton';
                ApplicationArea = All;
                Tooltip = 'Quantity in the Master Carton';
            }
            field("ORB Bagging Quantity"; Rec."ORB Bagging Quantity")
            {
                Caption = 'Bagging Quantity/per bag';
                ApplicationArea = All;
                ToolTip = 'Quantity packed in a bag';
            }
        }
    }
}