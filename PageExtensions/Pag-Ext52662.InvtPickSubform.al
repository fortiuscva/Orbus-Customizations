pageextension 52662 "ORB Invt. Pick Subform" extends "Invt. Pick Subform"
{
    layout
    {
        addbefore("Bin Code")
        {
            field("ORB Zone Code"; Rec."Zone Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the zone code where the bin on this line is located.';
            }
        }
    }
}
