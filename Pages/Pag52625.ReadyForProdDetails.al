page 52625 "ORB Ready For Prod. Details"
{
    ApplicationArea = All;
    Caption = 'Ready For Production Details';
    PageType = List;
    SourceTable = "Sales Line";
    SourceTableView = where("Document Type" = const(Order));
    UsageCategory = Lists;
    Editable = false;
    InsertAllowed = false;
    DeleteAllowed = false;

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
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ToolTip = 'Specifies the number of the customer.';
                }
                field(CustomerName; SalesHeadRecGbl."Sell-to Customer Name")
                {
                    ToolTip = 'Specifies the name of the customer.';
                    Editable = false;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the inventory location from which the items sold should be picked and where the inventory decrease is registered.';
                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ToolTip = 'Specifies the value of the Assigned User ID field.', Comment = '%';
                }
                field("ORB Order Status"; Rec."ORB Order Status")
                {
                    ApplicationArea = all;
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ToolTip = 'Specifies when items on the document are shipped or were shipped. A shipment date is usually calculated from a requested delivery date plus lead time.';
                }

                field("Job ID"; SalesLineAddFieldsRecGbl."Job ID")
                {
                    Caption = 'Job ID';
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Job URL"; SalesLineAddFieldsRecGbl."Job URL")
                {
                    Caption = 'Job URL';
                    ApplicationArea = all;
                    Editable = false;
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
        if not SalesLineAddFieldsRecGbl.Get(rec."Document Type", rec."Document No.", Rec."Line No.") then
            SalesLineAddFieldsRecGbl.Init();
        if not SalesHeadRecGbl.get(Rec."Document Type", Rec."Document No.") then
            SalesHeadRecGbl.init();
    end;

    var
        SalesLineAddFieldsRecGbl: Record "ORB Sales Line Add. Fields";
        SalesHeadRecGbl: Record "Sales Header";
}
