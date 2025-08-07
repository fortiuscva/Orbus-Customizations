codeunit 53416 "ORB LIFT Events & Subscribers"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse. Jnl.-Register Line", OnBeforeInsertWhseEntry, '', false, false)]
    local procedure "Whse. Jnl.-Register Line_OnBeforeInsertWhseEntry"(var WarehouseEntry: Record "Warehouse Entry"; var WarehouseJournalLine: Record "Warehouse Journal Line")
    begin
        WarehouseEntry."Unit of Measure Code" := WarehouseJournalLine."Unit of Measure Code";
        WarehouseEntry.Quantity := WarehouseJournalLine."Quantity" / WarehouseJournalLine."Qty. per Unit of Measure";
        WarehouseEntry."Qty. per Unit of Measure" := WarehouseJournalLine."Qty. per Unit of Measure";
    end;


}
