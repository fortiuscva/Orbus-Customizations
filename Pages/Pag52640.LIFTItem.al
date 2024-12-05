page 52640 "ORB LIFT Item"
{
    APIGroup = 'Orbus';
    APIPublisher = 'Orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'LIFT Item';
    DelayedInsert = true;
    EntityName = 'LIFTItem';
    EntitySetName = 'LIFTItem';
    PageType = API;
    SourceTable = Item;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(no2; Rec."No. 2")
                {
                    Caption = 'No. 2';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(searchDescription; Rec."Search Description")
                {
                    Caption = 'Search Description';
                }
                field(description2; Rec."Description 2")
                {
                    Caption = 'Description 2';
                }
                field(assemblyBOM; Rec."Assembly BOM")
                {
                    Caption = 'Assembly BOM';
                }
                field(baseUnitOfMeasure; Rec."Base Unit of Measure")
                {
                    Caption = 'Base Unit of Measure';
                }
                field(priceUnitConversion; Rec."Price Unit Conversion")
                {
                    Caption = 'Price Unit Conversion';
                }
                field(type; Rec."Type")
                {
                    Caption = 'Type';
                }
                field(inventoryPostingGroup; Rec."Inventory Posting Group")
                {
                    Caption = 'Inventory Posting Group';
                }
                field(shelfNo; Rec."Shelf No.")
                {
                    Caption = 'Shelf No.';
                }
                field(itemDiscGroup; Rec."Item Disc. Group")
                {
                    Caption = 'Item Disc. Group';
                }
                field(allowInvoiceDisc; Rec."Allow Invoice Disc.")
                {
                    Caption = 'Allow Invoice Disc.';
                }
                field(statisticsGroup; Rec."Statistics Group")
                {
                    Caption = 'Statistics Group';
                }
                field(commissionGroup; Rec."Commission Group")
                {
                    Caption = 'Commission Group';
                }
                field(unitPrice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                }
                field(priceProfitCalculation; Rec."Price/Profit Calculation")
                {
                    Caption = 'Price/Profit Calculation';
                }
                field(profit; Rec."Profit %")
                {
                    Caption = 'Profit %';
                }
                field(costingMethod; Rec."Costing Method")
                {
                    Caption = 'Costing Method';
                }
                field(unitCost; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                }
                field(standardCost; Rec."Standard Cost")
                {
                    Caption = 'Standard Cost';
                }
                field(lastDirectCost; Rec."Last Direct Cost")
                {
                    Caption = 'Last Direct Cost';
                }
                field(indirectCost; Rec."Indirect Cost %")
                {
                    Caption = 'Indirect Cost %';
                }
                field(costIsAdjusted; Rec."Cost is Adjusted")
                {
                    Caption = 'Cost is Adjusted';
                }
                field(allowOnlineAdjustment; Rec."Allow Online Adjustment")
                {
                    Caption = 'Allow Online Adjustment';
                }
                field(vendorNo; Rec."Vendor No.")
                {
                    Caption = 'Vendor No.';
                }
                field(vendorItemNo; Rec."Vendor Item No.")
                {
                    Caption = 'Vendor Item No.';
                }
                field(leadTimeCalculation; Rec."Lead Time Calculation")
                {
                    Caption = 'Lead Time Calculation';
                }
                field(reorderPoint; Rec."Reorder Point")
                {
                    Caption = 'Reorder Point';
                }
                field(maximumInventory; Rec."Maximum Inventory")
                {
                    Caption = 'Maximum Inventory';
                }
                field(reorderQuantity; Rec."Reorder Quantity")
                {
                    Caption = 'Reorder Quantity';
                }
                field(alternativeItemNo; Rec."Alternative Item No.")
                {
                    Caption = 'Alternative Item No.';
                }
                field(unitListPrice; Rec."Unit List Price")
                {
                    Caption = 'Unit List Price';
                }
                field(dutyDue; Rec."Duty Due %")
                {
                    Caption = 'Duty Due %';
                }
                field(dutyCode; Rec."Duty Code")
                {
                    Caption = 'Duty Code';
                }
                field(grossWeight; Rec."Gross Weight")
                {
                    Caption = 'Gross Weight';
                }
                field(netWeight; Rec."Net Weight")
                {
                    Caption = 'Net Weight';
                }
                field(unitsPerParcel; Rec."Units per Parcel")
                {
                    Caption = 'Units per Parcel';
                }
                field(unitVolume; Rec."Unit Volume")
                {
                    Caption = 'Unit Volume';
                }
                field(durability; Rec.Durability)
                {
                    Caption = 'Durability';
                }
                field(freightType; Rec."Freight Type")
                {
                    Caption = 'Freight Type';
                }
                field(tariffNo; Rec."Tariff No.")
                {
                    Caption = 'Tariff No.';
                }
                field(dutyUnitConversion; Rec."Duty Unit Conversion")
                {
                    Caption = 'Duty Unit Conversion';
                }
                field(countryRegionPurchasedCode; Rec."Country/Region Purchased Code")
                {
                    Caption = 'Country/Region Purchased Code';
                }
                field(budgetQuantity; Rec."Budget Quantity")
                {
                    Caption = 'Budget Quantity';
                }
                field(budgetedAmount; Rec."Budgeted Amount")
                {
                    Caption = 'Budgeted Amount';
                }
                field(budgetProfit; Rec."Budget Profit")
                {
                    Caption = 'Budget Profit';
                }
                field(comment; Rec.Comment)
                {
                    Caption = 'Comment';
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                }
                field(costIsPostedToGL; Rec."Cost is Posted to G/L")
                {
                    Caption = 'Cost is Posted to G/L';
                }
                field(blockReason; Rec."Block Reason")
                {
                    Caption = 'Block Reason';
                }
                field(lastDateTimeModified; Rec."Last DateTime Modified")
                {
                    Caption = 'Last DateTime Modified';
                }
                field(lastDateModified; Rec."Last Date Modified")
                {
                    Caption = 'Last Date Modified';
                }
                field(lastTimeModified; Rec."Last Time Modified")
                {
                    Caption = 'Last Time Modified';
                }
                field(inventory; Rec.Inventory)
                {
                    Caption = 'Inventory';
                }
                field(netInvoicedQty; Rec."Net Invoiced Qty.")
                {
                    Caption = 'Net Invoiced Qty.';
                }
                field(netChange; Rec."Net Change")
                {
                    Caption = 'Net Change';
                }
                field(purchasesQty; Rec."Purchases (Qty.)")
                {
                    Caption = 'Purchases (Qty.)';
                }
                field(salesQty; Rec."Sales (Qty.)")
                {
                    Caption = 'Sales (Qty.)';
                }
                field(positiveAdjmtQty; Rec."Positive Adjmt. (Qty.)")
                {
                    Caption = 'Positive Adjmt. (Qty.)';
                }
                field(negativeAdjmtQty; Rec."Negative Adjmt. (Qty.)")
                {
                    Caption = 'Negative Adjmt. (Qty.)';
                }
                field(purchasesLCY; Rec."Purchases (LCY)")
                {
                    Caption = 'Purchases (LCY)';
                }
                field(salesLCY; Rec."Sales (LCY)")
                {
                    Caption = 'Sales (LCY)';
                }
                field(positiveAdjmtLCY; Rec."Positive Adjmt. (LCY)")
                {
                    Caption = 'Positive Adjmt. (LCY)';
                }
                field(negativeAdjmtLCY; Rec."Negative Adjmt. (LCY)")
                {
                    Caption = 'Negative Adjmt. (LCY)';
                }
                field(cogsLCY; Rec."COGS (LCY)")
                {
                    Caption = 'COGS (LCY)';
                }
                field(qtyOnPurchOrder; Rec."Qty. on Purch. Order")
                {
                    Caption = 'Qty. on Purch. Order';
                }
                field(qtyOnSalesOrder; Rec."Qty. on Sales Order")
                {
                    Caption = 'Qty. on Sales Order';
                }
                field(priceIncludesVAT; Rec."Price Includes VAT")
                {
                    Caption = 'Price Includes VAT';
                }
                field(vatBusPostingGrPrice; Rec."VAT Bus. Posting Gr. (Price)")
                {
                    Caption = 'VAT Bus. Posting Gr. (Price)';
                }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Gen. Prod. Posting Group';
                }
                field(picture; Rec.Picture)
                {
                    Caption = 'Picture';
                }
                field(transferredQty; Rec."Transferred (Qty.)")
                {
                    Caption = 'Transferred (Qty.)';
                }
                field(transferredLCY; Rec."Transferred (LCY)")
                {
                    Caption = 'Transferred (LCY)';
                }
                field(countryRegionOfOriginCode; Rec."Country/Region of Origin Code")
                {
                    Caption = 'Country/Region of Origin Code';
                }
                field(automaticExtTexts; Rec."Automatic Ext. Texts")
                {
                    Caption = 'Automatic Ext. Texts';
                }
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                }
                field(taxGroupCode; Rec."Tax Group Code")
                {
                    Caption = 'Tax Group Code';
                }
                field(vatProdPostingGroup; Rec."VAT Prod. Posting Group")
                {
                    Caption = 'VAT Prod. Posting Group';
                }
                field(reserve; Rec.Reserve)
                {
                    Caption = 'Reserve';
                }
                field(reservedQtyOnInventory; Rec."Reserved Qty. on Inventory")
                {
                    Caption = 'Reserved Qty. on Inventory';
                }
                field(reservedQtyOnPurchOrders; Rec."Reserved Qty. on Purch. Orders")
                {
                    Caption = 'Reserved Qty. on Purch. Orders';
                }
                field(reservedQtyOnSalesOrders; Rec."Reserved Qty. on Sales Orders")
                {
                    Caption = 'Reserved Qty. on Sales Orders';
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                }
                field(resQtyOnOutboundTransfer; Rec."Res. Qty. on Outbound Transfer")
                {
                    Caption = 'Res. Qty. on Outbound Transfer';
                }
                field(resQtyOnInboundTransfer; Rec."Res. Qty. on Inbound Transfer")
                {
                    Caption = 'Res. Qty. on Inbound Transfer';
                }
                field(resQtyOnSalesReturns; Rec."Res. Qty. on Sales Returns")
                {
                    Caption = 'Res. Qty. on Sales Returns';
                }
                field(resQtyOnPurchReturns; Rec."Res. Qty. on Purch. Returns")
                {
                    Caption = 'Res. Qty. on Purch. Returns';
                }
                field(stockoutWarning; Rec."Stockout Warning")
                {
                    Caption = 'Stockout Warning';
                }
                field(preventNegativeInventory; Rec."Prevent Negative Inventory")
                {
                    Caption = 'Prevent Negative Inventory';
                }
                field(variantMandatoryIfExists; Rec."Variant Mandatory if Exists")
                {
                    Caption = 'Variant Mandatory if Exists';
                }
                field(costOfOpenProductionOrders; Rec."Cost of Open Production Orders")
                {
                    Caption = 'Cost of Open Production Orders';
                }
                field(applicationWkshUserID; Rec."Application Wksh. User ID")
                {
                    Caption = 'Application Wksh. User ID';
                }
                field(coupledToCRM; Rec."Coupled to CRM")
                {
                    Caption = 'Coupled to Dynamics 365 Sales';
                }
                field(coupledToDataverse; Rec."Coupled to Dataverse")
                {
                    Caption = 'Coupled to Dynamics 365 Sales';
                }
                field(assemblyPolicy; Rec."Assembly Policy")
                {
                    Caption = 'Assembly Policy';
                }
                field(resQtyOnAssemblyOrder; Rec."Res. Qty. on Assembly Order")
                {
                    Caption = 'Res. Qty. on Assembly Order';
                }
                field(resQtyOnAsmComp; Rec."Res. Qty. on  Asm. Comp.")
                {
                    Caption = 'Res. Qty. on  Asm. Comp.';
                }
                field(qtyOnAssemblyOrder; Rec."Qty. on Assembly Order")
                {
                    Caption = 'Qty. on Assembly Order';
                }
                field(qtyOnAsmComponent; Rec."Qty. on Asm. Component")
                {
                    Caption = 'Qty. on Asm. Component';
                }
                field(qtyOnJobOrder; Rec."Qty. on Job Order")
                {
                    Caption = 'Qty. on Project Order';
                }
                field(resQtyOnJobOrder; Rec."Res. Qty. on Job Order")
                {
                    Caption = 'Res. Qty. on Project Order';
                }
                field(gtin; Rec.GTIN)
                {
                    Caption = 'GTIN';
                }
                field(defaultDeferralTemplateCode; Rec."Default Deferral Template Code")
                {
                    Caption = 'Default Deferral Template Code';
                }
                field(lowLevelCode; Rec."Low-Level Code")
                {
                    Caption = 'Low-Level Code';
                }
                field(lotSize; Rec."Lot Size")
                {
                    Caption = 'Lot Size';
                }
                field(serialNos; Rec."Serial Nos.")
                {
                    Caption = 'Serial Nos.';
                }
                field(lastUnitCostCalcDate; Rec."Last Unit Cost Calc. Date")
                {
                    Caption = 'Last Unit Cost Calc. Date';
                }
                field(rolledUpMaterialCost; Rec."Rolled-up Material Cost")
                {
                    Caption = 'Rolled-up Material Cost';
                }
                field(rolledUpCapacityCost; Rec."Rolled-up Capacity Cost")
                {
                    Caption = 'Rolled-up Capacity Cost';
                }
                field(scrap; Rec."Scrap %")
                {
                    Caption = 'Scrap %';
                }
                field(inventoryValueZero; Rec."Inventory Value Zero")
                {
                    Caption = 'Inventory Value Zero';
                }
                field(discreteOrderQuantity; Rec."Discrete Order Quantity")
                {
                    Caption = 'Discrete Order Quantity';
                }
                field(minimumOrderQuantity; Rec."Minimum Order Quantity")
                {
                    Caption = 'Minimum Order Quantity';
                }
                field(maximumOrderQuantity; Rec."Maximum Order Quantity")
                {
                    Caption = 'Maximum Order Quantity';
                }
                field(safetyStockQuantity; Rec."Safety Stock Quantity")
                {
                    Caption = 'Safety Stock Quantity';
                }
                field(orderMultiple; Rec."Order Multiple")
                {
                    Caption = 'Order Multiple';
                }
                field(safetyLeadTime; Rec."Safety Lead Time")
                {
                    Caption = 'Safety Lead Time';
                }
                field(flushingMethod; Rec."Flushing Method")
                {
                    Caption = 'Flushing Method';
                }
                field(replenishmentSystem; Rec."Replenishment System")
                {
                    Caption = 'Replenishment System';
                }
                field(scheduledReceiptQty; Rec."Scheduled Receipt (Qty.)")
                {
                    Caption = 'Scheduled Receipt (Qty.)';
                }
                field(scheduledNeedQty; Rec."Scheduled Need (Qty.)")
                {
                    Caption = 'Scheduled Need (Qty.)';
                }
                field(roundingPrecision; Rec."Rounding Precision")
                {
                    Caption = 'Rounding Precision';
                }
                field(salesUnitOfMeasure; Rec."Sales Unit of Measure")
                {
                    Caption = 'Sales Unit of Measure';
                }
                field(purchUnitOfMeasure; Rec."Purch. Unit of Measure")
                {
                    Caption = 'Purch. Unit of Measure';
                }
                field(timeBucket; Rec."Time Bucket")
                {
                    Caption = 'Time Bucket';
                }
                field(reservedQtyOnProdOrder; Rec."Reserved Qty. on Prod. Order")
                {
                    Caption = 'Reserved Qty. on Prod. Order';
                }
                field(resQtyOnProdOrderComp; Rec."Res. Qty. on Prod. Order Comp.")
                {
                    Caption = 'Res. Qty. on Prod. Order Comp.';
                }
                field(resQtyOnReqLine; Rec."Res. Qty. on Req. Line")
                {
                    Caption = 'Res. Qty. on Req. Line';
                }
                field(reorderingPolicy; Rec."Reordering Policy")
                {
                    Caption = 'Reordering Policy';
                }
                field(includeInventory; Rec."Include Inventory")
                {
                    Caption = 'Include Inventory';
                }
                field(manufacturingPolicy; Rec."Manufacturing Policy")
                {
                    Caption = 'Manufacturing Policy';
                }
                field(reschedulingPeriod; Rec."Rescheduling Period")
                {
                    Caption = 'Rescheduling Period';
                }
                field(lotAccumulationPeriod; Rec."Lot Accumulation Period")
                {
                    Caption = 'Lot Accumulation Period';
                }
                field(dampenerPeriod; Rec."Dampener Period")
                {
                    Caption = 'Dampener Period';
                }
                field(dampenerQuantity; Rec."Dampener Quantity")
                {
                    Caption = 'Dampener Quantity';
                }
                field(overflowLevel; Rec."Overflow Level")
                {
                    Caption = 'Overflow Level';
                }
                field(planningTransferShipQty; Rec."Planning Transfer Ship. (Qty).")
                {
                    Caption = 'Planning Transfer Ship. (Qty).';
                }
                field(planningWorksheetQty; Rec."Planning Worksheet (Qty.)")
                {
                    Caption = 'Planning Worksheet (Qty.)';
                }
                field(stockkeepingUnitExists; Rec."Stockkeeping Unit Exists")
                {
                    Caption = 'Stockkeeping Unit Exists';
                }
                field(manufacturerCode; Rec."Manufacturer Code")
                {
                    Caption = 'Manufacturer Code';
                }
                field(itemCategoryCode; Rec."Item Category Code")
                {
                    Caption = 'Item Category Code';
                }
                field(createdFromNonstockItem; Rec."Created From Nonstock Item")
                {
                    Caption = 'Created From Catalog Item';
                }
                field(substitutesExist; Rec."Substitutes Exist")
                {
                    Caption = 'Substitutes Exist';
                }
                field(qtyInTransit; Rec."Qty. in Transit")
                {
                    Caption = 'Qty. in Transit';
                }
                field(transOrdReceiptQty; Rec."Trans. Ord. Receipt (Qty.)")
                {
                    Caption = 'Trans. Ord. Receipt (Qty.)';
                }
                field(transOrdShipmentQty; Rec."Trans. Ord. Shipment (Qty.)")
                {
                    Caption = 'Trans. Ord. Shipment (Qty.)';
                }
                field(purchasingCode; Rec."Purchasing Code")
                {
                    Caption = 'Purchasing Code';
                }
                field(qtyAssignedToShip; Rec."Qty. Assigned to ship")
                {
                    Caption = 'Qty. Assigned to ship';
                }
                field(qtyPicked; Rec."Qty. Picked")
                {
                    Caption = 'Qty. Picked';
                }
                // field(excludedFromCostAdjustment; Rec."Excluded from Cost Adjustment")
                // {
                //     Caption = 'Excluded from Cost Adjustment';
                // }
                field(serviceItemGroup; Rec."Service Item Group")
                {
                    Caption = 'Service Item Group';
                }
                field(qtyOnServiceOrder; Rec."Qty. on Service Order")
                {
                    Caption = 'Qty. on Service Order';
                }
                field(resQtyOnServiceOrders; Rec."Res. Qty. on Service Orders")
                {
                    Caption = 'Res. Qty. on Service Orders';
                }
                field(itemTrackingCode; Rec."Item Tracking Code")
                {
                    Caption = 'Item Tracking Code';
                }
                field(lotNos; Rec."Lot Nos.")
                {
                    Caption = 'Lot Nos.';
                }
                field(expirationCalculation; Rec."Expiration Calculation")
                {
                    Caption = 'Expiration Calculation';
                }
                field(qtyOnPurchReturn; Rec."Qty. on Purch. Return")
                {
                    Caption = 'Qty. on Purch. Return';
                }
                field(qtyOnSalesReturn; Rec."Qty. on Sales Return")
                {
                    Caption = 'Qty. on Sales Return';
                }
                field(noOfSubstitutes; Rec."No. of Substitutes")
                {
                    Caption = 'No. of Substitutes';
                }
                field(warehouseClassCode; Rec."Warehouse Class Code")
                {
                    Caption = 'Warehouse Class Code';
                }
                field(specialEquipmentCode; Rec."Special Equipment Code")
                {
                    Caption = 'Special Equipment Code';
                }
                field(putAwayTemplateCode; Rec."Put-away Template Code")
                {
                    Caption = 'Put-away Template Code';
                }
                field(putAwayUnitOfMeasureCode; Rec."Put-away Unit of Measure Code")
                {
                    Caption = 'Put-away Unit of Measure Code';
                }
                field(physInvtCountingPeriodCode; Rec."Phys Invt Counting Period Code")
                {
                    Caption = 'Phys Invt Counting Period Code';
                }
                field(lastCountingPeriodUpdate; Rec."Last Counting Period Update")
                {
                    Caption = 'Last Counting Period Update';
                }
                field(lastPhysInvtDate; Rec."Last Phys. Invt. Date")
                {
                    Caption = 'Last Phys. Invt. Date';
                }
                field(useCrossDocking; Rec."Use Cross-Docking")
                {
                    Caption = 'Use Cross-Docking';
                }
                field(nextCountingStartDate; Rec."Next Counting Start Date")
                {
                    Caption = 'Next Counting Start Date';
                }
                field(nextCountingEndDate; Rec."Next Counting End Date")
                {
                    Caption = 'Next Counting End Date';
                }
                field(unitGroupExists; Rec."Unit Group Exists")
                {
                    Caption = 'Unit Group Exists';
                }
                field(identifierCode; Rec."Identifier Code")
                {
                    Caption = 'Identifier Code';
                }
                field(unitOfMeasureId; Rec."Unit of Measure Id")
                {
                    Caption = 'Unit of Measure Id';
                }
                field(taxGroupId; Rec."Tax Group Id")
                {
                    Caption = 'Tax Group Id';
                }
                field(salesBlocked; Rec."Sales Blocked")
                {
                    Caption = 'Sales Blocked';
                }
                field(purchasingBlocked; Rec."Purchasing Blocked")
                {
                    Caption = 'Purchasing Blocked';
                }
                field(itemCategoryId; Rec."Item Category Id")
                {
                    Caption = 'Item Category Id';
                }
                field(inventoryPostingGroupId; Rec."Inventory Posting Group Id")
                {
                    Caption = 'Inventory Posting Group Id';
                }
                field(genProdPostingGroupId; Rec."Gen. Prod. Posting Group Id")
                {
                    Caption = 'Gen. Prod. Posting Group Id';
                }
                // field(serviceBlocked; Rec."Service Blocked")
                // {
                //     Caption = 'Service Blocked';
                // }
                field(overReceiptCode; Rec."Over-Receipt Code")
                {
                    Caption = 'Over-Receipt Code';
                }
                field(dutyClass; Rec."Duty Class")
                {
                    Caption = 'Duty Class';
                }
                field(consumptionsQty; Rec."Consumptions (Qty.)")
                {
                    Caption = 'Consumptions (Qty.)';
                }
                field(outputsQty; Rec."Outputs (Qty.)")
                {
                    Caption = 'Outputs (Qty.)';
                }
                field(relScheduledReceiptQty; Rec."Rel. Scheduled Receipt (Qty.)")
                {
                    Caption = 'Rel. Scheduled Receipt (Qty.)';
                }
                field(relScheduledNeedQty; Rec."Rel. Scheduled Need (Qty.)")
                {
                    Caption = 'Rel. Scheduled Need (Qty.)';
                }
                field(satItemClassification; Rec."SAT Item Classification")
                {
                    Caption = 'SAT Item Classification';
                }
                field(satHazardousMaterial; Rec."SAT Hazardous Material")
                {
                    Caption = 'SAT Hazardous Material';
                }
                field(satPackagingType; Rec."SAT Packaging Type")
                {
                    Caption = 'SAT Packaging Type';
                }
                field(satMaterialType; Rec."SAT Material Type")
                {
                    Caption = 'SAT Material Type';
                }
                field(inExtendedDescription; Rec.IN_ExtendedDescription)
                {
                    Caption = 'Extended Description';
                }
                field(inQueue; Rec.IN_Queue)
                {
                    Caption = 'Queue';
                }
                field(bcItemTemplate; Rec.BCItemTemplate)
                {
                    Caption = 'BCItemTemplate';
                }
                field(width; Rec.Width)
                {
                    Caption = 'Width';
                }
                field(height; Rec.Height)
                {
                    Caption = 'Height';
                }
                field(shortDescription; Rec."Short Description")
                {
                    Caption = 'Short Description';
                }
                field(departmentDimension; Rec."Department Dimension")
                {
                    Caption = 'Department Dimension';
                }
                field(divisionDimension; Rec."Division Dimension")
                {
                    Caption = 'Division Dimension';
                }
                field(productLineDimension; Rec."Product Line Dimension")
                {
                    Caption = 'Product Line Dimension';
                }
                field(materialDimension; Rec."Material Dimension")
                {
                    Caption = 'Material Dimension';
                }
                field(lvSourced; Rec."LV Sourced")
                {
                    Caption = 'LV Sourced';
                }
                field(giftCardCL; Rec."Gift Card -CL-")
                {
                    Caption = 'Gift Card';
                }
                field(posPromptGroupCodeCL; Rec."POS Prompt Group Code -CL-")
                {
                    Caption = 'POS Prompt Group Code';
                }
                field(posStoreFilterExistsCL; Rec."POS Store Filter Exists -CL-")
                {
                    Caption = 'POS Store Filter Exists';
                }
                field(routingNo; Rec."Routing No.")
                {
                    Caption = 'Routing No.';
                }
                field(productionBOMNo; Rec."Production BOM No.")
                {
                    Caption = 'Production BOM No.';
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
                field(overheadRate; Rec."Overhead Rate")
                {
                    Caption = 'Overhead Rate';
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
                field(planningIssuesQty; Rec."Planning Issues (Qty.)")
                {
                    Caption = 'Planning Issues (Qty.)';
                }
                field(planningReceiptQty; Rec."Planning Receipt (Qty.)")
                {
                    Caption = 'Planning Receipt (Qty.)';
                }
                field(plannedOrderReceiptQty; Rec."Planned Order Receipt (Qty.)")
                {
                    Caption = 'Planned Order Receipt (Qty.)';
                }
                field(fpOrderReceiptQty; Rec."FP Order Receipt (Qty.)")
                {
                    Caption = 'FP Order Receipt (Qty.)';
                }
                field(relOrderReceiptQty; Rec."Rel. Order Receipt (Qty.)")
                {
                    Caption = 'Rel. Order Receipt (Qty.)';
                }
                field(planningReleaseQty; Rec."Planning Release (Qty.)")
                {
                    Caption = 'Planning Release (Qty.)';
                }
                field(plannedOrderReleaseQty; Rec."Planned Order Release (Qty.)")
                {
                    Caption = 'Planned Order Release (Qty.)';
                }
                field(purchReqReceiptQty; Rec."Purch. Req. Receipt (Qty.)")
                {
                    Caption = 'Purch. Req. Receipt (Qty.)';
                }
                field(purchReqReleaseQty; Rec."Purch. Req. Release (Qty.)")
                {
                    Caption = 'Purch. Req. Release (Qty.)';
                }
                field(orderTrackingPolicy; Rec."Order Tracking Policy")
                {
                    Caption = 'Order Tracking Policy';
                }
                field(prodForecastQuantityBase; Rec."Prod. Forecast Quantity (Base)")
                {
                    Caption = 'Prod. Forecast Quantity (Base)';
                }
                field(qtyOnProdOrder; Rec."Qty. on Prod. Order")
                {
                    Caption = 'Qty. on Prod. Order';
                }
                field(qtyOnComponentLines; Rec."Qty. on Component Lines")
                {
                    Caption = 'Qty. on Component Lines';
                }
                field(critical; Rec.Critical)
                {
                    Caption = 'Critical';
                }
                field(commonItemNo; Rec."Common Item No.")
                {
                    Caption = 'Common Item No.';
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
