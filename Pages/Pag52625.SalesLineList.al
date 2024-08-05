page 52625 "ORB Sales Line List"
{
    ApplicationArea = All;
    Caption = 'Sales Line List';
    PageType = List;
    SourceTable = "Sales Line";
    SourceTableView = where("Document Type" = const(Order));
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = all;
                }
                field("ORB Order Status"; Rec."ORB Order Status")
                {
                    ApplicationArea = all;
                }
                field("Job ID"; SalesLineAddFieldsRecGbl."Job ID")
                {
                    Caption = 'Job ID';
                    ApplicationArea = all;
                }
                field("Job URL"; SalesLineAddFieldsRecGbl."Job URL")
                {
                    Caption = 'Job URL';
                    ApplicationArea = all;
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        rec.SetRange("ORB Order Status", rec."ORB Order Status"::ReadyForProduction);
    end;

    trigger OnAfterGetRecord()
    begin
        if SalesLineAddFieldsRecGbl.Get(rec."Document Type", rec."Document No.", Rec."Line No.") then;
    end;

    var
        SalesLineAddFieldsRecGbl: Record "ORB Sales Line Add. Fields";
}
