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
    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields("ORB Sales Order No.");
    end;
}
