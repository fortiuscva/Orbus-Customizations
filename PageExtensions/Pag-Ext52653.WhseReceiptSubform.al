pageextension 52653 "ORB Whse. Receipt Subform" extends "Whse. Receipt Subform"
{
    layout
    {
        addafter("Variant Code")
        {
            field("ORB Unit Cost"; Rec."ORB Unit Cost")
            {
                Caption = 'Unit Cost';
                ApplicationArea = All;
                ToolTip = 'Item Unit Cost';
            }
        }
    }
}