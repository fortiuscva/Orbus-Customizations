pageextension 52642 "ORB Warehouse Shipment List" extends "Warehouse Shipment List"
{
    actions
    {
        addafter("&Shipment")
        {
            action("ORB Auto Creation Pick & Print")
            {
                Caption = 'Auto Creation Pick & Print';
                ApplicationArea = all;
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    FunctionsCULcl: Codeunit "ORB Functions";
                begin
                    FunctionsCULcl.AutoCreatePick(rec);
                end;
            }

        }
    }
}
