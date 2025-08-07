report 53407 "ORB Post LIFT InvPick Trans."
{
    ApplicationArea = All;
    Caption = 'Post LIFT Inventory Pick Transactions';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    dataset
    {
        dataitem(SalesHeader; "Sales Header")
        {
            DataItemTableView = where("Document Type" = const(Order), "ORB Lift Order" = const(true));
            trigger OnPreDataItem()
            begin
                if not GuiAllowed then
                    SalesHeader.SetFilter("Document Date", '>=%1', Today);
            end;

            trigger OnAfterGetRecord()
            var
                OrbusSingleInstanceCUGbl: Codeunit "ORB Orbus Single Instance";
            begin
                OrbusSingleInstanceCUGbl.SetStopOnError(StopOnError);
                if StopOnError then
                    Codeunit.Run(Codeunit::"ORB LIFT Post InvPick Trans.", SalesHeader)
                else
                    if not Codeunit.Run(Codeunit::"ORB LIFT Post InvPick Trans.", SalesHeader) then;

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
