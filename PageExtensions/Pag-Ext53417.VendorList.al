pageextension 53417 "ORB Vendor List" extends "Vendor List"
{
    layout
    {
        addafter("Search Name")
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