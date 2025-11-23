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
            field("ORB Parent Item No."; Rec."ORB Parent Item No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Parent Item No. field.', Comment = '%';
            }
            field("ORB Parent Product Id"; Rec."ORB Parent Product Id")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Parent Product ID field.', Comment = '%';
            }
            field("ORB Product Id"; Rec."ORB Product Id")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Product ID field.', Comment = '%';
            }
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
            field("ORB Do Not Integrate"; Rec."ORB Do Not Integrate")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Do Not Integrate field.', Comment = '%';
            }
            field("ORB Has Active Variants"; Rec."ORB Has Active Variants")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Has Active Variants field.', Comment = '%';
            }
        }
    }
}