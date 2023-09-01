pageextension 52611 "IWX Inventory Count Subform" extends "IWX Inventory Count Subform"
{
    layout
    {
        addafter("Bin Code")
        {
            field("ORB Zone Code"; rec."ORB Zone Code")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies Zone for location';
            }
        }
    }


}