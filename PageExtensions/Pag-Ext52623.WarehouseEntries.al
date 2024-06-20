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
        }
    }
}
