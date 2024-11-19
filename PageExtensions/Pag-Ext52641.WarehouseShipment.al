pageextension 52641 "ORB Warehouse Shipment" extends "Warehouse Shipment"
{
    actions
    {
        addafter("Create Pick")
        {
            action("ORB Auto Creation Pick & Print")
            {
                Caption = 'Auto Creation Pick & Print';
                ApplicationArea = all;
                Image = Process;

                trigger OnAction()
                var
                    FunctionsCULcl: Codeunit "ORB Functions";
                begin
                    FunctionsCULcl.AutoCreatePick(rec);
                    FunctionsCULcl.RegisterPick(Rec);
                end;
            }

        }
        addafter("Create Pick_Promoted")
        {
            actionref("Auto Creation Pick_Promoted"; "ORB Auto Creation Pick & Print")
            {
            }
        }
    }
}
