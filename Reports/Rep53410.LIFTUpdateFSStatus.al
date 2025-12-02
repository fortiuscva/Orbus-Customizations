report 53410 "ORB LIFT Update FS Status"
{
    ApplicationArea = All;
    Caption = 'LIFT Update FS Status';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    dataset
    {
        dataitem("Production Order"; "Production Order")
        {

            trigger OnAfterGetRecord()
            begin
                if not codeunit.Run(Codeunit::"ORB Update Fast Sol. SO Status", "Production Order") then;
            end;

            trigger OnPreDataItem()
            begin
                SetRange("Source Type", "Source Type"::"Sales Header");
                SetRange("ORB Fast Solutions Status Sent", false);
                SetRange("ORB LIFT Sales Order", true);
            end;
        }
    }
}
