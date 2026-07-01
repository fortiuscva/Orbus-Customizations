pageextension 52652 "ORB Case List WSG" extends "Case List WSG"
{
    layout
    {
        addlast(General)
        {
            field("ORB Shipment Date"; Rec."Shipment Date")
            {
                Caption = 'Shipment Date';
                ApplicationArea = All;
                ToolTip = 'Shipment Date';
            }
        }
        addafter("Must Arrive Date")
        {
            field("ORB Magento Result ID"; Rec."ORB Magento Result ID")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Magento Result ID field.', Comment = '%';
            }
        }
    }
}