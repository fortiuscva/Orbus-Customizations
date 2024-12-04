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
                    SingleInstanceCU: Codeunit "ORB Orbus Single Instance";
                    FirstActivity: Code[20];
                    LastActivity: Code[20];
                begin
                    FunctionsCULcl.AutoCreatePick(rec);
                    Commit();
                    SingleInstanceCU.GetWarehouseActivity(FirstActivity, LastActivity);
                    WarehouseActivityHeader.SetRange(Type, WarehouseActivityHeader.Type::Pick);
                    WarehouseActivityHeader.SetRange("No.", FirstActivity, LastActivity);
                    if WarehouseActivityHeader.FindSet() then;
                    FunctionsCULcl.PrintPickHeader(WarehouseActivityHeader);
                    SingleInstanceCU.Reset();
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
