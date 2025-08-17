codeunit 53416 "ORB LIFT Events & Subscribers"
{

    //These subscribers are required to post warehouse entries in the unit of measure as entered on item journal lines.. Start
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"WMS Management", OnInitWhseJnlLineCopyFromItemJnlLine, '', false, false)]
    local procedure "WMS Management_OnInitWhseJnlLineCopyFromItemJnlLine"(var WarehouseJournalLine: Record "Warehouse Journal Line"; ItemJournalLine: Record "Item Journal Line")
    begin
        WarehouseJournalLine.Quantity := Round(ItemJournalLine."Quantity (Base)" / ItemJournalLine."Qty. per Unit of Measure", UOMMgt.QtyRndPrecision());
        WarehouseJournalLine."Unit of Measure Code" := ItemJournalLine."Unit of Measure Code";
        WarehouseJournalLine."Qty. per Unit of Measure" := ItemJournalLine."Qty. per Unit of Measure";
        WarehouseJournalLine."Qty. (Absolute)" := Abs(WarehouseJournalLine.Quantity);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse. Jnl.-Register Line", OnInitWhseEntryCopyFromWhseJnlLine, '', false, false)]
    local procedure "Whse. Jnl.-Register Line_OnInitWhseEntryCopyFromWhseJnlLine"(var WarehouseEntry: Record "Warehouse Entry"; var WarehouseJournalLine: Record "Warehouse Journal Line"; OnMovement: Boolean; Sign: Integer; Location: Record Location; BinCode: Code[20]; var IsHandled: Boolean)
    begin
        WarehouseEntry.Quantity := WarehouseJournalLine."Qty. (Absolute)" * Sign;
        WarehouseEntry."Unit of Measure Code" := WarehouseJournalLine."Unit of Measure Code";
        WarehouseEntry."Qty. per Unit of Measure" := WarehouseJournalLine."Qty. per Unit of Measure";
    end;
    //These subscribers are required to post warehouse entries in the unit of measure as entered on item journal lines.. End



    var
        UOMMgt: Codeunit "Unit of Measure Management";

}
