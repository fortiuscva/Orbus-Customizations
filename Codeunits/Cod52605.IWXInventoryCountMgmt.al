codeunit 52605 "ORB IWX Inventory Count Mgmt"
{
    // ************************
    // Copyright Notice
    // This objects content is copyright of Insight Works 2011.  All rights reserved.
    // Any redistribution or reproduction of part or all of the contents in any form is prohibited.
    // ************************

    Permissions = TableData "IWX Count Sheet Configuration" = rimd,
                  TableData "IWX Count Sheet Line" = rimd;

    trigger OnRun()
    begin
    end;

    var
        recInvCountHeader: Record "IWX Inventory Count Header";
        recCountSheetCfg: Record "IWX Count Sheet Configuration";
        recItemTrackingCode: Record "Item Tracking Code";
        recItemForTracking: Record Item;
        recInvCountSetup: Record "IWX Inventory Count Setup";
        recLocation: Record Location;
        txtWIPEntriesLbl: Label 'WIP Entries';
        tcInvEntriesLbl: Label 'Inventory Entries';
        txtFinalPassLbl: Label 'Final Total';
        dLastDiffQty: Decimal;
        dLastDiffAmt: Decimal;
        dLastAbsDiffQty: Decimal;
        dLastAbsDiffAmt: Decimal;
        dLastInvValue: Decimal;
        tcAlreadyPostedByPDAErr: Label 'The sheet [%1] in count [%2] has already been posted by [%3].  Use NAV if you want to re-post.', Comment = '%1 = Count Sheet No.; %2 = Count Sheet Name; %3 = Posted by PDA';
        iNextTagNo: Integer;
        dtOldestAllowedEntryZeroBin: Date;
        nNumUnfilteredRecs: Integer;

    procedure getInventoryDifference(var precCountSheets: Record "IWX Count Sheet Line"; var ptrecSummary: Record "IWX Count Sheet Line" temporary; pbConsumptionOnly: Boolean; pbGroupByLot: Boolean; pbGroupByUOM: Boolean)
    var
        ltrecWIPSummary: Record "IWX Count Sheet Line" temporary;
        ltrecCountSheet: Record "IWX Count Sheet Line" temporary;
        lrecSourceCountSheet: Record "IWX Count Sheet Line";
        lbHasWIP: Boolean;
    begin
        // First rolls up WIP to get total diff by part #, then sums up regular count, then combines the two
        // Steps:
        //  1 - sum up WIP (only "Is WIP"=true) because the count qty is related to existing consumption, not inventory
        //  2 - sum up regular (including entries against W/Os that are not WIP)
        //  3 - add WIP difference to regular to get final total
        //
        // To get consumption entries, repeat above but on step 2 filter out non-W/O entries

        dLastDiffQty := 0;
        dLastDiffAmt := 0;
        dLastAbsDiffQty := 0;
        dLastAbsDiffAmt := 0;
        dLastInvValue := 0;

        // copy count sheets to temp record to speed things up
        nNumUnfilteredRecs := 0;

        lrecSourceCountSheet.CopyFilters(precCountSheets);

        if lrecSourceCountSheet.GetFilter("Date Filter") <> '' then
            lrecSourceCountSheet.SetRange("Date Filter", 0D, lrecSourceCountSheet.GetRangeMax("Date Filter"));

        lrecSourceCountSheet.SetRange("Recount Tag No.", 0);
        if lrecSourceCountSheet.FindSet() then begin
            ltrecCountSheet.CopyFilters(lrecSourceCountSheet);

            repeat
                nNumUnfilteredRecs += 1;
                ltrecCountSheet := lrecSourceCountSheet;
                ltrecCountSheet.Insert();
                lbHasWIP := lbHasWIP or ltrecCountSheet."Is WIP";
            until lrecSourceCountSheet.Next() = 0;
        end; //if


        // get WIP
        if lbHasWIP then begin
            ltrecCountSheet.SetRange("Is WIP", true);
            rollUpSheets(ltrecCountSheet, ltrecWIPSummary, txtWIPEntriesLbl,
                         true,   //pbFilterByWO
                         false,  // pbAddWIP
                         pbGroupByLot,
                         pbGroupByUOM
                         );
        end;//if has WIP

        // get non-WIP
        ltrecCountSheet.SetRange("Is WIP", false);
        if pbConsumptionOnly then
            ltrecCountSheet.SetFilter("Prod. Order No.", '<>%1', '');  // if we only want W/O related entries

        rollUpSheets(ltrecCountSheet, ptrecSummary, tcInvEntriesLbl, pbConsumptionOnly,
          false,  // pbAddWIP
          pbGroupByLot,
          pbGroupByUOM
          );

        // add together - iterate through WIP entries and add diff to other entries
        //  if consumption only, then don't add WIP diff, just add qty counted for WIP
        if lbHasWIP then
            rollUpSheets(ltrecWIPSummary, ptrecSummary, txtFinalPassLbl, pbConsumptionOnly,
                         not pbConsumptionOnly, // pbAddWIP
                         pbGroupByLot,
                         pbGroupByUOM
                         );
    end;

    procedure rollUpSheets(var precCountSheet: Record "IWX Count Sheet Line"; var precSummary: Record "IWX Count Sheet Line"; ptxtProgDesc: Text[30]; pbFilterByWO: Boolean; pbAddWIPDiff: Boolean; pbGroupByLot: Boolean; pbGroupByUOM: Boolean)
    var
        ltcProgressTxt: Label 'Calculating inventory...\Tag No.  #1#########\Item No. #2#########\Progress @3@@@@@@@@@\Type     #4#########', Comment = '%1=Tag number;%2=Item number;%3=Progress percentage;%4=Progress type';
        ldlgProgress: Dialog;
        lnTotalLines: Integer;
        lnLine: Integer;
        lbLotGrouped: Boolean;
        lbSNGrouped: Boolean;
        lnTagNo: Integer;
    begin
        // This function combines all unique entries (item,location,variant,w/o) into single line
        //  with the sum of the individual quantities

        if precCountSheet.GetFilter("Item No.") = '' then
            precCountSheet.SetFilter("Item No.", '<>%1', '');

        precCountSheet.SetCurrentKey("Item No.", "Variant Code", "Location Code", "Bin Code", "Lot No.", "Serial No.", "Prod. Order No.");
        precSummary.SetCurrentKey("Item No.", "Variant Code", "Location Code", "Bin Code", "Lot No.", "Serial No.", "Prod. Order No.");

        if not pbFilterByWO then
            lnTotalLines := nNumUnfilteredRecs
        else
            lnTotalLines := precCountSheet.Count;

        if GuiAllowed then begin
            ldlgProgress.Open(ltcProgressTxt);
            ldlgProgress.Update(4, ptxtProgDesc);
        end;//if

        if precCountSheet.FindSet() then begin
            getLocation(precCountSheet."Location Code");
            lbLotGrouped := pbGroupByLot and isLotGrouped(precCountSheet."Item No.");
            lbSNGrouped := pbGroupByLot and isSNGrouped(precCountSheet."Item No.");

            setUpSummaryLine(precSummary, precCountSheet, lnTagNo, pbFilterByWO, lbLotGrouped or lbSNGrouped);

            while precCountSheet.Next() <> 0 do begin

                if GuiAllowed then begin
                    lnLine += 1;
                    ldlgProgress.Update(1, precCountSheet."Tag No.");
                    ldlgProgress.Update(2, precCountSheet."Item No.");
                    ldlgProgress.Update(3, Round(lnLine * 10000 / lnTotalLines, 1));
                end;//if

                getLocation(precCountSheet."Location Code");
                lbLotGrouped := pbGroupByLot and isLotGrouped(precCountSheet."Item No.");
                lbSNGrouped := pbGroupByLot and isSNGrouped(precCountSheet."Item No.");

                if
                  (precSummary."Item No." <> precCountSheet."Item No.") or
                  (precSummary."Location Code" <> precCountSheet."Location Code") or
                  (precSummary."Variant Code" <> precCountSheet."Variant Code") or
                  (lbLotGrouped and (precSummary."Lot No." <> precCountSheet."Lot No.")) or
                  (lbSNGrouped and (precSummary."Serial No." <> precCountSheet."Serial No.")) or
                  (pbFilterByWO and (precSummary."Prod. Order No." <> precCountSheet."Prod. Order No.")) or
                  (recLocation."Bin Mandatory" and (precSummary."Bin Code" <> precCountSheet."Bin Code")) or
                  (pbGroupByUOM and (precSummary."Unit of Measure Code" <> precCountSheet."Unit of Measure Code"))
                then begin
                    // insert line
                    precSummary.calcDifference();
                    precSummary.Insert();

                    updateDifferences(precSummary);

                    setUpSummaryLine(precSummary, precCountSheet, lnTagNo, pbFilterByWO, lbLotGrouped or lbSNGrouped);

                end else begin
                    precSummary."Quantity (Base)" += precCountSheet."Quantity (Base)";
                    precSummary.Quantity := precSummary."Quantity (Base)" / precSummary."Qty. per Unit of Measure";
                end;//if new line

            end;//while

            precSummary.calcDifference();
            precSummary.Insert();

            updateDifferences(precSummary);

        end;//if sheets

        if GuiAllowed then
            ldlgProgress.Close();

        precSummary.Reset();
    end;

    local procedure isLotGrouped(pcodItemNo: Text): Boolean
    begin
        // Returns whether totals need to be grouped by lot or not
        // Item needs to be summarized by lot # if:
        //   it is lot-whse tracked, or is in a location without bins and requires lots for adjustments

        exit(
          (isLotWhseTracked(pcodItemNo) and recLocation."Bin Mandatory") or
          (isLotJnlTracked(pcodItemNo) and not recLocation."Bin Mandatory")
        );
    end;

    local procedure isSNGrouped(pcodItemNo: Text): Boolean
    begin
        // Returns whether totals need to be grouped by SN or not
        // Item needs to be summarized by SN if:
        //   it is SN-whse tracked, or is in a location without bins and requires SNs for adjustments
        exit(
          (isSNWhseTracked(pcodItemNo) and recLocation."Bin Mandatory") or
          (isSNJnlTracked(pcodItemNo) and not recLocation."Bin Mandatory")
        );
    end;

    local procedure setUpSummaryLine(var precSummary: Record "IWX Count Sheet Line"; var precCountSheet: Record "IWX Count Sheet Line"; var pnTagNo: Integer; pbFilterByWO: Boolean; pbLotGrouped: Boolean)
    begin
        // Sets up line for summarizing count - called from rollUpSheets
        precSummary := precCountSheet;

        pnTagNo += 1;
        precSummary."Tag No." := pnTagNo;
        precSummary."Sheet Name" := '';
        precSummary."Recount Source Tag No." := 0;
        precSummary."WMDM Kit Item" := false;
        precSummary."WMDM Kit Assembly" := false;

        if not pbFilterByWO then
            precSummary."Prod. Order No." := '';
        if not pbLotGrouped then begin
            precSummary."Lot No." := '';
            precSummary."Serial No." := '';
        end;//if
    end;

    local procedure updateDifferences(precSummary: Record "IWX Count Sheet Line")
    begin
        // Sum differences for current line
        dLastDiffQty += precSummary."Difference Qty. (Base)";
        dLastDiffAmt += precSummary."Difference Amount";
        dLastAbsDiffQty += precSummary."Difference Qty. (ABS) (Base)";
        dLastAbsDiffAmt += precSummary."Difference Amount (ABS)";
        dLastInvValue += precSummary.getLastUnitCost() * precSummary."Expected Quantity (Base)";
    end;

    procedure rollUpBinLines(var precBinSheets: Record "IWX Count Sheet Line"; var ptrecSummary: Record "IWX Count Sheet Line")
    var
        lrecItem: Record Item;
    begin
        // Rolls up quantities grouped by bins into non-grouped totals

        dLastDiffQty := 0;
        dLastDiffAmt := 0;
        dLastAbsDiffQty := 0;
        dLastAbsDiffAmt := 0;
        dLastInvValue := 0;

        precBinSheets.Reset();
        precBinSheets.SetCurrentKey("Item No.", "Variant Code", "Location Code", "Lot No.", "Serial No.");
        if precBinSheets.FindSet() then begin
            ptrecSummary := precBinSheets;

            while precBinSheets.Next() <> 0 do begin
                if lrecItem."No." <> ptrecSummary."Item No." then
                    lrecItem.Get(ptrecSummary."Item No.");
                getLocation(ptrecSummary."Location Code");

                if (precBinSheets."Item No." <> ptrecSummary."Item No.") or
                   (precBinSheets."Variant Code" <> ptrecSummary."Variant Code") or
                   (precBinSheets."Location Code" <> ptrecSummary."Location Code") or
                   (isLotGrouped(lrecItem."No.") and (precBinSheets."Lot No." <> ptrecSummary."Lot No.")) or
                   (isSNGrouped(lrecItem."No.") and (precBinSheets."Serial No." <> ptrecSummary."Serial No."))
                then begin
                    dLastDiffQty += ptrecSummary."Difference Qty. (Base)";
                    dLastDiffAmt += ptrecSummary."Difference Amount";
                    dLastAbsDiffQty += ptrecSummary."Difference Qty. (ABS) (Base)";
                    dLastAbsDiffAmt += ptrecSummary."Difference Amount (ABS)";
                    dLastInvValue += lrecItem."Unit Cost" * ptrecSummary."Expected Quantity (Base)";

                    ptrecSummary.Insert();
                    ptrecSummary := precBinSheets;

                end else begin
                    ptrecSummary."Quantity (Base)" := ptrecSummary."Quantity (Base)" + precBinSheets."Quantity (Base)";
                    ptrecSummary.Quantity := ptrecSummary."Quantity (Base)" / ptrecSummary."Qty. per Unit of Measure";
                    ptrecSummary."Difference Qty. (Base)" := ptrecSummary."Difference Qty. (Base)" + precBinSheets."Difference Qty. (Base)";
                    ptrecSummary."Expected Quantity (Base)" := ptrecSummary."Expected Quantity (Base)" + precBinSheets."Expected Quantity (Base)";

                    lrecItem.Get(ptrecSummary."Item No.");
                    ptrecSummary."Difference Amount" := ptrecSummary."Difference Qty. (Base)" * lrecItem."Unit Cost";
                    ptrecSummary."Difference Amount (ABS)" := Abs(ptrecSummary."Difference Amount");
                    ptrecSummary."Difference Qty. (ABS) (Base)" := Abs(ptrecSummary."Difference Qty. (Base)");

                end;//if

            end;//while

            if ptrecSummary.Insert() then begin
                dLastDiffQty += ptrecSummary."Difference Qty. (Base)";
                dLastDiffAmt += ptrecSummary."Difference Amount";
                dLastAbsDiffQty += ptrecSummary."Difference Qty. (ABS) (Base)";
                dLastAbsDiffAmt += ptrecSummary."Difference Amount (ABS)";
                dLastInvValue += lrecItem."Unit Cost" * ptrecSummary."Expected Quantity (Base)";
            end;

        end;//if got bin sheet
    end;

    procedure groupByWorkCenter(var trecActiveRtngLine: Record "Prod. Order Routing Line" temporary; codDefaultWC: Code[20])
    var
        lrecRoutingLine: Record "Prod. Order Routing Line";
        lrecProdOrderLine: Record "Prod. Order Line";
        lrecNextOper: Record "Prod. Order Routing Line";
        ldlgProgress: Dialog;
        ltcDialogTxt: Label 'Grouping WIP by Work Center:\Production Order #1#############', Comment = '%1 = The Production Order number';
    begin
        // Locates "current" work center(s) for each work order:
        //  -> finds last finished operation
        //   -> if no finished oper, uses W/C from first unfinished oper
        //    -> if no oper, uses default W/C
        //   -> finds all succeeding opers for the finished oper
        //    -> if no next opers, uses W/C from last finished oper
        //    -> if next oper(s) found use W/C for each of the next opers
        //<SideEffect>
        // Deletes all existing entries in trecActiveRtngLine param
        //</SideEffect>


        trecActiveRtngLine.Reset();
        trecActiveRtngLine.DeleteAll();

        // use only released orders with no remaining qty
        lrecProdOrderLine.SetRange(Status, lrecProdOrderLine.Status::Released);
        lrecProdOrderLine.SetFilter("Remaining Quantity", '>%1', 0);

        lrecProdOrderLine.Find('-');
        if GuiAllowed then
            ldlgProgress.Open(ltcDialogTxt);

        // iterate through routing lines, find last finished op, and get next operation(s)
        repeat
            if GuiAllowed then
                ldlgProgress.Update(1, lrecProdOrderLine."Prod. Order No.");

            lrecRoutingLine.SetRange("Prod. Order No.", lrecProdOrderLine."Prod. Order No.");
            lrecRoutingLine.SetRange("Routing Status", lrecRoutingLine."Routing Status"::Finished);
            if lrecRoutingLine.Find('+') then begin
                // got a finished op, so try to get next operations
                lrecNextOper.SetRange("Prod. Order No.", lrecProdOrderLine."Prod. Order No.");
                lrecNextOper.SetFilter("Routing Status", '<%1', lrecNextOper."Routing Status"::Finished);
                lrecNextOper.SetFilter("Operation No.", lrecRoutingLine."Next Operation No.");
                if lrecNextOper.Find('-') then begin
                    // we got next opers, so add their W/Cs
                    repeat
                        insertWorkCenter(lrecProdOrderLine."Prod. Order No.", lrecNextOper."Work Center No.", trecActiveRtngLine)
                    until lrecNextOper.Next() = 0;
                end else begin
                    // no next oper, so use W/C from last finished oper
                    insertWorkCenter(lrecProdOrderLine."Prod. Order No.", lrecRoutingLine."Work Center No.", trecActiveRtngLine)
                end;
            end else begin
                // no finished ops, so use first op if it exists
                lrecRoutingLine.SetRange("Routing Status");
                if lrecRoutingLine.Find('-') then
                    insertWorkCenter(lrecProdOrderLine."Prod. Order No.", lrecRoutingLine."Work Center No.", trecActiveRtngLine)
                else
                    insertWorkCenter(lrecProdOrderLine."Prod. Order No.", codDefaultWC, trecActiveRtngLine)
            end;//if

        until lrecProdOrderLine.Next() = 0;
    end;

    local procedure insertWorkCenter(codProdOrder: Code[20]; codWorkCenter: Code[20]; var trecActiveRtngLine: Record "Prod. Order Routing Line")
    var
        lrecCountSheetLine: Record "IWX Count Sheet Line";
    begin
        // Buffers work center/work order combinations
        // Called by "groupByWorkCenter"

        lrecCountSheetLine.SetRange("Prod. Order No.", codProdOrder);

        if not lrecCountSheetLine.IsEmpty() then begin
            // if we have work orders on the count sheet that match this one, add W/C
            trecActiveRtngLine."Prod. Order No." := codProdOrder;
            trecActiveRtngLine."Work Center No." := codWorkCenter;
            trecActiveRtngLine."Operation No." := Format(trecActiveRtngLine.Count + 1);
            trecActiveRtngLine.Insert();
        end;//if
    end;

    procedure insertCountSheetLine(var lrecCurItem: Record Item; codCountNo: Code[20]; codSheet: Code[20]; codLocation: Code[10]; codVariant: Text; codProdOrder: Code[20]; pcodBinFilter: Code[80]; pcodZoneFilter: Code[10])
    var
        lrecCountSheet: Record "IWX Count Sheet Line";
        lrecItemLedgerEntry: Record "Item Ledger Entry";
        ltrecInvBuf: Record "Inventory Buffer" temporary;
        lrecCountLineExisting: Record "IWX Count Sheet Line";
        lrecWhseEntryTest: Record "Warehouse Entry";
        ltrecBinContent: Record "Bin Content" temporary;
        lrecTrackedBinContent: Record "Bin Content";
        WarehouseActLineRecLcl: Record "Warehouse Activity Line";
        lqBinContentByDate: Query "IWX Bin Content by Date";
        WarehousePickQtyVarLcl: Decimal;
        lbTrackingSet: Boolean;
        lbIsWhseTracked: Boolean;
        lbInsert: Boolean;
        lbQueryRead: Boolean;
    begin
        // Inserts line into count sheet


        getCountConfig(codCountNo, codSheet);
        getLocation(codLocation);

        setBinQueryFilter(lqBinContentByDate, lrecCurItem."No.", codLocation, codVariant, pcodBinFilter);

        if lqBinContentByDate.Open() then begin
            lbQueryRead := lqBinContentByDate.Read();
        end;//if query open

        if lbQueryRead or (not recLocation."Bin Mandatory") then begin
            // Get unique list of lot numbers if this is a "lot warehouse tracked" item
            // (this really needs to be done as an SQL statement - would be way faster than 3 loops)
            if recLocation."Bin Mandatory" then begin
                lbIsWhseTracked := isLotWhseTracked(lrecCurItem."No.") or isSNWhseTracked(lrecCurItem."No.")
            end else
                lbIsWhseTracked := isItemTracked(lrecCurItem."No.");

            if lbIsWhseTracked then begin
                getInvSetup();
                // get unique list of lot #'s in stock for this location
                lrecItemLedgerEntry.SetRange("Item No.", lrecCurItem."No.");
                lrecItemLedgerEntry.SetRange("Location Code", codLocation);
                lrecItemLedgerEntry.SetRange("Variant Code", codVariant);
                lrecItemLedgerEntry.SetRange(Open, true);
                lrecItemLedgerEntry.SetFilter("Item Tracking", '<>%1', lrecItemLedgerEntry."Item Tracking"::None);
                lrecItemLedgerEntry.SetRange("Posting Date", 0D, recInvCountHeader."Inventory As of Date");
                if lrecItemLedgerEntry.FindSet(false) then
                    repeat
                        ltrecInvBuf."Lot No." := lrecItemLedgerEntry."Lot No.";
                        ltrecInvBuf."Serial No." := lrecItemLedgerEntry."Serial No.";
                        if ltrecInvBuf.Insert() then;
                    until lrecItemLedgerEntry.Next() = 0;
            end;//if got lots

            repeat
                Clear(lrecCountSheet);
                lrecCountSheet.SetRange("Date Filter", 0D, recInvCountHeader."Inventory As of Date");

                if lbQueryRead then begin
                    ltrecBinContent."Item No." := lqBinContentByDate.Item_No;
                    ltrecBinContent."Variant Code" := lqBinContentByDate.Variant_Code;
                    ltrecBinContent."Location Code" := lqBinContentByDate.Location_Code;
                    ltrecBinContent."Bin Code" := lqBinContentByDate.Bin_Code;
                    ltrecBinContent."Unit of Measure Code" := lqBinContentByDate.Unit_of_Measure_Code;
                    ltrecBinContent."Qty. per Unit of Measure" := lqBinContentByDate.Qty_per_Unit_of_Measure;
                    ltrecBinContent.Quantity := lqBinContentByDate.Quantity;
                end;//if query read

                lbInsert := (ltrecBinContent.Quantity <> 0) or not recLocation."Bin Mandatory";

                // If there is no bin content, then check and see if there is recent
                // activity. If there is, add it, otherwise don't add it.
                if recLocation."Bin Mandatory" and (ltrecBinContent.Quantity = 0) and (dtOldestAllowedEntryZeroBin <> 0D)
                   and not lbIsWhseTracked
                then begin
                    lrecWhseEntryTest.Reset();
                    lrecWhseEntryTest.SetRange("Item No.", ltrecBinContent."Item No.");
                    lrecWhseEntryTest.SetRange("Variant Code", ltrecBinContent."Variant Code");
                    lrecWhseEntryTest.SetRange("Location Code", ltrecBinContent."Location Code");
                    lrecWhseEntryTest.SetRange("Bin Code", ltrecBinContent."Bin Code");
                    lrecWhseEntryTest.SetRange("Unit of Measure Code", ltrecBinContent."Unit of Measure Code");

                    lrecWhseEntryTest.SetFilter("Registering Date", '>=%1', dtOldestAllowedEntryZeroBin);
                    lbInsert := not lrecWhseEntryTest.IsEmpty(); // IsEmpty is fast, select top 1 null
                end;

                // check to see if already on a count sheet line other than this one. If there is, do not add it.
                if (lbInsert) and (recCountSheetCfg."Prevent Duplicate Lines") then begin
                    lrecCountLineExisting.Reset();
                    lrecCountLineExisting.SetRange("Count No.", codCountNo);
                    lrecCountLineExisting.SetFilter("Sheet Name", '<>%1', codSheet);
                    lrecCountLineExisting.SetRange("Item No.", lrecCurItem."No.");
                    lrecCountLineExisting.SetRange("Shelf No.", lrecCurItem."Shelf No.");
                    lrecCountLineExisting.SetRange("Variant Code", codVariant);
                    if recLocation."Bin Mandatory"
                       and lbQueryRead
                    then
                        lrecCountLineExisting.SetRange("Bin Code", ltrecBinContent."Bin Code");
                    lrecCountLineExisting.SetRange("Prod. Order No.", codProdOrder);

                    lrecCountLineExisting.SetRange("Unit of Measure Code", ltrecBinContent."Unit of Measure Code");

                    // if it's not yet on another line, keep our flag to add it.
                    lbInsert := lrecCountLineExisting.IsEmpty(); // faster than findfirst
                end;


                if (lbInsert) then begin
                    lrecCountSheet."Count No." := codCountNo;
                    lrecCountSheet."Tag No." := getNextTagNo(codCountNo);

                    lrecCountSheet."Sheet Name" := codSheet;
                    lrecCountSheet.Validate("Item No.", lrecCurItem."No.");
                    lrecCountSheet."Shelf No." := lrecCurItem."Shelf No.";
                    lrecCountSheet."Variant Code" := CopyStr(codVariant, 1, MaxStrLen(lrecCountSheet."Variant Code"));
                    lrecCountSheet."Location Code" := codLocation;
                    lrecCountSheet."Bin Code" := ltrecBinContent."Bin Code";
                    lrecCountSheet."ORB Zone Code" := pcodZoneFilter;

                    Clear(WarehousePickQtyVarLcl);
                    WarehouseActLineRecLcl.Reset();
                    WarehouseActLineRecLcl.SetRange("Item No.", lrecCountSheet."Item No.");
                    WarehouseActLineRecLcl.SetRange("Location Code", lrecCountSheet."Location Code");
                    WarehouseActLineRecLcl.SetRange("Variant Code", lrecCountSheet."Variant Code");
                    if lrecCountSheet."Bin Code" <> '' then
                        WarehouseActLineRecLcl.SetRange("Bin Code", lrecCountSheet."Bin Code");
                    if lrecCountSheet."ORB Zone Code" <> '' then
                        WarehouseActLineRecLcl.SetRange("Zone Code", lrecCountSheet."ORB Zone Code");
                    if WarehouseActLineRecLcl.FindSet() then
                        repeat
                            WarehousePickQtyVarLcl += WarehouseActLineRecLcl.Quantity;
                        until WarehouseActLineRecLcl.Next() = 0;

                    lrecCountSheet."ORB Quantity on Pick" := WarehousePickQtyVarLcl;

                    lrecCountSheet."Prod. Order No." := codProdOrder;
                    lrecCountSheet."Auto Generated" := true;
                    //if recLocation."Directed Put-away and Pick" then begin
                    lrecCountSheet."Unit of Measure Code" := ltrecBinContent."Unit of Measure Code";
                    lrecCountSheet."Qty. per Unit of Measure" := ltrecBinContent."Qty. per Unit of Measure";
                    //end;//if directed pick
                    lrecCountSheet.calcDifference();
                    if lqBinContentByDate.Quantity < 0 then begin
                        lrecCountSheet.Validate("Expected Quantity", 0);
                        lrecCountSheet.Validate("Difference Qty.", 0);
                        lrecCountSheet.Validate("Difference Amount", 0);
                    end;
                    lrecCountSheet.Insert();
                end; //if insert

                lbTrackingSet := false;

                // Add lot numbers if required
                if lbIsWhseTracked and lbInsert then begin
                    // have unique list of lots for the location, so check if they belong in this bin
                    if ltrecInvBuf.Find('-') then
                        repeat
                            if recLocation."Bin Mandatory" then begin
                                lrecTrackedBinContent.SetRange("Item No.", lrecCurItem."No.");
                                lrecTrackedBinContent.SetRange("Location Code", codLocation);
                                lrecTrackedBinContent.SetFilter("Variant Code", codVariant);
                                lrecTrackedBinContent.SetFilter("Bin Code", ltrecBinContent."Bin Code");
                                lrecTrackedBinContent.SetFilter("Lot No. Filter", ltrecInvBuf."Lot No.");
                                lrecTrackedBinContent.SetFilter("Serial No. Filter", ltrecInvBuf."Serial No.");
                                if lrecTrackedBinContent.FindFirst() then
                                    lrecTrackedBinContent.CalcFields(Quantity);
                            end;//if bin mandatory
                            if (lrecTrackedBinContent.Quantity <> 0) or (not recLocation."Bin Mandatory") then begin
                                if ltrecInvBuf."Lot No." <> '' then begin
                                    lrecCountSheet."Lot No." := ltrecInvBuf."Lot No.";
                                    if recInvCountSetup."Add Exp. Date on Generation" then
                                        lrecCountSheet.setExpirationDate();
                                end;
                                if ltrecInvBuf."Serial No." <> '' then
                                    lrecCountSheet."Serial No." := ltrecInvBuf."Serial No.";

                                if not lbTrackingSet then begin
                                    lrecCountSheet.calcDifference();
                                    lrecCountSheet.Modify();
                                    lbTrackingSet := true;
                                end else begin
                                    lrecCountSheet."Tag No." := getNextTagNo(codCountNo);
                                    // other filters for lrecCountLineExisting are set earlier.
                                    // For a similar purpose, if there is a serial or lot specified on the line and this already exists on another sheet
                                    lrecCountLineExisting.SetRange("Serial No.", ltrecInvBuf."Serial No.");
                                    lrecCountLineExisting.SetRange("Lot No.", ltrecInvBuf."Lot No.");

                                    if (lrecCountLineExisting.IsEmpty()) or (not recCountSheetCfg."Prevent Duplicate Lines") then begin
                                        lrecCountSheet.calcDifference();
                                        lrecCountSheet.Insert();
                                    end;
                                end;//if
                            end;//if got bin or not bin mandatory
                        until ltrecInvBuf.Next() = 0;
                end;//if
                lbQueryRead := lqBinContentByDate.Read();
            until not lbQueryRead;
        end;//if



    end;


    /// <summary>
    /// Set filters for bin query for insertCountSheetLine
    /// </summary>
    /// <param name="pqBinContentByDate"></param>
    /// <param name="pcodItemNo"></param>
    /// <param name="pcodLocation"></param>
    /// <param name="pcodVariant"></param>
    /// <param name="pcodBinFilter"></param>
    procedure setBinQueryFilter(var pqBinContentByDate: Query "IWX Bin Content by Date"; pcodItemNo: Code[20]; pcodLocation: Code[10]; pcodVariant: Text; pcodBinFilter: Code[80])
    begin
        pqBinContentByDate.SetRange(Item_No, pcodItemNo);
        if pcodLocation <> '' then
            pqBinContentByDate.SetRange(Location_Code, pcodLocation);

        if pcodVariant <> '' then
            pqBinContentByDate.SetRange(Variant_Code, pcodVariant);

        if (pcodBinFilter = '') and (recLocation."Adjustment Bin Code" <> '') then begin
            pcodBinFilter := '<>' + recLocation."Adjustment Bin Code";
        end;

        if pcodBinFilter <> '' then
            pqBinContentByDate.SetFilter(Bin_Code, pcodBinFilter);

        pqBinContentByDate.SetRange(Registering_Date, 0D, recInvCountHeader."Inventory As of Date");


    end;

    procedure getMissingSerialNos(pcodCountNo: Code[20]; pcodItemNo: Text; pcodLocation: Code[10]; pcodVariant: Text; var ptrecSNSummary: Record "Inventory Buffer" temporary; pdtAsOfDate: Date)
    var
        lrecItemLedger: Record "Item Ledger Entry";
        lrecCountLine: Record "IWX Count Sheet Line";
        ldCountQty: Decimal;
    begin
        // Returns a list of serial numbers that have not been counted

        ptrecSNSummary."Item No." := CopyStr(pcodItemNo, 1, MaxStrLen(ptrecSNSummary."Item No."));
        ptrecSNSummary."Location Code" := pcodLocation;
        ptrecSNSummary."Variant Code" := CopyStr(pcodVariant, 1, MaxStrLen(ptrecSNSummary."Variant Code"));
        ptrecSNSummary.Quantity := 1;

        lrecCountLine.SetRange("Count No.", pcodCountNo);
        lrecCountLine.SetRange("Item No.", pcodItemNo);
        lrecCountLine.SetRange("Location Code", pcodLocation);
        lrecCountLine.SetRange("Variant Code", pcodVariant);
        lrecCountLine.SetRange("Recount Tag No.", 0);

        lrecItemLedger.SetCurrentKey("Item No.", Open, "Variant Code", "Location Code", "Item Tracking", "Lot No.", "Serial No.");
        lrecItemLedger.SetRange("Item No.", pcodItemNo);
        lrecItemLedger.SetRange("Location Code", pcodLocation);
        lrecItemLedger.SetRange("Variant Code", pcodVariant);
        lrecItemLedger.SetRange(Open, true);
        if pdtAsOfDate <> 0D then
            lrecItemLedger.SetRange("Posting Date", 0D, pdtAsOfDate);

        if lrecItemLedger.FindSet(false) then
            repeat
                lrecCountLine.SetRange("Serial No.", lrecItemLedger."Serial No.");
                // get final count, including recounts.  If count=0 then serial number is missing
                ldCountQty := 0;
                if lrecCountLine.FindSet(false) then
                    repeat
                        ldCountQty := lrecCountLine."Quantity (Base)";
                    until (ldCountQty <> 0) or (lrecCountLine.Next() = 0);

                if ldCountQty = 0 then begin
                    ptrecSNSummary."Serial No." := lrecItemLedger."Serial No.";
                    if ptrecSNSummary.Insert() then;
                end;//if
            until lrecItemLedger.Next() = 0;
    end;

    procedure getExtraSerialNos(pcodCountNo: Code[20]; pcodItemNo: Text; pcodLocation: Code[20]; pcodVariant: Text; var ptrecSNSummary: Record "Inventory Buffer" temporary; pbIncludeDetail: Boolean; pdtAsOfDate: Date)
    var
        lrecItemLedger: Record "Item Ledger Entry";
        lrecCountLine: Record "IWX Count Sheet Line";
    begin
        // Returns a list of serial numbers that have been counted but are not in the ledger

        ptrecSNSummary."Item No." := CopyStr(pcodItemNo, 1, MaxStrLen(ptrecSNSummary."Item No."));
        ptrecSNSummary.Quantity := 0;

        lrecCountLine.SetRange("Count No.", pcodCountNo);
        lrecCountLine.SetRange("Item No.", pcodItemNo);
        lrecCountLine.SetRange("Location Code", pcodLocation);
        lrecCountLine.SetRange("Variant Code", pcodVariant);
        lrecCountLine.SetRange("Recount Tag No.", 0);

        lrecItemLedger.SetCurrentKey("Item No.", Open, "Variant Code", "Location Code", "Item Tracking", "Lot No.", "Serial No.");
        lrecItemLedger.SetRange("Item No.", pcodItemNo);
        lrecItemLedger.SetRange("Variant Code", pcodVariant);
        lrecItemLedger.SetRange(Open, true);
        if pdtAsOfDate <> 0D then
            lrecItemLedger.SetRange("Posting Date", 0D, pdtAsOfDate);


        if lrecCountLine.FindSet(false) then
            repeat
                if lrecCountLine."Quantity (Base)" <> 0 then begin
                    ptrecSNSummary."Location Code" := '';
                    if lrecCountLine."Serial No." = '' then begin
                        if pbIncludeDetail then begin
                            ptrecSNSummary."Serial No." := '(BLANK)';
                            ptrecSNSummary."Bin Code" := lrecCountLine."Bin Code";
                            ptrecSNSummary."Variant Code" := CopyStr(lrecCountLine."Shelf No.", 1, 10);
                            if ptrecSNSummary.Insert() then;
                        end;//if
                    end else begin
                        lrecItemLedger.SetRange("Serial No.", lrecCountLine."Serial No.");
                        lrecItemLedger.SetRange("Location Code", pcodLocation);
                        if lrecItemLedger.IsEmpty then begin
                            ptrecSNSummary."Serial No." := CopyStr(lrecCountLine."Serial No.", 1, MaxStrLen(ptrecSNSummary."Serial No."));
                            ptrecSNSummary.Quantity := 1;
                            if pbIncludeDetail then begin
                                ptrecSNSummary."Bin Code" := lrecCountLine."Bin Code";
                                ptrecSNSummary."Variant Code" := CopyStr(lrecCountLine."Shelf No.", 1, 10);
                            end;//if

                            // check if SN might exist in another location
                            if pbIncludeDetail then begin
                                lrecItemLedger.SetRange("Location Code");
                                if lrecItemLedger.FindSet() then
                                    ptrecSNSummary."Location Code" := lrecItemLedger."Location Code"; // specify which location has SN
                            end;//if detail

                            if ptrecSNSummary.Insert() then;
                        end;//if  SN not in ledger
                    end;//if SN blank
                end;//if qty<>0
            until lrecCountLine.Next() = 0;
    end;

    procedure getDuplicateSerialNos(pcodCountNo: Code[20]; pcodItemNo: Text; pcodLocation: Code[20]; pcodVariant: Text; var ptrecSNSummary: Record "Inventory Buffer" temporary)
    var
        lrecCountLine: Record "IWX Count Sheet Line";
        lrecDupCountLine: Record "IWX Count Sheet Line";
    begin
        // Returns a list of serial numbers that have been counted more than once on the count lines
        lrecCountLine.SetRange("Count No.", pcodCountNo);
        lrecCountLine.SetRange("Item No.", pcodItemNo);
        lrecCountLine.SetRange("Location Code", pcodLocation);
        lrecCountLine.SetRange("Variant Code", pcodVariant);
        lrecCountLine.SetRange("Recount Tag No.", 0);

        lrecDupCountLine.SetRange("Item No.", pcodItemNo);
        lrecDupCountLine.SetRange("Location Code", pcodLocation);
        lrecDupCountLine.SetRange("Variant Code", pcodVariant);
        lrecDupCountLine.SetRange("Recount Tag No.", 0);

        if lrecCountLine.FindSet(false) then
            repeat
                if lrecCountLine."Quantity (Base)" <> 0 then begin
                    lrecDupCountLine.SetFilter("Tag No.", '>%1', lrecCountLine."Tag No.");
                    lrecDupCountLine.SetFilter("Serial No.", '=%1', lrecCountLine."Serial No.");
                    if lrecDupCountLine.Find('-') then begin
                        if lrecDupCountLine."Quantity (Base)" <> 0 then begin
                            ptrecSNSummary."Item No." := Format(lrecCountLine."Tag No.");
                            ptrecSNSummary."Serial No." := CopyStr(lrecCountLine."Serial No.", 1, MaxStrLen(ptrecSNSummary."Serial No."));
                            ptrecSNSummary."Bin Code" := lrecCountLine."Bin Code";
                            ptrecSNSummary."Variant Code" := CopyStr(lrecCountLine."Shelf No.", 1, 10);
                            if ptrecSNSummary.Insert() then;

                            ptrecSNSummary."Item No." := Format(lrecDupCountLine."Tag No.");
                            ptrecSNSummary."Bin Code" := lrecDupCountLine."Bin Code";
                            ptrecSNSummary."Variant Code" := CopyStr(lrecDupCountLine."Shelf No.", 1, 10);
                            if ptrecSNSummary.Insert() then;
                        end;//if dup line qty<>0
                    end;//if found dup line
                end;//if count qty<>0
            until lrecCountLine.Next() = 0;
    end;

    procedure getLotNoDifferences(pcodCountNo: Code[20]; pcodItemNo: Text; pcodLocation: Code[10]; pcodVariant: Text; var ptrecLotSummary: Record "IWX Invt. Buffer" temporary; pdtAsOfDate: Date)
    var
        lrecCountLine: Record "IWX Count Sheet Line";
        lqLotQry: Query "IWX ILE Item Tracking Summary";
        ldCountQty: Decimal;
        lcodLastLot: Code[100];
        ldtExpiration: Date;
        lbInserted: Boolean;
    begin
        // Identifies lot #'s in inventory that were over or under counted
        //  - Negative qty in buffer means under-counted (extra in item ledger)
        //  - Positive means over-counted
        //  - 0 means evenly counted (no diff)
        lbInserted := false;
        Clear(ptrecLotSummary);
        ptrecLotSummary.DeleteAll();

        lqLotQry.SetFilter(Item_No, pcodItemNo);
        lqLotQry.SetFilter(Location_Code, pcodLocation);
        lqLotQry.SetFilter(Variant_Code, pcodVariant);

        if pdtAsOfDate <> 0D then
            lqLotQry.SetRange(Posting_Date, 0D, pdtAsOfDate);

        if lqLotQry.Open() then begin
            ptrecLotSummary."Item No." := CopyStr(pcodItemNo, 1, MaxStrLen(ptrecLotSummary."Item No."));
            ptrecLotSummary."Location Code" := pcodLocation;
            ptrecLotSummary."Variant Code" := CopyStr(pcodVariant, 1, MaxStrLen(ptrecLotSummary."Variant Code"));

            while lqLotQry.Read() do begin

                if (ptrecLotSummary."Lot No." <> lqLotQry.Lot_No) or
                   (ptrecLotSummary."Serial No." <> lqLotQry.Serial_No) or
                   (not lbInserted)
                then begin
                    ptrecLotSummary."Serial No." := lqLotQry.Serial_No;
                    ptrecLotSummary."Lot No." := lqLotQry.Lot_No;
                    ptrecLotSummary."Expiration Date" := lqLotQry.Expiration_Date;
                    ptrecLotSummary.Quantity := -lqLotQry.Quantity;
                    ptrecLotSummary.Insert();
                    lbInserted := true;
                end else begin
                    // always assume exp date is the same for the same lot #
                    ptrecLotSummary.Quantity -= lqLotQry.Quantity;
                    ptrecLotSummary.Modify();
                end;//if

            end;//while read
        end;//Open Query


        // sum up lot #'s in count lines
        lrecCountLine.SetCurrentKey("Item No.", "Variant Code", "Location Code", "Lot No.", "Recount Tag No.");
        lrecCountLine.SetRange("Item No.", pcodItemNo);
        lrecCountLine.SetRange("Location Code", pcodLocation);
        lrecCountLine.SetRange("Variant Code", pcodVariant);
        lrecCountLine.SetRange("Recount Tag No.", 0);
        lrecCountLine.SetRange("Count No.", pcodCountNo);

        if lrecCountLine.FindSet(false) then begin
            ldCountQty := 0;
            lcodLastLot := lrecCountLine."Lot No.";
            ldtExpiration := lrecCountLine."Expiration Date";
            repeat
                if lrecCountLine."Lot No." <> lcodLastLot then begin
                    // apply sum of lot qty to summary
                    setLotSummaryQty(ptrecLotSummary, pcodItemNo, lcodLastLot, ldCountQty, ldtExpiration);
                    ldCountQty := lrecCountLine."Quantity (Base)";
                    ldtExpiration := lrecCountLine."Expiration Date";
                end else begin
                    ldCountQty += lrecCountLine."Quantity (Base)";
                    if (lrecCountLine."Expiration Date" <> 0D) and (ldtExpiration > lrecCountLine."Expiration Date") then
                        ldtExpiration := lrecCountLine."Expiration Date";
                end;//if

                lcodLastLot := lrecCountLine."Lot No.";
            until lrecCountLine.Next() = 0;

            if ldCountQty <> 0 then
                setLotSummaryQty(ptrecLotSummary, pcodItemNo, lcodLastLot, ldCountQty, ldtExpiration);
        end;//if

        ptrecLotSummary.Reset();


    end;

#if V16_OR_HIGHER
    [Obsolete('Use getLotNoDifferences instead', '2.2')]
#elif V15_OR_HIGHER
    [Obsolete('Use getLotNoDifferences instead')]
#endif
    procedure getLotNoDifferences2009(pcodCountNo: Code[20]; pcodItemNo: Text; pcodLocation: Code[10]; pcodVariant: Text; var ptrecLotSummary: Record "IWX Invt. Buffer" temporary; pdtAsOfDate: Date)
    var
        lrecItemLedger: Record "Item Ledger Entry";
        lrecCountLine: Record "IWX Count Sheet Line";
        ldCountQty: Decimal;
        lcodLastLot: Code[100];
        ldtExpiration: Date;
    begin
        // Identifies lot #'s in inventory that were over or under counted
        //  - Negative qty in buffer means under-counted (extra in item ledger)
        //  - Positive means over-counted
        //  - 0 means evenly counted (no diff)


        lrecItemLedger.SetCurrentKey("Item No.", Open, "Variant Code", "Location Code", "Item Tracking", "Lot No.", "Serial No.");
        lrecItemLedger.SetRange("Item No.", pcodItemNo);
        lrecItemLedger.SetRange("Location Code", pcodLocation);
        lrecItemLedger.SetRange("Variant Code", pcodVariant);
        lrecItemLedger.SetRange(Open, true);
        //lrecItemLedger.SETRANGE("Item Tracking",
        //         lrecItemLedger."Item Tracking"::"Lot No.", lrecItemLedger."Item Tracking"::"Lot and Serial No.");

        if pdtAsOfDate <> 0D then
            lrecItemLedger.SetRange("Posting Date", 0D, pdtAsOfDate);

        Clear(ptrecLotSummary);
        ptrecLotSummary."Item No." := CopyStr(pcodItemNo, 1, MaxStrLen(ptrecLotSummary."Item No."));
        ptrecLotSummary."Location Code" := pcodLocation;
        ptrecLotSummary."Variant Code" := CopyStr(pcodVariant, 1, MaxStrLen(ptrecLotSummary."Variant Code"));

        // sum up lot #'s in item ledger entries
        if lrecItemLedger.FindSet(false) then begin
            ptrecLotSummary."Lot No." := lrecItemLedger."Lot No.";
            ptrecLotSummary."Expiration Date" := lrecItemLedger."Expiration Date";
            ptrecLotSummary.Quantity := -lrecItemLedger."Remaining Quantity";

            while lrecItemLedger.Next() <> 0 do begin
                if ptrecLotSummary."Lot No." <> lrecItemLedger."Lot No." then begin
                    ptrecLotSummary.Insert();
                    ptrecLotSummary."Lot No." := lrecItemLedger."Lot No.";
                    ptrecLotSummary."Expiration Date" := lrecItemLedger."Expiration Date";
                    ptrecLotSummary.Quantity := -lrecItemLedger."Remaining Quantity";
                end else begin
                    ptrecLotSummary.Quantity -= lrecItemLedger."Remaining Quantity";
                    if ((lrecItemLedger."Expiration Date" <> 0D) and
                       (ptrecLotSummary."Expiration Date" > lrecItemLedger."Expiration Date")) or
                       (ptrecLotSummary."Expiration Date" = 0D)
                    then
                        ptrecLotSummary."Expiration Date" := lrecItemLedger."Expiration Date";
                end;//if

            end;//while
        end;//if findset

        ptrecLotSummary.Insert();

        // sum up lot #'s in count lines
        lrecCountLine.SetCurrentKey("Item No.", "Variant Code", "Location Code", "Lot No.", "Recount Tag No.");
        lrecCountLine.SetRange("Item No.", pcodItemNo);
        lrecCountLine.SetRange("Location Code", pcodLocation);
        lrecCountLine.SetRange("Variant Code", pcodVariant);
        lrecCountLine.SetRange("Recount Tag No.", 0);
        lrecCountLine.SetRange("Count No.", pcodCountNo);

        if lrecCountLine.FindSet(false) then begin
            ldCountQty := 0;
            lcodLastLot := lrecCountLine."Lot No.";
            ldtExpiration := lrecCountLine."Expiration Date";
            repeat
                if lrecCountLine."Lot No." <> lcodLastLot then begin
                    // apply sum of lot qty to summary
                    setLotSummaryQty(ptrecLotSummary, pcodItemNo, lcodLastLot, ldCountQty, ldtExpiration);
                    ldCountQty := lrecCountLine.Quantity;
                    ldtExpiration := lrecCountLine."Expiration Date";
                end else begin
                    ldCountQty += lrecCountLine.Quantity;
                    if ((lrecCountLine."Expiration Date" <> 0D) and (ldtExpiration > lrecCountLine."Expiration Date")) or
                       (ldtExpiration = 0D)
                    then
                        ldtExpiration := lrecCountLine."Expiration Date";
                end;//if

                lcodLastLot := lrecCountLine."Lot No.";
            until lrecCountLine.Next() = 0;

            if ldCountQty <> 0 then
                setLotSummaryQty(ptrecLotSummary, pcodItemNo, lcodLastLot, ldCountQty, ldtExpiration);
        end;//if

        ptrecLotSummary.Reset();
    end;

    local procedure setLotSummaryQty(var ptrecLotSummary: Record "IWX Invt. Buffer"; pcodItemNo: Text; psLotNo: Text; pdQuantity: Decimal; pdtExpiration: Date)
    begin
        // Inserts or adds lot qty to a summary record - called from getLotNoDifferences

        psLotNo := UpperCase(psLotNo);

        ptrecLotSummary.SetRange("Lot No.", psLotNo);
        if ptrecLotSummary.FindFirst() then begin
            ptrecLotSummary.Quantity += pdQuantity;
            if ((pdtExpiration <> 0D) and (ptrecLotSummary."Expiration Date" > pdtExpiration))
               or (ptrecLotSummary."Expiration Date" = 0D)
            then
                ptrecLotSummary."Expiration Date" := pdtExpiration;

            ptrecLotSummary.Modify();
        end else begin
            ptrecLotSummary."Item No." := CopyStr(pcodItemNo, 1, MaxStrLen(ptrecLotSummary."Item No."));
            ptrecLotSummary."Lot No." := CopyStr(psLotNo, 1, MaxStrLen(ptrecLotSummary."Lot No."));
            ptrecLotSummary.Quantity := pdQuantity;
            ptrecLotSummary."Expiration Date" := pdtExpiration;
            ptrecLotSummary.Insert();
        end;//if
    end;

    /// <summary>
    /// Builds buffer of expected lot/serial numbers and compares to count
    /// - Negative qty in buffer means under-counted (extra in item ledger)
    /// - Positive means over-counted
    /// - 0 means evenly counted (no diff)
    /// </summary>
    /// <param name="pcodCountNo"></param>
    /// <param name="pcodItemNo"></param>
    /// <param name="pcodLocationCode"></param>
    /// <param name="pcodVariantCode"></param>
    /// <param name="ptrecLotSummary"></param>
    /// <param name="pdtAsOfDate"></param>
    procedure getItemTrackingDifferences(pcodCountNo: Code[20]; pcodItemNo: Text; pcodLocationCode: Code[10]; pcodVariantCode: Text; var ptrecLotSummary: Record "IWX Invt. Buffer" temporary; pdtAsOfDate: Date)
    var
        lqCountSummary: Query "IWX Count Line Track. Summary";
        lbWhseTracked: Boolean;
    begin
        ptrecLotSummary.Reset();
        ptrecLotSummary.DeleteAll();
        Clear(ptrecLotSummary);

        getLocation(pcodLocationCode);
        lbWhseTracked := (isWhseTracked(pcodItemNo) and recLocation."Bin Mandatory");

        if lbWhseTracked then begin
            getBinExpectedItemTracking(pcodItemNo, pcodLocationCode, pcodVariantCode, ptrecLotSummary, pdtAsOfDate);
        end else begin
            getILEExpectedItemTracking(pcodItemNo, pcodLocationCode, pcodVariantCode, ptrecLotSummary, pdtAsOfDate);
        end;//if

        // get count lines and merge data for comparison
        lqCountSummary.SetRange(Count_No, pcodCountNo);
        lqCountSummary.SetRange(Item_No, pcodItemNo);
        lqCountSummary.SetRange(Location_Code, pcodLocationCode);
        lqCountSummary.SetRange(Variant_Code, pcodVariantCode);

        if lqCountSummary.Open() then begin
            while lqCountSummary.Read() do begin
                setTrackingSummaryQty(ptrecLotSummary, pcodItemNo, lbWhseTracked,
                                      lqCountSummary.Bin_Code,
                                      lqCountSummary.Lot_No,
                                      lqCountSummary.Serial_No,
                                      lqCountSummary.Expiration_Date,
                                      lqCountSummary.Sum_Quantity_Base);
            end;//while read
        end;//if

        ptrecLotSummary.Reset();

    end;

    /// <summary>
    /// Inserts or adds lot qty to a summary record - called from getLotNoDifferences
    /// </summary>
    /// <param name="ptrecTrackSummary"></param>
    /// <param name="pcodItemNo"></param>
    /// <param name="pbWhseTracked"></param>
    /// <param name="pcodBinCode"></param>
    /// <param name="psLotNo"></param>
    /// <param name="psSerialNo"></param>
    /// <param name="pdtExpiration"></param>
    /// <param name="pdQuantity"></param>
    local procedure setTrackingSummaryQty(var ptrecTrackSummary: Record "IWX Invt. Buffer"; pcodItemNo: Text; pbWhseTracked: Boolean; pcodBinCode: Code[10]; psLotNo: Text; psSerialNo: Text; pdtExpiration: Date; pdQuantity: Decimal)
    begin
        psSerialNo := UpperCase(psSerialNo);
        psLotNo := UpperCase(psLotNo);

        ptrecTrackSummary.Reset();
        ptrecTrackSummary.SetRange("Lot No.", psLotNo);
        ptrecTrackSummary.SetRange("Serial No.", psSerialNo);
        if pbWhseTracked then
            ptrecTrackSummary.SetRange("Bin Code", pcodBinCode);

        if ptrecTrackSummary.FindFirst() then begin
            ptrecTrackSummary.Quantity += pdQuantity;
            if (pdtExpiration <> 0D) and (ptrecTrackSummary."Expiration Date" > pdtExpiration) then
                ptrecTrackSummary."Expiration Date" := pdtExpiration;

            ptrecTrackSummary.Modify();
        end else begin
            ptrecTrackSummary."Item No." := CopyStr(pcodItemNo, 1, MaxStrLen(ptrecTrackSummary."Item No."));
            ptrecTrackSummary."Lot No." := CopyStr(psLotNo, 1, MaxStrLen(ptrecTrackSummary."Lot No."));
            ptrecTrackSummary."Serial No." := CopyStr(psSerialNo, 1, MaxStrLen(ptrecTrackSummary."Serial No."));
            ptrecTrackSummary."Expiration Date" := pdtExpiration;
            if pbWhseTracked then
                ptrecTrackSummary."Bin Code" := pcodBinCode;

            ptrecTrackSummary.Quantity := pdQuantity;
            ptrecTrackSummary.Insert();
        end;//if
    end;

    /// <summary>
    /// Builds buffer of expected ILE lot/serial numbers and compares to count
    /// </summary>
    /// <param name="pcodItemNo"></param>
    /// <param name="pcodLocation"></param>
    /// <param name="pcodVariant"></param>
    /// <param name="ptrecLotSummary"></param>
    /// <param name="pdtAsOfDate"></param>
    procedure getILEExpectedItemTracking(pcodItemNo: Text; pcodLocation: Code[20]; pcodVariant: Text; var ptrecLotSummary: Record "IWX Invt. Buffer" temporary; pdtAsOfDate: Date)
    var
        lqILETrackQry: Query "IWX ILE Item Tracking Summary";
    begin
        lqILETrackQry.SetFilter(Item_No, pcodItemNo);
        lqILETrackQry.SetFilter(Location_Code, pcodLocation);
        lqILETrackQry.SetFilter(Variant_Code, pcodVariant);

        if pdtAsOfDate <> 0D then
            lqILETrackQry.SetRange(Posting_Date, 0D, pdtAsOfDate);

        if lqILETrackQry.Open() then begin
            ptrecLotSummary."Item No." := CopyStr(pcodItemNo, 1, MaxStrLen(ptrecLotSummary."Item No."));
            ptrecLotSummary."Location Code" := CopyStr(pcodLocation, 1, MaxStrLen(ptrecLotSummary."Location Code"));
            ptrecLotSummary."Variant Code" := CopyStr(pcodVariant, 1, MaxStrLen(ptrecLotSummary."Variant Code"));

            while lqILETrackQry.Read() do begin
                ptrecLotSummary."Serial No." := lqILETrackQry.Serial_No;
                ptrecLotSummary."Lot No." := lqILETrackQry.Lot_No;
                ptrecLotSummary."Expiration Date" := lqILETrackQry.Expiration_Date;
                ptrecLotSummary.Quantity := -lqILETrackQry.Quantity;
                if not ptrecLotSummary.Insert() then begin
                    // should only happen if expiration date is different
                    ptrecLotSummary.Quantity -= lqILETrackQry.Quantity;
                    ptrecLotSummary.Modify();
                end;//if
            end;//while read
        end;//Open Query


    end;

    /// <summary>
    /// Builds buffer of expected lot/serial numbers by bin
    /// </summary>
    /// <param name="pcodItemNo"></param>
    /// <param name="pcodLocation"></param>
    /// <param name="pcodVariant"></param>
    /// <param name="ptrecLotSummary"></param>
    /// <param name="pdtAsOfDate"></param>
    procedure getBinExpectedItemTracking(pcodItemNo: Text; pcodLocation: Code[10]; pcodVariant: Text; var ptrecLotSummary: Record "IWX Invt. Buffer" temporary; pdtAsOfDate: Date)
    var
        lqBinTrackQry: Query "IWX Whse. Item Track. Summary";
    begin
        lqBinTrackQry.SetFilter(Item_No, pcodItemNo);
        lqBinTrackQry.SetFilter(Location_Code, pcodLocation);
        lqBinTrackQry.SetFilter(Variant_Code, pcodVariant);

        if pdtAsOfDate <> 0D then
            lqBinTrackQry.SetRange(Registering_Date, 0D, pdtAsOfDate);

        if lqBinTrackQry.Open() then begin
            ptrecLotSummary.Init();
            ptrecLotSummary."Item No." := CopyStr(pcodItemNo, 1, MaxStrLen(ptrecLotSummary."Item No."));
            ptrecLotSummary."Location Code" := pcodLocation;
            ptrecLotSummary."Variant Code" := CopyStr(pcodVariant, 1, MaxStrLen(ptrecLotSummary."Variant Code"));

            while lqBinTrackQry.Read() do begin

                ptrecLotSummary."Serial No." := lqBinTrackQry.Serial_No;
                ptrecLotSummary."Lot No." := lqBinTrackQry.Lot_No;
                ptrecLotSummary."Expiration Date" := lqBinTrackQry.Expiration_Date;
                ptrecLotSummary."Bin Code" := lqBinTrackQry.Bin_Code;
                ptrecLotSummary.Quantity := -lqBinTrackQry.Quantity;

                if not ptrecLotSummary.Insert() then begin
                    // should only happen if expiration date is different
                    ptrecLotSummary.Quantity -= lqBinTrackQry.Quantity;
                    ptrecLotSummary.Modify();
                end;//if
            end;//while read
        end;//Open Query
    end;

    local procedure getLocation(pcodLocation: Code[20])
    begin
        // Returns location record
        if recLocation.Code <> pcodLocation then
            recLocation.Get(pcodLocation);
    end;

    procedure addRecountLines(var precCountLines: Record "IWX Count Sheet Line"; pcodCountNo: Code[20]; pcodSheetName: Code[20])
    var
        ltcNoFilterErr: Label 'Record must be filtered.';
        ldlgProgress: Dialog;
        ltcProgressTxt: Label 'Creating recount lines...\Tag No.  #1#########\Item No. #2#########\Progress @3@@@@@@@@@@@@', Comment = '%1 = The tag number; %2 = The Item number; %3 = The progress pecentage;';
        lnCount: Integer;
        lnRecord: Integer;
    begin
        // Adds recount lines for each record in the provided record param

        recCountSheetCfg.Reset();
        recCountSheetCfg.SetRange("Count No.", pcodCountNo);

        if pcodSheetName = '' then
            pcodSheetName := lookupSheetName(true);

        if precCountLines.GetFilters = '' then
            Error(ltcNoFilterErr);

        precCountLines.SetCurrentKey("Count No.", "Tag No.");

        if precCountLines.FindSet() then begin
            ldlgProgress.Open(ltcProgressTxt);
            lnCount := precCountLines.Count;

            repeat
                addRecountLine(precCountLines, pcodCountNo, pcodSheetName);
                lnRecord += 10000;
                ldlgProgress.Update(1, precCountLines."Tag No.");
                ldlgProgress.Update(2, precCountLines."Item No.");
                ldlgProgress.Update(3, lnRecord div lnCount);
            until (precCountLines.Next() = 0) or (lnRecord = lnCount * 10000);

            ldlgProgress.Close();
        end;//if
    end;

    procedure addRecountLine(var precCountLine: Record "IWX Count Sheet Line"; pcodCountNo: Code[20]; pcodSheetName: Code[20])
    var
        lrecRecountLine: Record "IWX Count Sheet Line";
        ltcRecountExistsErr: Label 'Recount Tag [%1] already exists for this line.  If additional recount is required, create a recount for tag [%1].', Comment = '%1 = The Tag number';
        ltcKitItemErr: Label 'You cannot create a recount line for a Torqued Item.\Create the recount for the assembly instead.';
    begin
        // Adds a single recount line for supplied line

        if precCountLine."Recount Tag No." <> 0 then
            Error(ltcRecountExistsErr, precCountLine."Recount Tag No.");

        if precCountLine."WMDM Kit Item" then
            Error(ltcKitItemErr);

        if pcodSheetName = '' then
            pcodSheetName := lookupSheetName(true);

        lrecRecountLine := precCountLine;

        lrecRecountLine."Count No." := pcodCountNo;

        lrecRecountLine.Validate("Tag No.", getNextTagNo(pcodCountNo));

        lrecRecountLine."Recount Source Tag No." := precCountLine."Tag No.";
        lrecRecountLine.resetLine();
        lrecRecountLine."Count No." := pcodCountNo;
        lrecRecountLine."Sheet Name" := pcodSheetName;
        lrecRecountLine.Insert();

        precCountLine."Recount Tag No." := lrecRecountLine."Tag No.";
        precCountLine.Modify();

        if precCountLine."WMDM Kit Assembly" then begin
            // if kit assembly, create recount lines for kit items that point back to original assembly tag no.
            addKitRecountLines(lrecRecountLine);
        end;//if
    end;


    procedure addKitRecountLines(precRecountLine: Record "IWX Count Sheet Line")
    begin
        // Inserts a new torqued item recount entry into the count sheet
        // Kits are not supported in NAV 2013 and newer
    end;

    procedure lookupSheetName(pbShowError: Boolean) rcodSheetName: Code[20]
    var
        ltcSelectSheetErr: Label 'You must select a sheet name.';
    begin
        // Returns user-selected sheet name

        if PAGE.RunModal(PAGE::"IWX Count Sheet Configuration", recCountSheetCfg) = ACTION::LookupOK then
            exit(recCountSheetCfg."Sheet Name")
        else
            Error('');

        if pbShowError then
            Error(ltcSelectSheetErr);
    end;

    procedure lookupBatchName(var txtBatch: Text[1024]; codTemplate: Code[20]): Boolean
    var
        lrecJnlBatch: Record "Item Journal Batch";
        lpgJnlBatch: Page "Item Journal Batches";
    begin
        // Displays item journal batch form for looking up a batch name
        Clear(lpgJnlBatch);
        lpgJnlBatch.LookupMode := true;
        lrecJnlBatch.SetRange("Journal Template Name", codTemplate);
        lpgJnlBatch.SetTableView(lrecJnlBatch);

        if lpgJnlBatch.RunModal() = ACTION::LookupOK then begin
            lpgJnlBatch.GetRecord(lrecJnlBatch);
            txtBatch := lrecJnlBatch.Name;
            exit(true);
        end;

        exit(false);
    end;

    local procedure getCountConfig(pcodCountNo: Code[20]; pcodSheetName: Code[20])
    begin
        // Gets config record
        if recInvCountHeader."No." <> pcodCountNo then
            recInvCountHeader.Get(pcodCountNo);

        if (recCountSheetCfg."Count No." <> pcodCountNo) or
           (recCountSheetCfg."Sheet Name" <> pcodSheetName)
        then
            recCountSheetCfg.Get(pcodCountNo, pcodSheetName);
    end;

    procedure showCountLines(pcodCountNo: Code[20]; pcodSheetName: Code[20])
    var
        lrecCountLine: Record "IWX Count Sheet Line";
    begin
        // Launches the Count Lines form.  Filtered by sheet name
        // and count no. if applicable.
        if (pcodCountNo <> '') then begin
            lrecCountLine.SetRange("Count No.", pcodCountNo);
        end;
        if (pcodSheetName <> '') then begin
            lrecCountLine.SetRange("Sheet Name", pcodSheetName);
        end;

        PAGE.RunModal(PAGE::"IWX Count Sheet Lines", lrecCountLine);
    end;

    procedure updateKitCountLines(precCountLine: Record "IWX Count Sheet Line"; pdDeltaQty: Decimal) rbIsAssembly: Boolean
    begin
        // Adds (or updates) count sheet lines for torqued components based on "master" torque line
        // called from count sheet line table triggers to manage insert/modify/delete operations
        exit(false);
    end;

    procedure insertNewKitCountLine(precCountLine: Record "IWX Count Sheet Line"; precTorqueEntry: Integer; pdDeltaQty: Decimal)
    begin
        // Inserts a new torqued item entry into the count sheet
        // Kits are not supported in NAV 2013 and newer
    end;

    procedure isItemTracked(pcodItemNo: Text): Boolean
    begin
        // Returns true if item tracking defined for item.
        // Function called by more specific is*Tracked functions below

        if recItemForTracking."No." <> pcodItemNo then
            recItemForTracking.Get(pcodItemNo);
        if recItemForTracking."Item Tracking Code" = '' then
            exit(false);

        // cache data
        if recItemTrackingCode.Code <> recItemForTracking."Item Tracking Code" then
            recItemTrackingCode.Get(recItemForTracking."Item Tracking Code");

        exit(true);
    end;

    procedure isLotWhseTracked(pcodItemNo: Text): Boolean
    begin
        // Returns true if item lot number is tracked by bin
        if not isItemTracked(pcodItemNo) then
            exit(false);

        exit(recItemTrackingCode."Lot Warehouse Tracking");
    end;

    procedure isLotJnlTracked(pcodItemNo: Text): Boolean
    begin
        // Returns true if item lot number is required on journal
        if not isItemTracked(pcodItemNo) then
            exit(false);

        exit(
          recItemTrackingCode."Lot Pos. Adjmt. Inb. Tracking" or
          recItemTrackingCode."Lot Pos. Adjmt. Outb. Tracking" or
          recItemTrackingCode."Lot Neg. Adjmt. Inb. Tracking" or
          recItemTrackingCode."Lot Neg. Adjmt. Outb. Tracking"
        );
    end;

    procedure isSNWhseTracked(pcodItemNo: Text): Boolean
    begin
        // Returns true if item serial number is tracked by bin
        if not isItemTracked(pcodItemNo) then
            exit(false);

        exit(recItemTrackingCode."SN Warehouse Tracking");
    end;

    procedure isSNJnlTracked(pcodItemNo: Text): Boolean
    begin
        // Returns true if item serial number is required on journal
        if not isItemTracked(pcodItemNo) then
            exit(false);

        exit(
          recItemTrackingCode."SN Pos. Adjmt. Inb. Tracking" or
          recItemTrackingCode."SN Pos. Adjmt. Outb. Tracking" or
          recItemTrackingCode."SN Neg. Adjmt. Inb. Tracking" or
          recItemTrackingCode."SN Neg. Adjmt. Outb. Tracking"
        );
    end;

    procedure isWhseTracked(pcodItemNo: Text): Boolean
    begin
        // Returns true if item lot number is tracked by bin
        if not isItemTracked(pcodItemNo) then
            exit(false);

        exit(recItemTrackingCode."Lot Warehouse Tracking" or recItemTrackingCode."SN Warehouse Tracking");
    end;

    procedure postSheet(pcodPDAConfig: Code[20]; pcodLocation: Code[10]; pcodCountNo: Code[20]; pcodSheetName: Code[20]; pdtPostDate: Date; pcodInvBatch: Code[10]; pcodWhseInvBatch: Code[10]; var pbWhsePosted: Boolean; var pbItemJnlPosted: Boolean)
    var
        lrecItemJnl: Record "Item Journal Line";
        lrecCountSheet: Record "IWX Count Sheet Configuration";
        lrecWhseJournalLine: Record "Warehouse Journal Line";
        lrecLocation: Record Location;
        lrecCountHeader: Record "IWX Inventory Count Header";
        lrepCountToJnl: Report "IWX Count Sheet to Journals";
        lcuItemPost: Codeunit "Item Jnl.-Post Batch";
        lcuItemJnlMgmt: Codeunit ItemJnlManagement;
        lcuWhseJnlReg: Codeunit "Whse. Jnl.-Register Batch";
        lbJnlSelected: Boolean;
#if V19_OR_HIGHER
        leWhseJnlTemplateType: Enum "Warehouse Journal Template Type";
#else
        lbJournalSelected: Boolean;
#endif
    begin
        // Allows automated posting of a specific count sheet
        // does not support reclass or consumption posting
        //
        // This is specifically intended for posting from a scanner.
        //
        // first check the sheet and make sure it's not already posted.
        lrecCountSheet.SetCurrentKey("Count No.", "Sheet Name");
        lrecCountSheet.Get(pcodCountNo, pcodSheetName);
        if (lrecCountSheet."Posted by PDA" <> '') then begin
            Error(tcAlreadyPostedByPDAErr, pcodCountNo, pcodSheetName, lrecCountSheet."Posted by PDA");
        end;


        lrecCountHeader.Reset();
        lrecCountHeader.Get(pcodCountNo);


        // this will set defaults based on the count
        lrepCountToJnl.setCurCountNo(pcodCountNo);

        lrepCountToJnl.prepareAutoTransfer(
          pcodCountNo,
          pcodSheetName,
          pcodLocation,  // location   //
          pcodInvBatch,
          lrecCountHeader."Consumption Journal Batch", // consumption batch
          pcodWhseInvBatch, //pcodWhseBatch, //
          lrecCountHeader."Set Item Tracking Lines",
          lrecCountHeader."Reclass. Journal Batch",
          lrecCountHeader."Use Batch Document Nos.",
          Today,
          pdtPostDate
        );
        //
        lrepCountToJnl.UseRequestPage(false);

        lrepCountToJnl.RunModal();

        pbWhsePosted := false;
        pbItemJnlPosted := false;

        lrecLocation.Get(pcodLocation);
        if (lrecLocation."Directed Put-away and Pick") then begin
            lrecWhseJournalLine.Reset();
            lrecWhseJournalLine.SetRange(lrecWhseJournalLine."Journal Batch Name", pcodWhseInvBatch);

            // lbJournalSelected is set by TemplateSelection
            //
#if V19_OR_HIGHER
                lrecWhseJournalLine.TemplateSelection(PAGE::"Whse. Phys. Invt. Journal", leWhseJnlTemplateType::"Physical Inventory", lrecWhseJournalLine);
#else
            //lrecWhseJournalLine.TemplateSelection(PAGE::"Whse. Phys. Invt. Journal", 1, lrecWhseJournalLine, lbJournalSelected);
#endif
            lrecWhseJournalLine.OpenJnl(pcodWhseInvBatch, pcodLocation, lrecWhseJournalLine);
            lrecWhseJournalLine.SetFilter("Item No.", '<>%1', '');
            if (lrecWhseJournalLine.Find('-')) then begin
                lcuWhseJnlReg.Run(lrecWhseJournalLine);
                pbWhsePosted := true;
            end;
        end; // if directed pick.


        // select journal template and batch
        lcuItemJnlMgmt.TemplateSelection(PAGE::"Phys. Inventory Journal", 2, false, lrecItemJnl, lbJnlSelected);
        lcuItemJnlMgmt.OpenJnl(pcodInvBatch, lrecItemJnl);
        if (lrecItemJnl.Find('-')) then begin
            // post batch
            lcuItemPost.Run(lrecItemJnl);
            pbItemJnlPosted := true;
        end;


        // mark this sheet as 'posted'
        lrecCountSheet.SetCurrentKey("Count No.", "Sheet Name");
        lrecCountSheet.Get(pcodCountNo, pcodSheetName);
        lrecCountSheet."Posted by PDA" := CopyStr(pcodPDAConfig, 1, MaxStrLen(lrecCountSheet."Posted by PDA"));
        lrecCountSheet.Modify(false);

        // if all sheets are posted, then de-activate this count.
        lrecCountSheet.Reset();
        lrecCountSheet.SetRange("Count No.", pcodCountNo);
        lrecCountSheet.SetFilter("Posted by PDA", '=%1', '');
        if (lrecCountSheet.IsEmpty()) then begin
            lrecCountHeader.Reset();
            lrecCountHeader.SetCurrentKey("No.");
            lrecCountHeader.Get(pcodCountNo);
            lrecCountHeader.Active := false;
            lrecCountHeader.Modify(false);
        end;

    end;

    procedure getLastDifferences(var pdLastDiffQty: Decimal; var pdLastDiffAmt: Decimal; var pdLastAbsDiffQty: Decimal; var pdLastAbsDiffAmt: Decimal; var pdLastInvValue: Decimal)
    begin
        // Returns the results of the last roll-up
        pdLastDiffQty := dLastDiffQty;
        pdLastDiffAmt := dLastDiffAmt;
        pdLastAbsDiffQty := dLastAbsDiffQty;
        pdLastAbsDiffAmt := dLastAbsDiffAmt;
        pdLastInvValue := dLastInvValue;
    end;

    procedure getNextTagNo(pcodCountNo: Code[20]): Integer
    var
        lrecCountSheetLine: Record "IWX Count Sheet Line";
    begin
        // Cache the tag no. so line generation faster
        if (iNextTagNo = 0) then begin
            if (pcodCountNo <> '') then begin
                lrecCountSheetLine.SetRange("Count No.", pcodCountNo);
            end;

            lrecCountSheetLine.SetCurrentKey("Count No.", "Tag No.");
            if lrecCountSheetLine.FindLast() then begin
                iNextTagNo := lrecCountSheetLine."Tag No.";
            end;
        end;

        iNextTagNo += 1;
        exit(iNextTagNo);
    end;

    procedure setOldestEntryDateEmptyBins(pdtOldestAllowedWhseEntry: Date)
    begin
        // Sets the oldest allowed date for warehouse entries when additem
        // items from insertCountSheetLine
        dtOldestAllowedEntryZeroBin := pdtOldestAllowedWhseEntry;
    end;

    local procedure getInvSetup()
    begin
        // Gets/caches Count Setup record
        if recInvCountSetup."Inventory Count Nos." = '' then
            recInvCountSetup.Get();
    end;
}

