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
            field("ORB Material Name"; Rec."ORB Material Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Material Name field.', Comment = '%';
            }
            field("ORB Stroage Type Id"; Rec."ORB Stroage Type Id")
            {
                Caption = 'Storage Type Id';
                ApplicationArea = All;
            }
            field("ORB Storage Type Name"; Rec."ORB Storage Type Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Storage Type Name field.', Comment = '%';
            }
        }
    }
}