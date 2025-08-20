pageextension 52665 "ORB Posted Invt Pick" extends "Posted Invt. Pick"
{
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
}
