page 53439 "ORB Lift Item Details"
{
    ApplicationArea = All;
    Caption = 'Lift Item Details';
    PageType = Card;
    SourceTable = Item;
    InsertAllowed = false;
    DeleteAllowed = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("ORB Has Active Variants"; Rec."ORB Has Active Variants")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Has Active Variants field.', Comment = '%';
                }

                group(Sellable)
                {
                    Caption = 'Sellable';
                    field("ORB Ship From Warehouse"; Rec."ORB Ship From Warehouse")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Ship From Warehouse field.', Comment = '%';
                    }
                    field("ORB Warehouse Location Id"; Rec."ORB Warehouse Location Id")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Warehouse Location Id field.', Comment = '%';
                    }
                    field("ORB Product Line Dimension Id"; Rec."ORB Product Line Dimension Id")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Product Line Dimension Id field.', Comment = '%';
                    }
                    field("ORB Parent Item No."; Rec."ORB Parent Item No.")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Parent Item No. field.', Comment = '%';
                    }
                }
                group(Material)
                {
                    Caption = 'Material';
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
                group(CeligoSynchronization)
                {
                    Caption = 'Celigo Synchronization';
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
    }
}
