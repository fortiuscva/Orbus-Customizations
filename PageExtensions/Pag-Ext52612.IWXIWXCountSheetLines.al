pageextension 52612 "ORB IWX IWX Count Sheet Lines" extends "IWX Count Sheet Lines"
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
            field("ORB Quantity on Pick"; Rec."ORB Quantity on Pick")
            {
                ApplicationArea = all;
                ToolTip = 'Quantity on Pick';
                Editable = false;
            }
        }
    }
}