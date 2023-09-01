report 52601 "ORB IWX Create Count Sheets"
{
    Caption = 'Generate Count Sheets';
    ProcessingOnly = true;

    dataset
    {
        dataitem(recConfig; "IWX Count Sheet Configuration")
        {
            DataItemTableView = SORTING("Count No.");
            RequestFilterFields = "Sheet Name";
            dataitem(recItem; Item)
            {
                DataItemTableView = SORTING("Shelf No.");


                trigger OnAfterGetRecord()
                begin
                    updateDialogItem(recItem."No.");

                    recVariant.SetRange("Item No.", recItem."No.");

                    if recLocation.Find('-') then begin
                        repeat
                            evaluateLocation(recLocation.Code);
                        until recLocation.Next() = 0;
                    end;

                    if recConfig."Location Code" = '' then begin
                        evaluateLocation('');
                    end;
                end;

                trigger OnPostDataItem()
                begin
                    if bGenerateRandom then
                        addRandomItems();
                end;

                ///
                /// Filters item records based on count sheet specs.
                ///
                trigger OnPreDataItem()
                begin
                    // don't look at inventory if it's a WIP sheet
                    if recConfig."WIP Only" then begin
                        nItemCount := 0;
                        CurrReport.Break();
                    end;

                    recItem.Reset();
                    recItem.SetView(buildItemFilter(recConfig));

                    recItem.SetFilter("Date Filter", '<=%1', recInvCount."Inventory As of Date");

                    if codCountPeriod <> '' then begin
                        recItem.SetFilter("Phys Invt Counting Period Code", codCountPeriod);
                    end;//if

                    if recConfig."Location Code" <> '' then
                        recLocation.SetFilter(Code, recConfig."Location Code")
                    else
                        recLocation.SetRange(Code);

                    nItemCount := recItem.Count;
                    nCurItem := 0;


                    // Skip item processing if SKUs are being used
                    if bUseSKU then
                        CurrReport.Break();


                    // If bin content records exist, use those instead of items
                    if recLocation.FindSet() then;
                    if (recLocation.Count = 1) and (recLocation."Bin Mandatory") then
                        CurrReport.Break();
                end;
            }
            dataitem(diSKU; "Stockkeeping Unit")
            {
                DataItemLink = "Location Code" = FIELD("Location Code");
                DataItemTableView = SORTING("Item No.", "Location Code", "Variant Code");

                ///
                /// Iterates through locations to build count sheet
                ///
                trigger OnAfterGetRecord()
                begin
                    recItem.Get(diSKU."Item No.");

                    updateDialogItem(recItem."No.");
                    addSheetItem(diSKU."Location Code", diSKU."Variant Code");
                end;

                ///
                /// Process random SKUs
                ///
                trigger OnPostDataItem()
                begin
                    if bGenerateRandom and bUseSKU then
                        addRandomItems();
                end;

                ///
                /// Process SKUs
                ///
                trigger OnPreDataItem()
                begin
                    if not bUseSKU then
                        CurrReport.Break();

                    setSKUFilter(recConfig);

                    if codCountPeriod <> '' then
                        diSKU.SetFilter("Phys Invt Counting Period Code", codCountPeriod);

                    nItemCount := diSKU.Count;
                    nCurItem := 0;

                    // If bin content records exist, use those instead of items
                    if (recLocation.Count = 1) and (recLocation."Bin Mandatory") then
                        CurrReport.Break();
                end;
            }
            dataitem(recBinContent; "Bin Content")
            {
                DataItemTableView = SORTING("Location Code", "Bin Code", "Item No.", "Variant Code", "Unit of Measure Code");

                trigger OnAfterGetRecord()
                begin
                    updateDialogItem(recBinContent."Item No.");

                    // ignore different UOMs (group by item, variant, bin)
                    if (recItem."No." <> recBinContent."Item No.") or
                       (codCurBin <> recBinContent."Bin Code") or
                       (codCurVariant <> recBinContent."Variant Code") or
                        (CodCurZone <> recBinContent."Zone Code") // Zone Filter
                    then begin
                        recItem.SetRange("No.", recBinContent."Item No.");
                        if recItem.FindFirst() then begin
                            codCurBin := recBinContent."Bin Code";
                            CodCurZone := recBinContent."Zone Code"; //Zone Filter
                            codCurVariant := recBinContent."Variant Code";
                            addSheetItem(recBinContent."Location Code", codCurVariant);
                        end;//if got item based on filters
                    end;//if
                end;

                trigger OnPostDataItem()
                begin
                    if bGenerateRandom and bUseBin then
                        addRandomItems();
                end;

                ///
                /// Iterates through bin contents to generate count sheets instead of using items
                ///
                trigger OnPreDataItem()
                begin
                    bUseBin := false;

                    if (recLocation.Count <> 1) or (recLocation."Bin Mandatory" = false) then
                        CurrReport.Break();

                    setBinFilter(recConfig);

                    nItemCount := recBinContent.Count;
                    nCurItem := 0;
                    bUseBin := true;
                end;
            }
            dataitem(recProdOrderLine; "Prod. Order Line")
            {
                DataItemTableView = SORTING(Status, "Prod. Order No.", "Line No.") WHERE(Status = CONST(Released), "Remaining Qty. (Base)" = FILTER(> 0));

                ///
                /// Iterates through ledger entries for this W/O and sum all consumption by part #/location
                ///
                trigger OnAfterGetRecord()
                var
                    lrecCurItem: Record Item;
                begin
                    updateDialogItem(recProdOrderLine."Prod. Order No.");

                    trecBuffer.DeleteAll();

                    // create sheet lines for actual consumption
                    recItemLedger.SetRange("Entry Type", recItemLedger."Entry Type"::Consumption);
                    recItemLedger.SetRange("Order Type", recItemLedger."Order Type"::Production);
                    recItemLedger.SetFilter("Order No.", '=%1', recProdOrderLine."Prod. Order No.");
                    if recItemLedger.FindSet() then begin
                        repeat
                            populateBuffer(recItemLedger."Item No.",
                                           recItemLedger."Location Code",
                                           recItemLedger."Variant Code",
                                           -recItemLedger.Quantity,
                                           recProdOrderLine."Prod. Order No.");
                        until recItemLedger.Next() = 0;
                    end;//if got consumption entries

                    if bIncludeUnconsumed then begin
                        // if we want all W/O material, no iterate through BOM and sum remaining, unconsumed material
                        recProdOrderComp.SetFilter("Prod. Order No.", '=%1', recProdOrderLine."Prod. Order No.");
                        recProdOrderComp.SetRange(recProdOrderComp."Act. Consumption (Qty)", 0); // items not consumed
                        if recProdOrderComp.FindSet() then begin
                            repeat
                                populateBuffer(recProdOrderComp."Item No.",
                                               recProdOrderComp."Location Code",
                                               recProdOrderComp."Variant Code",
                                               recProdOrderComp."Expected Qty. (Base)",
                                               recProdOrderComp."Prod. Order No.");
                            until recProdOrderComp.Next() = 0;
                        end;//if got comp
                    end;//if include unconsumed

                    trecBuffer.Reset();
                    // insert buffer lines for this W/O into count sheet
                    if trecBuffer.FindSet() then begin
                        repeat
                            lrecCurItem.Get(trecBuffer."Item No.");
                            cuInvMgmt.insertCountSheetLine(lrecCurItem,
                                                 recConfig."Count No.",
                                                 recConfig."Sheet Name",
                                                 trecBuffer."Location Code",
                                                 trecBuffer."Variant Code",
                                                 CopyStr(trecBuffer."Serial No.", 1, 20),
                                                 recConfig."Bin Code",
                                                 recConfig."ORB Zone Code"
                                                 );
                        until trecBuffer.Next() = 0;
                    end;//if buffer
                end;

                trigger OnPostDataItem()
                begin
                    nCurSheet := nCurSheet + 1;
                end;

                ///
                /// Sets up dialog params for work orders
                ///
                trigger OnPreDataItem()
                begin
                    // only iterate through production orders if it's a WIP sheet
                    if not recConfig."WIP Only" then begin
                        CurrReport.Break();
                    end;

                    nItemCount := recProdOrderLine.Count;
                    nCurItem := 0;
                end;
            }
            dataitem(recBlankLines; "Integer")
            {
                DataItemTableView = SORTING(Number);

                trigger OnAfterGetRecord()
                begin
                    // create blank lines for count sheet
                    recCountSheet.Init();

                    recCountSheet.Validate("Tag No.", cuInvMgmt.getNextTagNo(recConfig."Count No."));

                    recCountSheet."Count No." := recConfig."Count No.";
                    recCountSheet."Sheet Name" := recConfig."Sheet Name";
                    recCountSheet."Auto Generated" := true;
                    recCountSheet.Insert();
                end;

                trigger OnPreDataItem()
                begin
                    SetRange(Number, 1, 0);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                codCurBin := recConfig."Bin Code";
                CodCurZone := recConfig."ORB Zone Code"; //Zone Filter

                trecRandomInvBuf.Reset();
                trecRandomInvBuf.DeleteAll();
                Clear(trecRandomInvBuf);

                // delete any old entries for this sheet only
                recCountSheet.Reset();
                recCountSheet.SetRange("Count No.", codCountNo);
                recCountSheet.SetRange("Sheet Name", recConfig."Sheet Name");
                recCountSheet.disableConfirmDelete(true);
                if recCountSheet.FindSet() then
                    repeat
                        recCountSheet.performOnDelete();
                    until recCountSheet.Next() = 0;

                recCountSheet.DeleteAll();
                Commit();

                dlgProgress.Update(1, recConfig."Sheet Name");
            end;

            trigger OnPostDataItem()
            var
                lcuBlockBin: Codeunit "IWX Block Bin Management";
            begin
                lcuBlockBin.blockCountBins(codCountNo);

                dlgProgress.Close();
            end;

            ///
            /// Prepares report - deletes old entries
            ///
            trigger OnPreDataItem()
            begin
                // make sure only one count specified
                codCountNo := CopyStr(GetFilter("Count No."), 1, 20);
                recInvCount.Get(codCountNo);
                recInvCount.TestField(Active);
                recInvCount."Last Count Sheet Generation" := CurrentDateTime;
                recInvCount."Generated By" := CopyStr(UserId(), 1, MaxStrLen(recInvCount."Generated By"));
                recInvCount.Modify();

                recCountSheet.SetRange("Count No.", codCountNo);

                if not recConfig.Find('-') then
                    Error(txtNoConfigErr);

                if bDeleteOldSheets then begin
                    if recCountSheet.FindSet() then
                        if not Confirm(txtConfirmSheetDeleteQst) then
                            Error(txtNoDeleteErr);

                    recCountSheet.Reset();
                    recCountSheet.SetRange("Count No.", codCountNo);
                    if recCountSheet.FindSet() then
                        recCountSheet.DeleteAll();
                    Commit();
                end//if

                else begin
                    recCountSheet.SetFilter("Sheet Name", recConfig.GetFilter("Sheet Name"));
                    if recCountSheet.FindSet() then begin
                        if not Confirm(txtConfirmSheetUpdateQst) then begin
                            Error(txtNoUpdateErr);
                        end; // end confirm
                    end;
                end;

                // When including items from inventory, see if the zero bin formula date is set
                // if it is, restrict empty bins
                if (Format(dfZeroBinFormula) <> '') then begin
                    dtBinsEmptySince := CalcDate('-' + Format(dfZeroBinFormula), Today);
                    cuInvMgmt.setOldestEntryDateEmptyBins(CalcDate('-' + Format(dfZeroBinFormula), Today));
                end;



                dlgProgress.Open(txtProgressMsg);
                nSheetCount := recConfig.Count;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    Visible = false;
                }
                group("Inventory Options")
                {
                    Caption = 'Inventory Options';
                    field(fldIncludeInventory; bIncludeInventory)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Include Inventory';
                        ToolTip = 'When set, all items that have inventory and match the sheet filters are added to the sheet.';
                    }
                    field(flddfZeroBinFormula; dfZeroBinFormula)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Empty Bins Activity Period';
                        ToolTip = 'Reminder: When bin content is empty, if there is activity for an item from this period until now  then the count line will still be added.  If the bin content is empty but the item has no activity earlier than this period then the bin will not be added.';
                        Enabled = bIncludeInventory;
                    }
                    field(fldIncludeActive; bIncludeActive)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Include Active Items';
                        ToolTip = 'Adds all items that have had activity within the Activity Period, even if the current inventory level is zero.';

                        trigger OnValidate()
                        begin
                            RequestOptionsPage.Update(true);
                        end;
                    }
                    field(fldActivityPeriod; dfActivityPeriod)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Activity Period';
                        ToolTip = 'Activity period to filter by';
                        Enabled = bIncludeActive;
                    }
                    field(fldIncludeInActive; bIncludeAll)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Include Inactive Items';
                        ToolTip = 'Adds all items. You can further filter these by variant or location.';

                        trigger OnValidate()
                        begin
                            RequestOptionsPage.Update(true);
                        end;
                    }
                    field(fldLocationFilter; codLocationFilter)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Location Filter';
                        ToolTip = 'The location to filter by';
                        Enabled = bIncludeAll;
                    }
                    field(fldVariantFilter; codVariantFilter)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Variant Filter';
                        ToolTip = 'The variant to filter by';
                        Enabled = bIncludeAll;
                    }
                    field("Use SKUs Only"; bUseSKU)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Use SKUs Only';
                        ToolTip = 'Base count sheet lines on skus';
                    }
                }
                group("Cycle Count")
                {
                    Caption = 'Cycle Count';
                    field(fldRestrictCount; codCountPeriod)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Restrict to Count Period';
                        ToolTip = 'Limits the sheets to items with the specified Inventory Count Period Code';
                        TableRelation = "Phys. Invt. Counting Period".Code;
                    }
                    field(bUseNextCountPeriod; UseNextCountPeriod)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Use Next Count Period';
                        ToolTip = 'If set, this will add only the items or SKUs with a Next Counting Period that matches the current work date.';
                    }
                    field(fldUseRandom; bGenerateRandom)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Use Random Items';
                        ToolTip = 'When checked, includes items on the bill that have not been consumed';

                        trigger OnValidate()
                        begin
                            RequestOptionsPage.Update(true);
                        end;
                    }
                    field(optRandomBinSel; RandomBinSel)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Generate Random Lines By';
                        ToolTip = 'Indicate the type of random bins to generate by.';
                        Enabled = bGenerateRandom;
                        OptionCaption = 'Item,Item and Bin';
                    }
                    field(fldMaxItemNos; nNumRandom)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Max. Item No.s to Add';
                        ToolTip = 'The maximum number of random items. Note that you can have more count lines than this value, since each item may have multiple lines.';
                        Enabled = bGenerateRandom;
                    }
                    field(fldNotCountedSince; dtRandomSince)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Not Counted Since';
                        ToolTip = 'This option works with the Use Random Items option to restrict the list of items to only those that have not been counted since the specified date.';
                        Enabled = bGenerateRandom;
                    }
                }
                group(Miscellaneous)
                {
                    Caption = 'Miscellaneous';
                    field(fldDeleteOldSheets; bDeleteOldSheets)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Delete ALL Old Sheets';
                        ToolTip = 'Deletes count lines on every sheet on the count';
                    }
                    field(fldIncludeAllBOM; bIncludeUnconsumed)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Include All BOM Items';
                        ToolTip = 'When checked, includes items on the bill that have not been consumed';
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        Randomize();
    end;



    /// <summary>
    /// Iterates through each variant for this location to build sheet
    /// </summary>
    /// <param name="codLocation"></param>
    procedure evaluateLocation(codLocation: Code[10])
    begin
        recVariant.SetFilter(Code, codVariantFilter);
        if recVariant.FindSet() then begin
            repeat
                addSheetItem(codLocation, recVariant.Code);
            until recVariant.Next() = 0;
        end; // if there are variants

        if (codVariantFilter = '') then begin
            addSheetItem(codLocation, '');
        end;
    end;

    /// <summary>
    /// This func adds item #'s (etc.) to the count sheet table
    /// </summary>
    /// <param name="codLocation"></param>
    /// <param name="codVariant"></param>
    procedure addSheetItem(codLocation: Code[10]; codVariant: Text)
    var
        lrecItemLedger: Record "Item Ledger Entry";
        lbAdded: Boolean;
        ldStartDate: Date;
        ldEndDate: Date;
    begin
        // Check to see if this count is within the next count period for the item
        if UseNextCountPeriod then begin
            if bUseSKU then begin

                ldStartDate := diSKU."Next Counting Start Date";
                ldEndDate := diSKU."Next Counting End Date";
                if not isDateInRange('', ldStartDate, ldEndDate) then
                    exit;
            end else begin
                ldStartDate := recItem."Next Counting Start Date";
                ldEndDate := recItem."Next Counting End Date";
                if not isDateInRange('', ldStartDate, ldEndDate) then
                    exit;
            end;//if item only (no sku)
        end;//f


        if bIncludeInventory then begin

            // do inventory
            recItem.SetRange("Location Filter", codLocation);
            recItem.SetFilter("Variant Filter", '=%1', codVariant);
            recItem.CalcFields("Net Change");
            if recItem."Net Change" <> 0 then begin
                insertCountSheetLine(codLocation, codVariant);
                lbAdded := true; // added part, so skip check for active parts
            end;//if

        end;

        if not lbAdded and bIncludeActive then begin
            // do activity
            lrecItemLedger.SetRange("Item No.", recItem."No.");
            lrecItemLedger.SetRange("Location Code", codLocation);
            lrecItemLedger.SetFilter("Variant Code", '=%1', codVariant);
            lrecItemLedger.SetRange("Posting Date", CalcDate('-' + Format(dfActivityPeriod), Today), Today);
            if (not lrecItemLedger.IsEmpty()) then begin
                insertCountSheetLine(codLocation, codVariant);
                lbAdded := true;
            end;//if
        end;//includActive

        if not lbAdded and bIncludeAll then begin
            if ((StrPos(codLocationFilter, codLocation) <> 0) or (codLocationFilter = '')) and
               ((StrPos(codVariantFilter, codVariant) <> 0) or (codVariantFilter = ''))
            then
                insertCountSheetLine(codLocation, codVariant);
        end;//includeInactive

    end;

    /// <summary>
    /// Adds item to count sheet depending on whether random or not
    /// </summary>
    /// <param name="pcodLocation"></param>
    /// <param name="pcodVariant"></param>
    local procedure insertCountSheetLine(pcodLocation: Code[10]; pcodVariant: Text)
    begin
        if bGenerateRandom then begin
            trecRandomInvBuf."Item No." := recItem."No.";
            trecRandomInvBuf."Location Code" := pcodLocation;
            trecRandomInvBuf."Variant Code" := CopyStr(pcodVariant, 1, MaxStrLen(trecRandomInvBuf."Variant Code"));
            trecRandomInvBuf."Bin Code" := CopyStr(codCurBin, 1, MaxStrLen(trecRandomInvBuf."Bin Code"));
            trecRandomInvBuf."ORB Zone Code" := CopyStr(CodCurZone, 1, MaxStrLen(trecRandomInvBuf."ORB Zone Code")); //Zone Filter

            trecRandomInvBuf.CalcFields("Last Phys. Invt. Date", "Last Registering Date", "Bin Quantity (Base)");
            if trecRandomInvBuf."Last Registering Date" = 0D then
                trecRandomInvBuf."Last Registering Date" := WorkDate();

            if (trecRandomInvBuf."Last Phys. Invt. Date" < dtRandomSince) and
               ((trecRandomInvBuf."Bin Quantity (Base)" <> 0) or (trecRandomInvBuf."Last Registering Date" > dtBinsEmptySince) or (codCurBin = ''))
            then begin
                if RandomBinSel <> RandomBinSel::"Item and Bin" then
                    trecRandomInvBuf."Bin Code" := '';

                if trecRandomInvBuf.Insert() then;
            end;//if

        end else begin
            cuInvMgmt.insertCountSheetLine(
              recItem,
              recConfig."Count No.",
              recConfig."Sheet Name",
              pcodLocation, pcodVariant,
              '',
              codCurBin,
              CodCurZone
              );
        end;
    end;

    /// <summary>
    /// This function builds a filter string based on field names in config table.
    /// This makes the form more extensible, since it allows us to add fields without changing the code required to filter items.
    /// If adding fields to the config table, make sure they match the field names in the item table.
    /// </summary>
    /// <param name="lrecConfig"></param>
    /// <returns></returns>
    local procedure buildItemFilter(var lrecConfig: Record "IWX Count Sheet Configuration") Result: Text
    var
        lrrefConfig: RecordRef;
        nIndex: Integer;
    begin
        lrrefConfig.GetTable(lrecConfig);

        for nIndex := 3 to lrrefConfig.FieldCount - 1 do begin
            if (lrrefConfig.FieldIndex(nIndex).Number >= 10)
            and (lrrefConfig.FieldIndex(nIndex).Number < 49) then begin
                if Format(lrrefConfig.FieldIndex(nIndex).Value) <> '' then begin
                    if Result <> '' then Result := Result + ',';
                    Result := Result + lrrefConfig.FieldIndex(nIndex).Name + '=FILTER(' + Format(lrrefConfig.FieldIndex(nIndex).Value) + ')';
                end;//if got value
            end;//if valid filter field
        end;

        if lrecConfig."Custom Filter" <> '' then begin
            if Result <> '' then Result := Result + ',';
            Result := Result + lrecConfig."Custom Filter";
        end;//if

        if Result <> '' then Result := 'WHERE(' + Result + ')';

        Result := 'SORTING(No.) ' + Result;
    end;

    /// <summary>
    /// Builds buffer for work order entries
    /// </summary>
    /// <param name="lcodItem"></param>
    /// <param name="lcodLocation"></param>
    /// <param name="lcodVariant"></param>
    /// <param name="ldQty"></param>
    /// <param name="lcodProdOrder"></param>
    procedure populateBuffer(lcodItem: Text; lcodLocation: Code[10]; lcodVariant: Text; ldQty: Decimal; lcodProdOrder: Code[20])
    begin
        trecBuffer.SetFilter("Item No.", '=%1', lcodItem);
        trecBuffer.SetFilter("Location Code", '=%1', lcodLocation);
        trecBuffer.SetFilter("Variant Code", '=%1', lcodVariant);
        trecBuffer.SetFilter("Serial No.", '=%1', lcodProdOrder);  // using serial # field to hold W/O

        if trecBuffer.Find('-') then begin
            if trecBuffer."Dimension Entry No." = 0 then
                trecBuffer.Quantity := trecBuffer.Quantity + ldQty;
            trecBuffer.Modify();

        end else begin
            trecBuffer.Init();
            trecBuffer."Item No." := CopyStr(lcodItem, 1, MaxStrLen(trecBuffer."Item No."));
            trecBuffer."Location Code" := lcodLocation;
            trecBuffer."Variant Code" := CopyStr(lcodVariant, 1, MaxStrLen(trecBuffer."Variant Code"));
            trecBuffer."Serial No." := lcodProdOrder;  // using serial # field to hold W/O

            trecBuffer.Quantity := ldQty;
            trecBuffer.Insert();
        end;//if
    end;

    /// <summary>
    /// Updates status dialog
    /// </summary>
    /// <param name="codEntryNo"></param>
    procedure updateDialogItem(codEntryNo: Code[20])
    begin
        nCurItem := nCurItem + 1;
        nProgress := (nCurItem * 10000) div nItemCount;
        dlgProgress.Update(2, codEntryNo);
        dlgProgress.Update(3, nProgress);
        dlgProgress.Update(4, (nCurSheet * 10000) div nSheetCount + (nProgress * (1 / nSheetCount) * 10 div 10));
    end;

    /// <summary>
    /// Adds random selection of previously buffered items to count sheets
    /// Logic improved to get closer to max items value and to add all bins for item
    /// </summary>
    procedure addRandomItems()
    var
        lrecItem: Record Item;
        lnInitialFlagVal: Integer;
        lnRecsToProcess: Integer;
        lnRecsProcessed: Integer;
        lnRandomNo: Integer;
        lnRandomBufCount: Integer;
        lcodBinFilter: Code[80];
        lcodZoneFilter: Code[10];
    begin
        lnRecsProcessed := 0;
        trecRandomInvBuf.Reset();
        lnRandomBufCount := trecRandomInvBuf.Count;
        if lnRandomBufCount = 0 then
            exit;

        if lnRandomBufCount < nNumRandom * 2 - 1 then begin
            lnInitialFlagVal := 1;
            trecRandomInvBuf.ModifyAll("Dimension Entry No.", lnInitialFlagVal);
            lnRecsToProcess := lnRandomBufCount - nNumRandom;
        end else
            lnRecsToProcess := nNumRandom;

        while lnRecsProcessed < lnRecsToProcess do begin
            trecRandomInvBuf.SetRange("Dimension Entry No.", lnInitialFlagVal);
            if trecRandomInvBuf.FindSet() then;
            lnRandomNo := Random(lnRandomBufCount - lnRecsProcessed);
            if trecRandomInvBuf.Next(lnRandomNo) <> 0 then begin
                trecRandomInvBuf."Dimension Entry No." := Abs(lnInitialFlagVal - 1);
                trecRandomInvBuf.Modify();
            end;//if
            lnRecsProcessed += 1;
        end;//while

        trecRandomInvBuf.SetRange("Dimension Entry No.", 1);

        if trecRandomInvBuf.FindSet() then begin
            lcodBinFilter := recConfig."Bin Code";
            lcodZoneFilter := recConfig."ORB Zone Code";
            repeat
                if RandomBinSel = RandomBinSel::"Item and Bin" then begin
                    lcodBinFilter := trecRandomInvBuf."Bin Code";
                    lcodZoneFilter := trecRandomInvBuf."ORB Zone Code";
                end;

                lrecItem.Get(trecRandomInvBuf."Item No.");
                cuInvMgmt.insertCountSheetLine(lrecItem,
                                               recConfig."Count No.",
                                               recConfig."Sheet Name",
                                               trecRandomInvBuf."Location Code",
                                               trecRandomInvBuf."Variant Code",
                                               '',
                                               lcodBinFilter,
                                               lcodZoneFilter
                                               );
            until trecRandomInvBuf.Next() = 0;
        end;//if findset

        trecRandomInvBuf.Reset();
        trecRandomInvBuf.DeleteAll();
        Clear(trecRandomInvBuf);
    end;

    /// <summary>
    /// Determines if count date falls into the supplied range
    /// </summary>
    /// <param name="ptxtCountRange"></param>
    /// <param name="pdStartDate"></param>
    /// <param name="pdEndDate"></param>
    /// <returns></returns>
    procedure isDateInRange(ptxtCountRange: Text[30]; pdStartDate: Date; pdEndDate: Date): Boolean
    begin
        EXIT((recInvCount."Inventory As of Date" >= pdStartDate) AND (recInvCount."Inventory As of Date" <= pdEndDate));
    end;

    /// <summary>
    /// Sets filter when SKU is used.  Copy of old setItemFilter
    /// </summary>
    /// <param name="precConfig"></param>
    procedure setSKUFilter(var precConfig: Record "IWX Count Sheet Configuration")
    var
        ltcBadFilterErr: Label 'Cannot use [%1] filter with SKUs', Comment = '%1 = The filter field caption';
    begin
        if precConfig."Custom Filter" <> '' then begin
            diSKU.SetView('WHERE (' + precConfig."Custom Filter" + ')');
        end;//if

        if precConfig."Shelf No." <> '' then diSKU.SetFilter("Shelf No.", precConfig."Shelf No.");
        if precConfig."No." <> '' then diSKU.SetFilter("Item No.", precConfig."No.");
        if precConfig."Gen. Prod. Posting Group" <> '' then
            Error(ltcBadFilterErr, precConfig.FieldCaption("Gen. Prod. Posting Group"));

        if precConfig."Inventory Posting Group" <> '' then
            Error(ltcBadFilterErr, precConfig.FieldCaption("Inventory Posting Group"));

        if precConfig."Item Tracking Code" <> '' then
            Error(ltcBadFilterErr, precConfig.FieldCaption("Item Tracking Code"));

        if precConfig."Phys Invt Counting Period Code" <> '' then
            diSKU.SetFilter("Phys Invt Counting Period Code", precConfig."Phys Invt Counting Period Code");
    end;

    /// <summary>
    /// Sets filter on bin/item records
    /// </summary>
    /// <param name="precConfig"></param>
    local procedure setBinFilter(var precConfig: Record "IWX Count Sheet Configuration")
    begin
        if precConfig."No." <> '' then recBinContent.SetFilter("Item No.", precConfig."No.");
        if precConfig."Bin Code" <> '' then recBinContent.SetFilter("Bin Code", precConfig."Bin Code");
        if precConfig."ORB Zone Code" <> '' then recBinContent.SetFilter("Zone Code", precConfig."ORB Zone Code"); // Zone Filter
        recBinContent.SetRange("Location Code", recLocation.Code);
    end;

    var
        recCountSheet: Record "IWX Count Sheet Line";
        recItemLedger: Record "Item Ledger Entry";
        recLocation: Record Location;
        recProdOrderComp: Record "Prod. Order Component";
        recVariant: Record "Item Variant";
        trecBuffer: Record "Inventory Buffer" temporary;
        recInvCount: Record "IWX Inventory Count Header";
        trecRandomInvBuf: Record "IWX Invt. Buffer" temporary;
        cuInvMgmt: Codeunit "ORB IWX Inventory Count Mgmt";
        dfZeroBinFormula: DateFormula;
        dfActivityPeriod: DateFormula;
        [InDataSet]
        bDeleteOldSheets: Boolean;
        [InDataSet]
        bIncludeActive: Boolean;
        [InDataSet]
        bIncludeAll: Boolean;
        [InDataSet]
        bIncludeInventory: Boolean;
        [InDataSet]
        bIncludeUnconsumed: Boolean;
        codLocationFilter: Code[500];
        codVariantFilter: Code[500];
        dlgProgress: Dialog;
        nCurItem: Integer;
        nCurSheet: Integer;
        nItemCount: Integer;
        nProgress: Integer;
        nSheetCount: Integer;
        txtConfirmSheetDeleteQst: Label 'The existing count sheets have count information on them.\Delete existing count sheets?';
        txtNoConfigErr: Label 'No configuration lines exist in filter.';
        txtNoDeleteErr: Label 'The count sheets were not deleted.  Re-run the report and un-select "Delete existing sheets"';
        txtProgressMsg: Label 'Sheet Name              #1##################\Entry No.               #2##################\Current Sheet Progress  @3@@@@@@@@@@@@@@@@@@\Generation Progress     @4@@@@@@@@@@@@@@@@@@', Comment = '%1 = The Sheet name; %2 = The entry number; %3 = The sheet progress; %4 = Overall progress';
        codCountPeriod: Code[100];
        [InDataSet]
        bGenerateRandom: Boolean;
        nNumRandom: Integer;
        dtRandomSince: Date;
        [InDataSet]
        UseNextCountPeriod: Boolean;
        codCountNo: Code[20];
        [InDataSet]
        bUseSKU: Boolean;
        txtConfirmSheetUpdateQst: Label 'The existing count sheets have count information on them.\If you proceed this information will be lost.\Should we overwrite the lines in the existing count sheets?';
        txtNoUpdateErr: Label 'Count sheets not generated.  ';
        dtBinsEmptySince: Date;
        bUseBin: Boolean;
        codCurBin: Code[80];
        CodCurZone: Code[10]; //Zone Filter
        codCurVariant: Code[10];
        RandomBinSel: Option Item,"Item and Bin";
}

