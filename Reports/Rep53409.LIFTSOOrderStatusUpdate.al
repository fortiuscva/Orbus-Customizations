report 53409 "LIFT SO Order Status Update"
{
    Caption = 'LIFT SO Order Status Update';
    ProcessingOnly = true;
    ApplicationArea = all;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(SalesHeader; "Sales Header")
        {
            RequestFilterFields = "Document Type", "No.";

            trigger OnAfterGetRecord()
            begin
                if not Codeunit.Run(Codeunit::"ORB LIFT Auto SO Release&Pick", SalesHeader) then;
            end;

            trigger OnPreDataItem()
            begin
                SetFilter("Order Status", '<%1', SalesHeader."Order Status"::"ReadyforPick/Release");
                SetFilter("Shipment Date", '>=%1', Today());
            end;
        }
    }
}
