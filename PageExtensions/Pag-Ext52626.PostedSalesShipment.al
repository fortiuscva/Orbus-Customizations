pageextension 52626 "ORB Posted Sales Shipment" extends "Posted Sales Shipment"
{
    actions
    {
        addlast("&Shipment")
        {
            action("ORB Sales Shpt Header Addl Fields")
            {
                Caption = 'Additional Fields';
                Image = RelatedInformation;
                ApplicationArea = all;
                RunObject = page "ORB Sales Ship Hdr Add. Fields";
                RunPageLink = "No." = field("No.");
            }
        }
    }
}
