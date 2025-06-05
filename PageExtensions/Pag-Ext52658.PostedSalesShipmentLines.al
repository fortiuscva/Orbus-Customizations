pageextension 52658 "Posted Sales Shipment Lines" extends "Posted Sales Shipment Lines"
{
    layout
    {
        addafter("Unit of Measure Code")
        {
            field("ORB ProductLine Dim"; Rec."ORB ProductLine Dim")
            {
                ApplicationArea = All;
            }
        }
    }
}
