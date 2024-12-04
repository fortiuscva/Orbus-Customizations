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
    }
}
