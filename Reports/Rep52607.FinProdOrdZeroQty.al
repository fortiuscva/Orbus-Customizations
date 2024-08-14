report 52607 "ORB Fin. Prod. Ord. Zero Qty."
{
    Caption = 'Finished Production Order With Zero Qty.';
    ApplicationArea = all;
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    dataset
    {
        dataitem("Prod. Order Line"; "Prod. Order Line")
        {
            DataItemTableView = sorting(Status, "Prod. Order No.", "Line No.") where(Status = filter(Finished), "Finished Quantity" = const(0));
            RequestFilterFields = SystemCreatedAt;
            trigger OnPreDataItem()
            begin
                //SetRange(Status, Status::Finished);
                //SetRange("Finished Quantity", 0);

                Clear(TempExcelBufferRecGbl);
                TempExcelBufferRecGbl.DeleteAll();


                Clear(ProductionOrderDetailsTempRecGbl);
                ProductionOrderDetailsTempRecGbl.DeleteAll();

                NextEntryNo := 0;
                if ProductionOrderDetailsTempRecGbl.FindLast() then
                    NextEntryNo := ProductionOrderDetailsTempRecGbl."Entry No.";


                TempExcelBufferRecGbl.AddColumn('Prodcution Order No.', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Prodcution Item ', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Status', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Work Center No.', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Routing Link Code', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Description', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Finished Quantity', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Component', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Remaining Quantity', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Production Order Posted By', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                //TempExcelBufferRecGbl.AddColumn('Shopfloor Employee', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.NewRow();


            end;

            trigger OnPostDataItem()
            begin
                ExportToExcel();
                OpenExcel();
            end;

            trigger OnAfterGetRecord()
            var
                ProdOrderRoutingLineRecLcl: Record "Prod. Order Routing Line";
                ProdOrderComponentRecLcl: Record "Prod. Order Component";
                SFITimeCardLineRecLc1: Record "SFI Time Card Line";
                ProdOrderHeaderRecLcl: Record "Production Order";
                ShopfloorEmployeeRecLc1: Record "SFI Employee";
                UserRecLcl: Record User;
            begin

                ProdOrderRoutingLineRecLcl.Reset();
                ProdOrderRoutingLineRecLcl.SetRange(Status, "Prod. Order Line".Status);
                ProdOrderRoutingLineRecLcl.SetRange("Prod. Order No.", "Prod. Order Line"."Prod. Order No.");
                ProdOrderRoutingLineRecLcl.SetRange("Routing Reference No.", "Prod. Order Line"."Line No.");
                ProdOrderRoutingLineRecLcl.SetRange("SFI Finished Quantity", 0);
                If ProdOrderRoutingLineRecLcl.FindSet() then
                    repeat
                        NextEntryNo += 1;
                        ProductionOrderDetailsTempRecGbl.Init();
                        ProductionOrderDetailsTempRecGbl."Entry No." := NextEntryNo;
                        ProductionOrderDetailsTempRecGbl."Prod. Order No." := "Prod. Order Line"."Prod. Order No.";
                        ProductionOrderDetailsTempRecGbl."Prod. Line Item No." := "Prod. Order Line"."Item No.";
                        ProductionOrderDetailsTempRecGbl.Description := ProdOrderRoutingLineRecLcl.Description;
                        ProductionOrderDetailsTempRecGbl."Work Center No." := ProdOrderRoutingLineRecLcl."Work Center No.";
                        ProductionOrderDetailsTempRecGbl."Routing Link Code" := ProdOrderRoutingLineRecLcl."Routing Link Code";
                        ProductionOrderDetailsTempRecGbl."Prod. Order Line No." := "Prod. Order Line"."Line No.";
                        ProductionOrderDetailsTempRecGbl.Status := "Prod. Order Line".Status;
                        if not UserRecLcl.Get("Prod. Order Line".SystemCreatedBy) then
                            UserRecLcl.Init();
                        ProductionOrderDetailsTempRecGbl."Prod. Order Posted By" := UserRecLcl."User Name";

                        // SFITimeCardLineRecLc1.reset;
                        // SFITimeCardLineRecLc1.SetRange("Document Type", SFITimeCardLineRecLc1."Document Type"::"Prod. Order");
                        // SFITimeCardLineRecLc1.SetRange("Document No.", "Prod. Order Line"."Prod. Order No.");
                        // SFITimeCardLineRecLc1.SetRange("Document Line No.", "Prod. Order Line"."Line No.");
                        // SFITimeCardLineRecLc1.SetRange("Task No.", ProdOrderRoutingLineRecLcl."Operation No.");
                        // if SFITimeCardLineRecLc1.FindFirst() then
                        //     ProductionOrderDetailsTempRecGbl."ShopFloor Employee" := SFITimeCardLineRecLc1."Employee Name";

                        ProductionOrderDetailsTempRecGbl."Remaining Qty." := 0;
                        ProductionOrderDetailsTempRecGbl."Component Item No." := '';
                        ProductionOrderDetailsTempRecGbl.Insert;

                    until (ProdOrderRoutingLineRecLcl.next = 0);


                //check for components 

                //ProductionOrderDetailsTempRecGbl.reset;
                //Entryno := ProductionOrderDetailsTempRecGbl.Count;
                ProdOrderComponentRecLcl.Reset();
                ProdOrderComponentRecLcl.SetRange("Prod. Order No.", "Prod. Order Line"."Prod. Order No.");
                ProdOrderComponentRecLcl.SetRange("Prod. Order Line No.", "Prod. Order Line"."Line No.");
                If ProdOrderComponentRecLcl.FindSet() then begin
                    repeat
                        ProductionOrderDetailsTempRecGbl.reset;
                        ProductionOrderDetailsTempRecGbl.SetRange("Prod. Line Item No.", "Prod. Order Line"."Item No.");
                        ProductionOrderDetailsTempRecGbl.SetRange("Prod. Order No.", "Prod. Order Line"."Prod. Order No.");
                        ProductionOrderDetailsTempRecGbl.SetRange("Prod. Order Line No.", ProdOrderComponentRecLcl."Prod. Order Line No.");
                        ProductionOrderDetailsTempRecGbl.SetRange("Routing Link Code", ProdOrderComponentRecLcl."Routing Link Code");
                        if not ProductionOrderDetailsTempRecGbl.FindSet() then begin
                            NextEntryNo += 1;

                            ProductionOrderDetailsTempRecGbl.Init();
                            ProductionOrderDetailsTempRecGbl."Entry No." := NextEntryNo;
                            ProductionOrderDetailsTempRecGbl.Status := "Prod. Order Line".status;
                            ProductionOrderDetailsTempRecGbl."Prod. Order No." := "Prod. Order Line"."Prod. Order No.";
                            ProductionOrderDetailsTempRecGbl.Description := ProductionOrderDetailsTempRecGbl.Description;
                            ProductionOrderDetailsTempRecGbl."Prod. Line Item No." := "Prod. Order Line"."Item No.";
                            ProductionOrderDetailsTempRecGbl."Routing Link Code" := ProdOrderComponentRecLcl."Routing Link Code";
                            ProductionOrderDetailsTempRecGbl."Component Item No." := ProdOrderComponentRecLcl."Item No.";
                            ProductionOrderDetailsTempRecGbl."Prod. Order Line No." := ProdOrderComponentRecLcl."Prod. Order Line No.";
                            ProductionOrderDetailsTempRecGbl."Remaining Qty." := ProdOrderComponentRecLcl."Remaining Quantity";
                            ProductionOrderDetailsTempRecGbl."Prod. Order Line No." := ProdOrderComponentRecLcl."Prod. Order Line No.";
                            ProductionOrderDetailsTempRecGbl."Work Center No." := '';
                            if not UserRecLcl.Get("Prod. Order Line".SystemCreatedBy) then
                                UserRecLcl.Init();
                            ProductionOrderDetailsTempRecGbl."Prod. Order Posted By" := UserRecLcl."User Name";
                            ProductionOrderDetailsTempRecGbl.Insert();
                        end else begin
                            if ProductionOrderDetailsTempRecGbl."Component Item No." = '' then begin
                                ProductionOrderDetailsTempRecGbl."Component Item No." := ProdOrderComponentRecLcl."Item No.";
                                ProductionOrderDetailsTempRecGbl."Remaining Qty." := ProdOrderComponentRecLcl."Remaining Quantity";
                                ProductionOrderDetailsTempRecGbl.Modify()
                            end else begin
                                NextEntryNo += 1;
                                ProductionOrderDetailsTempRecGbl2.Copy(ProductionOrderDetailsTempRecGbl, true);
                                ProductionOrderDetailsTempRecGbl.Init();
                                ProductionOrderDetailsTempRecGbl."Entry No." := NextEntryNo;
                                ProductionOrderDetailsTempRecGbl.Status := "Prod. Order Line".Status;
                                ProductionOrderDetailsTempRecGbl."Prod. Order No." := "Prod. Order Line"."Prod. Order No.";
                                ProductionOrderDetailsTempRecGbl.Description := ProductionOrderDetailsTempRecGbl2.Description;
                                ProductionOrderDetailsTempRecGbl."Prod. Line Item No." := "Prod. Order Line"."Item No.";
                                ProductionOrderDetailsTempRecGbl."Routing Link Code" := ProdOrderComponentRecLcl."Routing Link Code";
                                ProductionOrderDetailsTempRecGbl."Component Item No." := ProdOrderComponentRecLcl."Item No.";
                                ProductionOrderDetailsTempRecGbl."Prod. Order Line No." := ProdOrderComponentRecLcl."Prod. Order Line No.";
                                ProductionOrderDetailsTempRecGbl."Remaining Qty." := ProdOrderComponentRecLcl."Remaining Quantity";
                                ProductionOrderDetailsTempRecGbl."Work Center No." := ProductionOrderDetailsTempRecGbl2."Work Center No.";
                                ProductionOrderDetailsTempRecGbl."Prod. Order Posted by" := ProductionOrderDetailsTempRecGbl2."Prod. Order Posted By";
                                ProductionOrderDetailsTempRecGbl.insert;
                            end;
                        end;
                    until (ProdOrderComponentRecLcl.next = 0);
                end;
            end;
        }
    }
    procedure ExportToExcel()
    var
        SalesShptLineRecLcl: Record "Sales Shipment Line";
        PostedVarLcl: Boolean;
    begin
        //export data to excel
        ProductionOrderDetailsTempRecGbl.Reset();
        if ProductionOrderDetailsTempRecGbl.FindSet() then begin
            repeat
                TempExcelBufferRecGbl.AddColumn(ProductionOrderDetailsTempRecGbl."Prod. Order No.", false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn(ProductionOrderDetailsTempRecGbl."Prod. Line Item No.", false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn(ProductionOrderDetailsTempRecGbl.Status, false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn(ProductionOrderDetailsTempRecGbl."Work Center No.", false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn(ProductionOrderDetailsTempRecGbl."Routing Link Code", false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn(ProductionOrderDetailsTempRecGbl.Description, false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn(ProductionOrderDetailsTempRecGbl."Finished Quantity", false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn(ProductionOrderDetailsTempRecGbl."Component Item No.", false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn(ProductionOrderDetailsTempRecGbl."Remaining Qty.", false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Number);
                TempExcelBufferRecGbl.AddColumn(ProductionOrderDetailsTempRecGbl."Prod. Order Posted by", false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                //TempExcelBufferRecGbl.AddColumn(ProductionOrderDetailsTempRecGbl."ShopFloor Employee", false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.NewRow();
            until ProductionOrderDetailsTempRecGbl.Next() = 0;

        end;

    end;

    procedure OpenExcel()
    begin
        TempExcelBufferRecGbl.CreateNewBook('Finished Production Order Details');
        TempExcelBufferRecGbl.WriteSheet('Finished Production Order Details', CompanyName, UserId);
        TempExcelBufferRecGbl.CloseBook();
        TempExcelBufferRecGbl.SetFriendlyFilename('Finished Production Order Details');
        TempExcelBufferRecGbl.OpenExcel();
    end;

    var
        ProductionOrderDetailsTempRecGbl: record "ORB Fin. Prod. Ord. Zero Qty." temporary;
        ProductionOrderDetailsTempRecGbl2: record "ORB Fin. Prod. Ord. Zero Qty." temporary;
        TempExcelBufferRecGbl: Record "Excel Buffer" temporary;
        Entryno: Integer;
        NextEntryNo: Integer;




}



