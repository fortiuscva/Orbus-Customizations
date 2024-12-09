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
                    WarehouseActivityHeader: Record "Warehouse Activity Header";
                begin
                    FunctionsCULcl.AutoCreatePick(rec);
                    WarehouseActivityHeader.SetRange(Type, WarehouseActivityHeader.Type::Pick);
                    WarehouseActivityHeader.SetRange("No.", Rec."No.");
                    FunctionsCULcl.PrintPickHeader(WarehouseActivityHeader);
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
