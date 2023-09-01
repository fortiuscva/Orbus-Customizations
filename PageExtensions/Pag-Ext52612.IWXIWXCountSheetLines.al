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
        }
    }


}