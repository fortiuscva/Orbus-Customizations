codeunit 53416 "ORB LIFT Events & Subscribers"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"WMS Management", OnInitWhseJnlLineOnAfterGetQuantity, '', false, false)]
    local procedure "WMS Management_OnInitWhseJnlLineOnAfterGetQuantity"(ItemJnlLine: Record "Item Journal Line"; var WhseJnlLine: Record "Warehouse Journal Line"; Location: Record Location)
    begin
        WhseJnlLine.Quantity := Round(ItemJnlLine."Quantity (Base)" / ItemJnlLine."Qty. per Unit of Measure", UOMMgt.QtyRndPrecision());
        WhseJnlLine."Unit of Measure Code" := ItemJnlLine."Unit of Measure Code";
        WhseJnlLine."Qty. per Unit of Measure" := ItemJnlLine."Qty. per Unit of Measure";
    end;

    var
        UOMMgt: Codeunit "Unit of Measure Management";

}
