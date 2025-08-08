codeunit 53416 "ORB LIFT Events & Subscribers"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"WMS Management", OnInitWhseJnlLineCopyFromItemJnlLine, '', false, false)]
    local procedure "WMS Management_OnInitWhseJnlLineCopyFromItemJnlLine"(var WarehouseJournalLine: Record "Warehouse Journal Line"; ItemJournalLine: Record "Item Journal Line")
    begin
        WarehouseJournalLine.Quantity := Round(ItemJournalLine."Quantity (Base)" / ItemJournalLine."Qty. per Unit of Measure", UOMMgt.QtyRndPrecision());
        WarehouseJournalLine."Unit of Measure Code" := ItemJournalLine."Unit of Measure Code";
        WarehouseJournalLine."Qty. per Unit of Measure" := ItemJournalLine."Qty. per Unit of Measure";
    end;


    var
        UOMMgt: Codeunit "Unit of Measure Management";

}
