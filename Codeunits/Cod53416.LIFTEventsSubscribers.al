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

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Activity-Register", OnBeforeWhseJnlRegisterLine, '', false, false)]
    local procedure "Whse.-Activity-Register_OnBeforeWhseJnlRegisterLine"(var WarehouseJournalLine: Record "Warehouse Journal Line"; WarehouseActivityLine: Record "Warehouse Activity Line")
    begin
        WarehouseJournalLine.Quantity := WarehouseActivityLine."Qty. to Handle";
        WarehouseJournalLine."Qty. (Absolute)" := WarehouseJournalLine.Quantity;
        WarehouseJournalLine."Unit of Measure Code" := WarehouseActivityLine."Unit of Measure Code";
        WarehouseJournalLine."Qty. per Unit of Measure" := WarehouseActivityLine."Qty. per Unit of Measure";
        WarehouseJournalLine."Qty. Rounding Precision" := WarehouseActivityLine."Qty. Rounding Precision";
        WarehouseJournalLine."Qty. Rounding Precision (Base)" := WarehouseActivityLine."Qty. Rounding Precision (Base)";
    end;
    //These subscribers are required to post warehouse entries in the unit of measure as entered on item journal lines.. End

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Activity-Post", OnAfterCreateWhseJnlLine, '', false, false)]
    local procedure "Whse.-Activity-Post_OnAfterCreateWhseJnlLine"(var WarehouseJournalLine: Record "Warehouse Journal Line"; WarehouseActivityLine: Record "Warehouse Activity Line"; SourceCodeSetup: Record "Source Code Setup")
    begin
        if WarehouseActivityLine."Activity Type" = WarehouseActivityLine."Activity Type"::"Invt. Pick" then begin
            if WarehouseActivityLine."Action Type" = WarehouseActivityLine."Action Type"::Take then begin
                WarehouseJournalLine.Quantity := WarehouseActivityLine."Qty. to Handle";
            end else begin
                WarehouseJournalLine.Quantity := -WarehouseActivityLine."Qty. to Handle";
            end;
            WarehouseJournalLine."Qty. (Absolute)" := WarehouseActivityLine."Qty. to Handle";
            WarehouseJournalLine."Unit of Measure Code" := WarehouseActivityLine."Unit of Measure Code";
            WarehouseJournalLine."Qty. per Unit of Measure" := WarehouseActivityLine."Qty. per Unit of Measure";
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Bin Content", OnBeforeCalcQtyAvailToTake, '', false, false)]
    local procedure "Bin Content_OnBeforeCalcQtyAvailToTake"(var BinContent: Record "Bin Content"; ExcludeQtyBase: Decimal; var QtyAvailToTake: Decimal; var IsHandled: Boolean)
    begin
        if BinContent.ReadIsolation() <> IsolationLevel::UpdLock then
            BinContent.ReadIsolation(IsolationLevel::ReadCommitted);

        BinContent.SetRange("Unit of Measure Filter", BinContent."Unit of Measure Code");
        BinContent.CalcFields("Quantity (Base)", "Negative Adjmt. Qty. (Base)", "Pick Quantity (Base)", "ATO Components Pick Qty (Base)");
        QtyAvailToTake :=
          BinContent."Quantity (Base)" -
          ((BinContent."Pick Quantity (Base)" + BinContent."ATO Components Pick Qty (Base)") - ExcludeQtyBase + BinContent."Negative Adjmt. Qty. (Base)");

        IsHandled := true;
    end;

    var
        UOMMgt: Codeunit "Unit of Measure Management";

}
