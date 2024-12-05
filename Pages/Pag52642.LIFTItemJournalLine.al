page 52642 "ORB LIFT Item Journal Line"
{
    APIGroup = 'Orbus';
    APIPublisher = 'Orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'LIFT ItemJournalLine';
    DelayedInsert = true;
    EntityName = 'LIFTItemJournalLine';
    EntitySetName = 'LIFTItemJournalLine';
    PageType = API;
    SourceTable = "Item Journal Line";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(journalTemplateName; Rec."Journal Template Name")
                {
                    Caption = 'Journal Template Name';
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                }
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }
                field(entryType; Rec."Entry Type")
                {
                    Caption = 'Entry Type';
                }
                field(sourceNo; Rec."Source No.")
                {
                    Caption = 'Source No.';
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }
                field(inventoryPostingGroup; Rec."Inventory Posting Group")
                {
                    Caption = 'Inventory Posting Group';
                }
                field(sourcePostingGroup; Rec."Source Posting Group")
                {
                    Caption = 'Source Posting Group';
                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                }
                field(invoicedQuantity; Rec."Invoiced Quantity")
                {
                    Caption = 'Invoiced Quantity';
                }
                field(unitAmount; Rec."Unit Amount")
                {
                    Caption = 'Unit Amount';
                }
                field(unitCost; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                }
                field(discountAmount; Rec."Discount Amount")
                {
                    Caption = 'Discount Amount';
                }
                field(salespersPurchCode; Rec."Salespers./Purch. Code")
                {
                    Caption = 'Salespers./Purch. Code';
                }
                field(sourceCode; Rec."Source Code")
                {
                    Caption = 'Source Code';
                }
                field(appliesToEntry; Rec."Applies-to Entry")
                {
                    Caption = 'Applies-to Entry';
                }
                field(itemShptEntryNo; Rec."Item Shpt. Entry No.")
                {
                    Caption = 'Item Shpt. Entry No.';
                }
                field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
                {
                    Caption = 'Shortcut Dimension 1 Code';
                }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                {
                    Caption = 'Shortcut Dimension 2 Code';
                }
                field(indirectCost; Rec."Indirect Cost %")
                {
                    Caption = 'Indirect Cost %';
                }
                field(sourceType; Rec."Source Type")
                {
                    Caption = 'Source Type';
                }
                field(shptMethodCode; Rec."Shpt. Method Code")
                {
                    Caption = 'Shpt. Method Code';
                }
                field(journalBatchName; Rec."Journal Batch Name")
                {
                    Caption = 'Journal Batch Name';
                }
                field(reasonCode; Rec."Reason Code")
                {
                    Caption = 'Reason Code';
                }
                field(recurringMethod; Rec."Recurring Method")
                {
                    Caption = 'Recurring Method';
                }
                field(expirationDate; Rec."Expiration Date")
                {
                    Caption = 'Expiration Date';
                }
                field(recurringFrequency; Rec."Recurring Frequency")
                {
                    Caption = 'Recurring Frequency';
                }
                field(dropShipment; Rec."Drop Shipment")
                {
                    Caption = 'Drop Shipment';
                }
                field(transactionType; Rec."Transaction Type")
                {
                    Caption = 'Transaction Type';
                }
                field(transportMethod; Rec."Transport Method")
                {
                    Caption = 'Transport Method';
                }
                field(countryRegionCode; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                }
                field(newLocationCode; Rec."New Location Code")
                {
                    Caption = 'New Location Code';
                }
                field(newShortcutDimension1Code; Rec."New Shortcut Dimension 1 Code")
                {
                    Caption = 'New Shortcut Dimension 1 Code';
                }
                field(newShortcutDimension2Code; Rec."New Shortcut Dimension 2 Code")
                {
                    Caption = 'New Shortcut Dimension 2 Code';
                }
                field(qtyCalculated; Rec."Qty. (Calculated)")
                {
                    Caption = 'Qty. (Calculated)';
                }
                field(qtyPhysInventory; Rec."Qty. (Phys. Inventory)")
                {
                    Caption = 'Qty. (Phys. Inventory)';
                }
                field(lastItemLedgerEntryNo; Rec."Last Item Ledger Entry No.")
                {
                    Caption = 'Last Item Ledger Entry No.';
                }
                field(physInventory; Rec."Phys. Inventory")
                {
                    Caption = 'Phys. Inventory';
                }
                field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Gen. Prod. Posting Group';
                }
                field(entryExitPoint; Rec."Entry/Exit Point")
                {
                    Caption = 'Entry/Exit Point';
                }
                field(documentDate; Rec."Document Date")
                {
                    Caption = 'Document Date';
                }
                field(externalDocumentNo; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
                }
                field("area"; Rec."Area")
                {
                    Caption = 'Area';
                }
                field(transactionSpecification; Rec."Transaction Specification")
                {
                    Caption = 'Transaction Specification';
                }
                field(postingNoSeries; Rec."Posting No. Series")
                {
                    Caption = 'Posting No. Series';
                }
                field(reservedQuantity; Rec."Reserved Quantity")
                {
                    Caption = 'Reserved Quantity';
                }
                field(unitCostACY; Rec."Unit Cost (ACY)")
                {
                    Caption = 'Unit Cost (ACY)';
                }
                field(sourceCurrencyCode; Rec."Source Currency Code")
                {
                    Caption = 'Source Currency Code';
                }
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                }
                field(documentLineNo; Rec."Document Line No.")
                {
                    Caption = 'Document Line No.';
                }
                field(vatReportingDate; Rec."VAT Reporting Date")
                {
                    Caption = 'VAT Date';
                }
                field(orderType; Rec."Order Type")
                {
                    Caption = 'Order Type';
                }
                field(orderNo; Rec."Order No.")
                {
                    Caption = 'Order No.';
                }
                field(orderLineNo; Rec."Order Line No.")
                {
                    Caption = 'Order Line No.';
                }
                field(dimensionSetID; Rec."Dimension Set ID")
                {
                    Caption = 'Dimension Set ID';
                }
                field(newDimensionSetID; Rec."New Dimension Set ID")
                {
                    Caption = 'New Dimension Set ID';
                }
                field(assembleToOrder; Rec."Assemble to Order")
                {
                    Caption = 'Assemble to Order';
                }
                field(jobNo; Rec."Job No.")
                {
                    Caption = 'Project No.';
                }
                field(jobTaskNo; Rec."Job Task No.")
                {
                    Caption = 'Project Task No.';
                }
                field(jobPurchase; Rec."Job Purchase")
                {
                    Caption = 'Project Purchase';
                }
                field(jobContractEntryNo; Rec."Job Contract Entry No.")
                {
                    Caption = 'Project Contract Entry No.';
                }
                field(variantCode; Rec."Variant Code")
                {
                    Caption = 'Variant Code';
                }
                field(binCode; Rec."Bin Code")
                {
                    Caption = 'Bin Code';
                }
                field(qtyPerUnitOfMeasure; Rec."Qty. per Unit of Measure")
                {
                    Caption = 'Qty. per Unit of Measure';
                }
                field(newBinCode; Rec."New Bin Code")
                {
                    Caption = 'New Bin Code';
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                }
                field(derivedFromBlanketOrder; Rec."Derived from Blanket Order")
                {
                    Caption = 'Derived from Blanket Order';
                }
                field(qtyRoundingPrecision; Rec."Qty. Rounding Precision")
                {
                    Caption = 'Qty. Rounding Precision';
                }
                field(qtyRoundingPrecisionBase; Rec."Qty. Rounding Precision (Base)")
                {
                    Caption = 'Qty. Rounding Precision (Base)';
                }
                field(quantityBase; Rec."Quantity (Base)")
                {
                    Caption = 'Quantity (Base)';
                }
                field(invoicedQtyBase; Rec."Invoiced Qty. (Base)")
                {
                    Caption = 'Invoiced Qty. (Base)';
                }
                field(reservedQtyBase; Rec."Reserved Qty. (Base)")
                {
                    Caption = 'Reserved Qty. (Base)';
                }
                field(level; Rec.Level)
                {
                    Caption = 'Level';
                }
                field(flushingMethod; Rec."Flushing Method")
                {
                    Caption = 'Flushing Method';
                }
                field(changedByUser; Rec."Changed by User")
                {
                    Caption = 'Changed by User';
                }
                field(originallyOrderedNo; Rec."Originally Ordered No.")
                {
                    Caption = 'Originally Ordered No.';
                }
                field(originallyOrderedVarCode; Rec."Originally Ordered Var. Code")
                {
                    Caption = 'Originally Ordered Var. Code';
                }
                field(outOfStockSubstitution; Rec."Out-of-Stock Substitution")
                {
                    Caption = 'Out-of-Stock Substitution';
                }
                field(itemCategoryCode; Rec."Item Category Code")
                {
                    Caption = 'Item Category Code';
                }
                field(nonstock; Rec.Nonstock)
                {
                    Caption = 'Catalog';
                }
                field(purchasingCode; Rec."Purchasing Code")
                {
                    Caption = 'Purchasing Code';
                }
                field(itemReferenceNo; Rec."Item Reference No.")
                {
                    Caption = 'Item Reference No.';
                }
                field(itemReferenceUnitOfMeasure; Rec."Item Reference Unit of Measure")
                {
                    Caption = 'Item Reference Unit of Measure';
                }
                field(itemReferenceType; Rec."Item Reference Type")
                {
                    Caption = 'Item Reference Type';
                }
                field(itemReferenceTypeNo; Rec."Item Reference Type No.")
                {
                    Caption = 'Item Reference Type No.';
                }
                field(plannedDeliveryDate; Rec."Planned Delivery Date")
                {
                    Caption = 'Planned Delivery Date';
                }
                field(orderDate; Rec."Order Date")
                {
                    Caption = 'Order Date';
                }
                field(valueEntryType; Rec."Value Entry Type")
                {
                    Caption = 'Value Entry Type';
                }
                field(itemChargeNo; Rec."Item Charge No.")
                {
                    Caption = 'Item Charge No.';
                }
                field(inventoryValueCalculated; Rec."Inventory Value (Calculated)")
                {
                    Caption = 'Inventory Value (Calculated)';
                }
                field(inventoryValueRevalued; Rec."Inventory Value (Revalued)")
                {
                    Caption = 'Inventory Value (Revalued)';
                }
                field(varianceType; Rec."Variance Type")
                {
                    Caption = 'Variance Type';
                }
                field(inventoryValuePer; Rec."Inventory Value Per")
                {
                    Caption = 'Inventory Value Per';
                }
                field(partialRevaluation; Rec."Partial Revaluation")
                {
                    Caption = 'Partial Revaluation';
                }
                field(appliesFromEntry; Rec."Applies-from Entry")
                {
                    Caption = 'Applies-from Entry';
                }
                field(invoiceNo; Rec."Invoice No.")
                {
                    Caption = 'Invoice No.';
                }
                field(unitCostCalculated; Rec."Unit Cost (Calculated)")
                {
                    Caption = 'Unit Cost (Calculated)';
                }
                field(unitCostRevalued; Rec."Unit Cost (Revalued)")
                {
                    Caption = 'Unit Cost (Revalued)';
                }
                field(appliedAmount; Rec."Applied Amount")
                {
                    Caption = 'Applied Amount';
                }
                field(updateStandardCost; Rec."Update Standard Cost")
                {
                    Caption = 'Update Standard Cost';
                }
                field(amountACY; Rec."Amount (ACY)")
                {
                    Caption = 'Amount (ACY)';
                }
                field(correction; Rec.Correction)
                {
                    Caption = 'Correction';
                }
                field(adjustment; Rec.Adjustment)
                {
                    Caption = 'Adjustment';
                }
                field(appliesToValueEntry; Rec."Applies-to Value Entry")
                {
                    Caption = 'Applies-to Value Entry';
                }
                field(invoiceToSourceNo; Rec."Invoice-to Source No.")
                {
                    Caption = 'Invoice-to Source No.';
                }
                field(type; Rec."Type")
                {
                    Caption = 'Type';
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(operationNo; Rec."Operation No.")
                {
                    Caption = 'Operation No.';
                }
                field(workCenterNo; Rec."Work Center No.")
                {
                    Caption = 'Work Center No.';
                }
                field(setupTime; Rec."Setup Time")
                {
                    Caption = 'Setup Time';
                }
                field(runTime; Rec."Run Time")
                {
                    Caption = 'Run Time';
                }
                field(stopTime; Rec."Stop Time")
                {
                    Caption = 'Stop Time';
                }
                field(outputQuantity; Rec."Output Quantity")
                {
                    Caption = 'Output Quantity';
                }
                field(scrapQuantity; Rec."Scrap Quantity")
                {
                    Caption = 'Scrap Quantity';
                }
                field(concurrentCapacity; Rec."Concurrent Capacity")
                {
                    Caption = 'Concurrent Capacity';
                }
                field(setupTimeBase; Rec."Setup Time (Base)")
                {
                    Caption = 'Setup Time (Base)';
                }
                field(runTimeBase; Rec."Run Time (Base)")
                {
                    Caption = 'Run Time (Base)';
                }
                field(stopTimeBase; Rec."Stop Time (Base)")
                {
                    Caption = 'Stop Time (Base)';
                }
                field(outputQuantityBase; Rec."Output Quantity (Base)")
                {
                    Caption = 'Output Quantity (Base)';
                }
                field(scrapQuantityBase; Rec."Scrap Quantity (Base)")
                {
                    Caption = 'Scrap Quantity (Base)';
                }
                field(capUnitOfMeasureCode; Rec."Cap. Unit of Measure Code")
                {
                    Caption = 'Cap. Unit of Measure Code';
                }
                field(qtyPerCapUnitOfMeasure; Rec."Qty. per Cap. Unit of Measure")
                {
                    Caption = 'Qty. per Cap. Unit of Measure';
                }
                field(startingTime; Rec."Starting Time")
                {
                    Caption = 'Starting Time';
                }
                field(endingTime; Rec."Ending Time")
                {
                    Caption = 'Ending Time';
                }
                field(routingNo; Rec."Routing No.")
                {
                    Caption = 'Routing No.';
                }
                field(routingReferenceNo; Rec."Routing Reference No.")
                {
                    Caption = 'Routing Reference No.';
                }
                field(prodOrderCompLineNo; Rec."Prod. Order Comp. Line No.")
                {
                    Caption = 'Prod. Order Comp. Line No.';
                }
                field(finished; Rec.Finished)
                {
                    Caption = 'Finished';
                }
                field(unitCostCalculation; Rec."Unit Cost Calculation")
                {
                    Caption = 'Unit Cost Calculation';
                }
                field(subcontracting; Rec.Subcontracting)
                {
                    Caption = 'Subcontracting';
                }
                field(stopCode; Rec."Stop Code")
                {
                    Caption = 'Stop Code';
                }
                field(scrapCode; Rec."Scrap Code")
                {
                    Caption = 'Scrap Code';
                }
                field(workCenterGroupCode; Rec."Work Center Group Code")
                {
                    Caption = 'Work Center Group Code';
                }
                field(workShiftCode; Rec."Work Shift Code")
                {
                    Caption = 'Work Shift Code';
                }
                field(serialNo; Rec."Serial No.")
                {
                    Caption = 'Serial No.';
                }
                field(lotNo; Rec."Lot No.")
                {
                    Caption = 'Lot No.';
                }
                field(warrantyDate; Rec."Warranty Date")
                {
                    Caption = 'Warranty Date';
                }
                field(newSerialNo; Rec."New Serial No.")
                {
                    Caption = 'New Serial No.';
                }
                field(newLotNo; Rec."New Lot No.")
                {
                    Caption = 'New Lot No.';
                }
                field(newItemExpirationDate; Rec."New Item Expiration Date")
                {
                    Caption = 'New Item Expiration Date';
                }
                field(itemExpirationDate; Rec."Item Expiration Date")
                {
                    Caption = 'Item Expiration Date';
                }
                field(packageNo; Rec."Package No.")
                {
                    Caption = 'Package No.';
                }
                field(newPackageNo; Rec."New Package No.")
                {
                    Caption = 'New Package No.';
                }
                field(returnReasonCode; Rec."Return Reason Code")
                {
                    Caption = 'Return Reason Code';
                }
                field(priceCalculationMethod; Rec."Price Calculation Method")
                {
                    Caption = 'Price Calculation Method';
                }
                field(warehouseAdjustment; Rec."Warehouse Adjustment")
                {
                    Caption = 'Warehouse Adjustment';
                }
                field(directTransfer; Rec."Direct Transfer")
                {
                    Caption = 'Direct Transfer';
                }
                field(physInvtCountingPeriodCode; Rec."Phys Invt Counting Period Code")
                {
                    Caption = 'Phys Invt Counting Period Code';
                }
                field(physInvtCountingPeriodType; Rec."Phys Invt Counting Period Type")
                {
                    Caption = 'Phys Invt Counting Period Type';
                }
                field(orbIWXAutoPostState; Rec."ORB IWX AutoPost State")
                {
                    Caption = 'ORB IWX AutoPost State';
                }
                field(orbIWXAutoPostErrorMessage; Rec."ORB IWX AutoPost Error Message")
                {
                    Caption = 'ORB IWX AutoPost Error Message';
                }
                field(orbIWXAutoPostErrorDT; Rec."ORB IWX AutoPost Error DT")
                {
                    Caption = 'IWX AutoPost Error DateTime';
                }
                field(sfiTimeCardNo; Rec."SFI Time Card No.")
                {
                    Caption = 'Time Card Header No.';
                }
                field(sfiTimeCardLineNo; Rec."SFI Time Card Line No.")
                {
                    Caption = 'Time Card Line No.';
                }
                field(sfiEmployeeNo; Rec."SFI Employee No.")
                {
                    Caption = 'SFI Employee No.';
                }
                field(sfiShopFloorEmployeeNo; Rec."SFI Shop Floor Employee No.")
                {
                    Caption = 'SFI Shop Floor Employee No.';
                }
                field(sfiOutputRecordedDateTime; Rec."SFI Output Recorded DateTime")
                {
                    Caption = 'SFI Output Recorded DateTime';
                }
                field(sfiCumulativeOutputHours; Rec."SFI Cumulative Output Hours")
                {
                    Caption = 'SFI Cumulative Output Hours';
                }
                field(sfiTimeSinceLastOutput; Rec."SFI Time Since Last Output")
                {
                    Caption = 'SFI Time Since Last Output';
                }
                field(sfiUnitsPerHourSnapshot; Rec."SFI Units per Hour Snapshot")
                {
                    Caption = 'SFI Units per Hour Snapshot';
                }
                field(sfiHoursPerUnitSnapshot; Rec."SFI Hours per Unit Snapshot")
                {
                    Caption = 'SFI Hours per Unit Snapshot';
                }
                field(sfiProdOrderCompLineNo; Rec."SFI Prod. Order Comp. Line No.")
                {
                    Caption = 'Workaround Prod. Order Comp. Line No.';
                }
                field(sfiOperationNo; Rec."SFI Operation No.")
                {
                    Caption = 'Workaround Operation No.';
                }
                field(sfiRoutingLinkCode; Rec."SFI Routing Link Code")
                {
                    Caption = 'Workaround Routing Link Code';
                }
                field(sfiRoutingReferenceNo; Rec."SFI Routing Reference No.")
                {
                    Caption = 'Workaround Routing Reference No.';
                }
                field(sfiLicensePlateNo; Rec."SFI License Plate No.")
                {
                    Caption = 'Shop Floor License Plate No.';
                }
                field(sfiClientConfigNo; Rec."SFI Client Config No.")
                {
                    Caption = 'Shop Floor Client Config No.';
                }
                field(wmdmProdSerialNo; Rec."WMDM Prod. Serial No.")
                {
                    Caption = 'WMDM Prod. Serial No.';
                }
                field(wmdmProdLotNo; Rec."WMDM Prod. Lot No.")
                {
                    Caption = 'WMDM Prod. Lot No.';
                }
                field(wmdmBarcodeData; Rec."WMDM Barcode Data")
                {
                    Caption = 'WMDM Barcode Data';
                }
                field(wmdmConsSerialNo; Rec."WMDM Cons. Serial No.")
                {
                    Caption = 'WMDM Cons. Serial No.';
                }
                field(wmdmConsLotNo; Rec."WMDM Cons. Lot No.")
                {
                    Caption = 'WMDM Cons. Lot No.';
                }
                field(wmdmQuantityRequired; Rec."WMDM Quantity Required")
                {
                    Caption = 'WMDM Quantity Required';
                }
                field(wmdmEntry; Rec."WMDM Entry")
                {
                    Caption = 'WMDM Entry';
                }
                field(wmdmDocumentNo; Rec."WMDM Document No.")
                {
                    Caption = 'WMDM Document No.';
                }
                field(lpmLicensePlateNo; Rec."LPM License Plate No.")
                {
                    Caption = 'LPM License Plate No.';
                }
                field(lpmSourceLineNo; Rec."LPM Source Line No.")
                {
                    Caption = 'LPM Source Line No.';
                }
                field(wmdmPDAConfigID; Rec."WMDM PDA Config ID")
                {
                    Caption = 'WMDM PDA Config ID';
                }
                field(lpmAction; Rec."LPM Action")
                {
                    Caption = 'LPM Action';
                }
                // field(iwxProdPackageNo; Rec."IWX Prod. Package No.")
                // {
                //     Caption = 'IWX Prod. Package No.';
                // }
                // field(iwxConsPackageNo; Rec."IWX Cons. Package No.")
                // {
                //     Caption = 'IWX Cons. Package No.';
                // }
                field(overheadRate; Rec."Overhead Rate")
                {
                    Caption = 'Overhead Rate';
                }
                field(singleLevelMaterialCost; Rec."Single-Level Material Cost")
                {
                    Caption = 'Single-Level Material Cost';
                }
                field(singleLevelCapacityCost; Rec."Single-Level Capacity Cost")
                {
                    Caption = 'Single-Level Capacity Cost';
                }
                field(singleLevelSubcontrdCost; Rec."Single-Level Subcontrd. Cost")
                {
                    Caption = 'Single-Level Subcontrd. Cost';
                }
                field(singleLevelCapOvhdCost; Rec."Single-Level Cap. Ovhd Cost")
                {
                    Caption = 'Single-Level Cap. Ovhd Cost';
                }
                field(singleLevelMfgOvhdCost; Rec."Single-Level Mfg. Ovhd Cost")
                {
                    Caption = 'Single-Level Mfg. Ovhd Cost';
                }
                field(rolledUpMaterialCost; Rec."Rolled-up Material Cost")
                {
                    Caption = 'Rolled-up Material Cost';
                }
                field(rolledUpCapacityCost; Rec."Rolled-up Capacity Cost")
                {
                    Caption = 'Rolled-up Capacity Cost';
                }
                field(rolledUpSubcontractedCost; Rec."Rolled-up Subcontracted Cost")
                {
                    Caption = 'Rolled-up Subcontracted Cost';
                }
                field(rolledUpMfgOvhdCost; Rec."Rolled-up Mfg. Ovhd Cost")
                {
                    Caption = 'Rolled-up Mfg. Ovhd Cost';
                }
                field(rolledUpCapOverheadCost; Rec."Rolled-up Cap. Overhead Cost")
                {
                    Caption = 'Rolled-up Cap. Overhead Cost';
                }
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'SystemCreatedAt';
                }
                field(systemCreatedBy; Rec.SystemCreatedBy)
                {
                    Caption = 'SystemCreatedBy';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(systemModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'SystemModifiedAt';
                }
                field(systemModifiedBy; Rec.SystemModifiedBy)
                {
                    Caption = 'SystemModifiedBy';
                }
            }
        }
    }
}
