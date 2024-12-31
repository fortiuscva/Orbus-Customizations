pageextension 52623 "ORB Warehouse Entries" extends "Warehouse Entries"
{
    layout
    {
        addafter("Item No.")
        {
            field("ORB Reference No."; Rec."Reference No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Reference No. field.', Comment = '%';
            }
            field("ORB Reference Document"; Rec."Reference Document")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Reference Document field.', Comment = '%';
            }

            field("ORB LIFT Inv. Transaction ID"; Rec."ORB LIFT Inv. Transaction ID")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the LIFT Inventory Transaction ID field.', Comment = '%';
                Editable = false;
            }
            field("ORB LIFT Order Line ID"; Rec."ORB LIFT Order Line ID")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the LIFT Order Line ID field.', Comment = '%';
            }
        }
    }
}
