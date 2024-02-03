pageextension 52620 "ORB Released Production Orders" extends "Released Production Orders"
{
    actions
    {
        addafter("Create Warehouse Pick")
        {
            action("ORB Export INBIN ProdComponents")
            {
                ApplicationArea = all;
                Image = Export;
                Promoted = true;
                Caption = 'Export INBIN ProdComponents';
                PromotedCategory = Process;

                trigger OnAction()
                var
                    ExportINBINComponentsCULcl: Codeunit "Export INBIN ProdComponents";
                begin
                    ExportINBINComponentsCULcl.ExportINBINComponents();
                end;
            }
        }
    }
}
