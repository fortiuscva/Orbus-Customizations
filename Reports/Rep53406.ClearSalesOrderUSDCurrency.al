report 53406 "Clear Sales Order USD Currency"
{
    ApplicationArea = All;
    Caption = 'Clear Sales Order USD';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = where("Currency Code" = const('USD'));

            trigger OnAfterGetRecord()
            var
                SalesLineRecLcl: Record "Sales Line";
                NoDeleteBoolean: Boolean;
            begin
                NoDeleteBoolean := false;
                SalesLineRecLcl.Reset();
                SalesLineRecLcl.Setrange("Document No.", "Sales Header"."No.");
                If SalesLineRecLcl.Findset then
                    repeat
                        if (SalesLineRecLcl.Quantity <> SalesLineRecLcl."Outstanding Quantity") then
                            NoDeleteBoolean := true;
                    until (SalesLineRecLcl.Next = 0) or (NoDeleteBoolean = true);
                if not NoDeleteBoolean then begin
                    SalesLineRecLcl.Reset();
                    SalesLineRecLcl.Setrange("Document No.", "Sales Header"."No.");
                    if SalesLineRecLcl.FindSet() then begin
                        SalesLineRecLcl.ModifyAll("Currency Code", '');
                        "Sales Header"."Currency Code" := '';
                        "Sales Header".Modify();
                    end;
                end;
            end;
        }
    }

}