
pageextension 52629 "ORB Sales Lines" extends "Sales Lines"
{
    layout
    {
        addafter("Sell-to Customer No.")
        {
            field("ORB State"; Rec."ORB Ship-to State_fl")
            {
                Caption = 'Ship-To State';
                Editable = false;
                ApplicationArea = All;
                ToolTip = 'Specifies Ship to State';
            }
        }
    }

}