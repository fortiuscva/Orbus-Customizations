codeunit 52618 "ORB Auto SO Release & Pick"
{

    TableNo = "Job Queue Entry";
    trigger OnRun()
    begin
        AutoReleaseAndPick();
    end;

    procedure AutoReleaseAndPick()
    var
        SalesHeaderRecLcl: Record "Sales Header";
        ORBCreateInventoryPick: Codeunit "ORB Create Inventory Pick";
    begin
        SalesHeaderRecLcl.Reset();
        SalesHeaderRecLcl.SetRange("Order Status", SalesHeaderRecLcl."Order Status"::"ReadyforPick/Release");
        IF SalesHeaderRecLcl.FindSet() then
            repeat
                if not ORBCreateInventoryPick.Run(SalesHeaderRecLcl) then;
            Until SalesHeaderRecLcl.Next() = 0;
    end;
}
