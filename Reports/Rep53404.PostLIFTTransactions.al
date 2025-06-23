report 53404 "ORB Post LIFT Transactions"
{
    ApplicationArea = All;
    Caption = 'Post LIFT Transactions';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    dataset
    {
        dataitem(SalesHeader; "Sales Header")
        {
            DataItemTableView = where("Document Type" = const(Order));
            trigger OnPreDataItem()
            begin
                SalesHeader.SetRange("ORB Lift Order", true);
                SalesHeader.SetFilter("Document Date", '%1..', Today);
            end;

            trigger OnAfterGetRecord()
            var
                OrbusSingleInstanceCUGbl: Codeunit "ORB Orbus Single Instance";
            begin
                OrbusSingleInstanceCUGbl.SetStopOnError(StopOnError);
                if StopOnError then
                    Codeunit.Run(Codeunit::"ORB LIFT Post Inventory Trans.", SalesHeader)
                else
                    if not Codeunit.Run(Codeunit::"ORB LIFT Post Inventory Trans.", SalesHeader) then;

                OrbusSingleInstanceCUGbl.SetStopOnError(false);
            end;

        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';

                    field("Stop on Error"; StopOnError)
                    {
                        ApplicationArea = all;
                        Caption = 'Stop on Error';
                    }
                }
            }
        }
    }
    var
        StopOnError: Boolean;
}
