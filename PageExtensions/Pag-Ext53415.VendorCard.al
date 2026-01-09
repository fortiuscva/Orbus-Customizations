pageextension 53415 "ORB Vendor Card" extends "Vendor Card"
{
    layout
    {
        addafter("Last Date Modified")
        {
            field("ORB COI Expiration Date"; Rec."ORB COI Expiration Date")
            {
                Caption = 'COI Expiration Date';
                ApplicationArea = All;
                ToolTip = 'Specifies Vendor Certificate Expiration for Insurance';
            }
        }
    }
}