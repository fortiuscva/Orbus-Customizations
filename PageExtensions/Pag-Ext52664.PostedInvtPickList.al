pageextension 52664 "ORB Posted Invt. Pick List" extends "Posted Invt. Pick List"
{
    layout
    {
        addafter("Posting Date")
        {
            field("ORB Sales Order No."; Rec."ORB Sales Order No.")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the value of the Sales Order No. field.', Comment = '%';
                trigger OnDrillDown()
                var
                    SalesHeaderLcl: Record "Sales Header";
                begin
                    SalesHeaderLcl.Reset();
                    SalesHeaderLcl.SetRange("Document Type", SalesHeaderLcl."Document Type"::Order);
                    SalesHeaderLcl.SetRange("No.", Rec."ORB Sales Order No.");
                    Page.RunModal(Page::"Sales Order", SalesHeaderLcl);
                end;
            }
        }
    }
    actions
    {
        addafter("P&ick")
        {
            action("ORB &Print")
            {
                ApplicationArea = Warehouse;
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                ToolTip = 'Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.';

                trigger OnAction()
                var
                    PostedInvtPickHeaderLcl: Record "Posted Invt. Pick Header";
                begin
                    PostedInvtPickHeaderLcl.Reset();
                    PostedInvtPickHeaderLcl.SetRange("No.", Rec."No.");
                    if PostedInvtPickHeaderLcl.FindFirst() then
                        Report.RunModal(Report::"ORB Posted Invt. Pick Report", true, false, PostedInvtPickHeaderLcl);
                end;
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields("ORB Sales Order No.");
    end;
}
