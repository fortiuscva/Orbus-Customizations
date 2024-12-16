report 52615 "ORB Updt Inv Your Refrence"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    Caption = 'Update Invoice Your Reference';
    Permissions = tabledata "Sales Invoice Header" = M;


    dataset
    {
        dataitem("SalesInvoiceHeader"; "Sales Invoice Header")
        {
            DataItemTableView = where("Your Reference" = Filter(<> ''));

            trigger OnAfterGetRecord()

            begin
                SalesInvoiceHeader."ORB Your Reference(CS)" := SalesInvoiceHeader."Your Reference";
                SalesInvoiceHeader."Your Reference" := '';
                SalesInvoiceHeader.Modify;
            end;
        }
    }

}