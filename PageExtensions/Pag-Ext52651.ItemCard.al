pageextension 52651 "ORB Item Card" extends "Item Card"
{
    layout
    {
        addafter(Height)
        {
            field("ORB Master Qty. Count"; Rec."ORB Master Qty. Count")
            {
                Caption = 'Master Carton QTY.';
                ApplicationArea = All;
                Tooltip = 'Quantity in the Master Carton';
            }
            field("ORB Bagging Quantity"; Rec."ORB Bagging Quantity")
            {
                Caption = 'Bag QTY.';
                ApplicationArea = All;
                ToolTip = 'Quantity packed in a bag';
            }
        }
        //LIFT
        addlast(Item)
        {
            field("ORB Material Id"; Rec."ORB Material Id")
            {
                Caption = 'Material Id';
                ApplicationArea = All;
            }
            field("ORB Stroage Type Id"; Rec."ORB Stroage Type Id")
            {
                Caption = 'Stroage Type Id';
                ApplicationArea = All;
            }
        }
    }
}