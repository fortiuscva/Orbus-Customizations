codeunit 53416 "ORB LIFT Events & Subscribers"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse. Jnl.-Register Line", OnBeforeInsertWhseEntryProcedure, '', false, false)]
    local procedure "Whse. Jnl.-Register Line_OnBeforeInsertWhseEntryProcedure"(var WarehouseEntry: Record "Warehouse Entry"; WarehouseJournalLine: Record "Warehouse Journal Line"; var IsHandled: Boolean)
    begin
        WarehouseEntry."Unit of Measure Code" := WarehouseJournalLine."Unit of Measure Code";
        WarehouseEntry.Quantity := WarehouseJournalLine."Quantity" / WarehouseJournalLine."Qty. per Unit of Measure";
        WarehouseEntry."Qty. per Unit of Measure" := WarehouseJournalLine."Qty. per Unit of Measure";
    end;


}
