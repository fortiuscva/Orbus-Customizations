report 53409 "ORB LIFT Auto Create Pick"
{
    Caption = 'LIFT Auto Create Pick & Update Order Status';
    ProcessingOnly = true;
    ApplicationArea = all;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(SalesHeader; "Sales Header")
        {
            RequestFilterFields = "Document Type", "No.";

            trigger OnPreDataItem()
            begin
                SetFilter("Order Status", '<=%1', SalesHeader."Order Status"::"ReadyforPick/Release");
                SetFilter("Shipment Date", '>=%1', Today());
                SetRange("ORB Lift Order", true);
            end;

            trigger OnAfterGetRecord()
            var
                SalesLineRecLcl: Record "Sales Line";
            begin
                SalesLineRecLcl.Reset();
                SalesLineRecLcl.SetRange("Document Type", SalesHeader."Document Type");
                SalesLineRecLcl.SetRange("Document No.", SalesHeader."No.");
                SalesLineRecLcl.SetRange(Type, SalesLineRecLcl.Type::Item);
                SalesLineRecLcl.SetFilter("Outstanding Quantity", '<>%1', 0);
                if not SalesLineRecLcl.IsEmpty() then
                    if not Codeunit.Run(Codeunit::"ORB LIFT Auto SO Release&Pick", SalesHeader) then;

            end;

        }
    }
}
