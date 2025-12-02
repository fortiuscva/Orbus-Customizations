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
            group("ORB Lift")
            {
                Caption = 'Lift';
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
                field("ORB Stroage Type Id"; Rec."ORB Stroage Type Id")
                {
                    Caption = 'Storage Type Id';
                    ApplicationArea = All;
                }
                field("ORB Do Not Integrate"; Rec."ORB Do Not Integrate")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Do Not Integrate field.', Comment = '%';
                }
                field("ORB Do Not Integrate (Sell)"; Rec."ORB Do Not Integrate (Sell)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Do Not Integrate (Sellable) field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        addlast(Navigation_Item)
        {
            action("ORB Lift Details")
            {
                ApplicationArea = All;
                Caption = 'Lift Details';
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Category4;
                RunObject = page "ORB Lift Item Details";
                RunPageLink = "No." = field("No.");
            }
        }

    }

}