page 52631 "ORB PRD Sales Return Order API"
{
    APIGroup = 'orbus';
    APIPublisher = 'orbus';
    APIVersion = 'v1.0';

    ApplicationArea = All;
    Caption = 'PRD Sales Return Order API';
    DelayedInsert = true;

    EntityName = 'PRDSalesReturnOrder';
    EntityCaption = ' Sales Return Order';
    EntitySetName = 'SalesReturnOrders';
    EntitySetCaption = 'Sales Return Orders';
    PageType = API;

    SourceTable = "Sales Header";
    SourceTableView = where("Document Type" = const("Return Order"));

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(No; Rec."No.")
                { }
                field(Sell_to_Customer_Name; Rec."Sell-to Customer Name")
                { }
                field(Sell_to_Customer_No; Rec."Sell-to Customer No.")
                { }
                field(Sell_to_EMail; Rec."Sell-to E-Mail")
                { }
                field(Shipment_Date; Rec."Shipment Date")
                { }
                field(Shipping_Agent_Code; Rec."Shipping Agent Code")
                { }
                field(Shipping_Agent_Service_Code; Rec."Shipping Agent Service Code")
                { }
                field(Location_Code; Rec."Location Code")
                { }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                { }
                field(Assigned_User_ID; Rec."Assigned User ID")
                { }
                field(External_Document_No; Rec."External Document No.")
                { }
            }
        }
    }
}