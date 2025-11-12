report 53410 "ORB LIFT Update FS Status"
{
    ApplicationArea = All;
    Caption = 'LIFT Update FS Status';
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(ProductionOrder; "Production Order")
        {

            trigger OnAfterGetRecord()
            begin
                if not codeunit.Run(Codeunit::"ORB Update Fast Sol. SO Status", ProductionOrder) then;
            end;

            trigger OnPreDataItem()
            begin
                SetRange("Source Type", "Source Type"::"Sales Header");
                SetRange("ORB Fast Solutions Sent", false);
            end;
        }
    }
}
