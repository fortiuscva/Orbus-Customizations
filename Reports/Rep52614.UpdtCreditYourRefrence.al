report 52614 "ORB Updt Credit Your Refrence"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    Caption = 'Update Credit Your Reference';
    Permissions = tabledata "Sales Cr.Memo Header" = M;


    dataset
    {
        dataitem("SalesCrMemoHeader"; "Sales Cr.Memo Header")
        {
            DataItemTableView = where("Your Reference" = Filter(<> ''));

            trigger OnAfterGetRecord()

            begin
                SalesCrMemoHeader."ORB Your Reference(CS)" := SalesCrMemoHeader."Your Reference";
                SalesCrMemoHeader."Your Reference" := '';
                SalesCrMemoHeader.Modify;
            end;
        }
    }

}