pageextension 53412 "ORB LIFT Location List" extends "Location List"
{
    layout
    {
        addlast(Control1)
        {
            field("ORB Location Id"; Rec."ORB Location Id")
            {
                ApplicationArea = all;
            }
            field("ORB Warehouse Location Id"; Rec."ORB Warehouse Location Id")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Warehouse Location Id field.', Comment = '%';
            }
        }
    }
}
