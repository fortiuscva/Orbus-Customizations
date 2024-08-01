report 52607 "FinishedProdOrd with zero Qty"
{
    Caption = 'Finished Production Order with zero Qty';
    ApplicationArea = all;
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    dataset
    {
        dataitem("Prod. Order Line"; "Prod. Order Line")
        {
            RequestFilterFields = SystemCreatedAt;
            trigger OnPreDataItem()
            begin
                SetRange(Status, Status::Finished);
                SetRange("Finished Quantity", 0);
                Clear(TempExcelBufferRecGbl);
                TempExcelBufferRecGbl.DeleteAll();
                ProductionOrderDetailsTempRecGbl.DeleteAll();
                TempExcelBufferRecGbl.AddColumn('Prodcution Order No', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Prodcution Item ', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Status', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Work Center No', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Routing Link code', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Description', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Finished Quantity', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Component', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Remaining Qunatity', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Production Order posted by', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('ShopFloor Employee', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
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
                UserRecLc1: Record User;
                ProductionOrderDetailsTempRecLcl: record "ORB Finished ProdOrder ZeroQty";
            begin
                clear(ProductionOrderDetailsTempRecGbl);
                clear(ProdOrderRoutingLineRecLcl);
                clear(ProdOrderComponentRecLcl);
                ProdOrderRoutingLineRecLcl.SetRange("Prod. Order No.", "Prod. Order Line"."Prod. Order No.");
                ProdOrderRoutingLineRecLcl.SetRange("Routing Reference No.", "Prod. Order Line"."Line No.");
                ProdOrderRoutingLineRecLcl.SetRange("SFI Finished Quantity", 0);
                If ProdOrderRoutingLineRecLcl.FindSet() then
                    repeat
                        if ProductionOrderDetailsTempRecGbl.FindLast() then
                            ProductionOrderDetailsTempRecGbl."Entry No." := ProductionOrderDetailsTempRecGbl."Entry No." + 1
                        else
                            ProductionOrderDetailsTempRecGbl."Entry No." := 1;
                        ProductionOrderDetailsTempRecGbl."Production Order No" := "Prod. Order Line"."Prod. Order No.";
                        ProductionOrderDetailsTempRecGbl."Production Line Item" := "Prod. Order Line"."Item No.";
                        ProductionOrderDetailsTempRecGbl.Description := ProdOrderRoutingLineRecLcl.Description;
                        ProductionOrderDetailsTempRecGbl."Work Center No" := ProdOrderRoutingLineRecLcl."Work Center No.";
                        ProductionOrderDetailsTempRecGbl."Production Line Item" := "Prod. Order Line"."Item No.";
                        ProductionOrderDetailsTempRecGbl."Routing Link Code" := ProdOrderRoutingLineRecLcl."Routing Link Code";
                        ProductionOrderDetailsTempRecGbl.ProdorderlineNo := "Prod. Order Line"."Line No.";
                        ProductionOrderDetailsTempRecGbl.Status := Format("Prod. Order Line".Status);
                        if UserRecLc1.Get("Prod. Order Line".SystemCreatedBy) then
                            ProductionOrderDetailsTempRecGbl."Production Order Posted by" := UserRecLc1."User Name";
                        SFITimeCardLineRecLc1.reset;
                        SFITimeCardLineRecLc1.SetRange("Document Type", SFITimeCardLineRecLc1."Document Type"::"Prod. Order");
                        SFITimeCardLineRecLc1.SetRange("Document No.", "Prod. Order Line"."Prod. Order No.");
                        SFITimeCardLineRecLc1.SetRange("Document Line No.", "Prod. Order Line"."Line No.");
                        SFITimeCardLineRecLc1.SetRange("Task No.", ProdOrderRoutingLineRecLcl."Operation No.");
                        if SFITimeCardLineRecLc1.FindFirst() then
                            ProductionOrderDetailsTempRecGbl."ShopFloor Employee" := SFITimeCardLineRecLc1."Employee Name";
                        ProductionOrderDetailsTempRecGbl."Remaining Qty" := 0;
                        ProductionOrderDetailsTempRecGbl."Component Item No" := '';
                        ProductionOrderDetailsTempRecGbl.Insert;
                    until (ProdOrderRoutingLineRecLcl.next = 0);
                //check for components 
                ProductionOrderDetailsTempRecGbl.reset;
                Entryno := ProductionOrderDetailsTempRecGbl.Count;
                ProdOrderComponentRecLcl.SetRange("Prod. Order No.", "Prod. Order Line"."Prod. Order No.");
                ProdOrderComponentRecLcl.SetRange("Prod. Order Line No.", "Prod. Order Line"."Line No.");
                If ProdOrderComponentRecLcl.FindSet() then begin
                    repeat
                        ProductionOrderDetailsTempRecGbl.reset;
                        ProductionOrderDetailsTempRecGbl.SetRange("Production Line Item", "Prod. Order Line"."Item No.");//
                        ProductionOrderDetailsTempRecGbl.SetRange("Production Order No", "Prod. Order Line"."Prod. Order No.");
                        ProductionOrderDetailsTempRecGbl.SetRange(ProdorderlineNo, ProdOrderComponentRecLcl."Prod. Order Line No.");
                        ProductionOrderDetailsTempRecGbl.SetRange("Routing Link Code", ProdOrderComponentRecLcl."Routing Link Code");
                        If not ProductionOrderDetailsTempRecGbl.FindSet() then begin
                            Entryno += 1;
                            ProductionOrderDetailsTempRecLcl."Entry No." := Entryno;
                            ProductionOrderDetailsTempRecLcl.status := Format("Prod. Order Line".status);
                            ProductionOrderDetailsTempRecLcl."Production Order No" := "Prod. Order Line"."Prod. Order No.";
                            ProductionOrderDetailsTempRecLcl.Description := ProductionOrderDetailsTempRecGbl.Description;
                            ProductionOrderDetailsTempRecLcl."Production Line Item" := "Prod. Order Line"."Item No.";
                            ProductionOrderDetailsTempRecLcl."Routing Link Code" := ProdOrderComponentRecLcl."Routing Link Code";
                            ProductionOrderDetailsTempRecLcl."Component Item No" := ProdOrderComponentRecLcl."Item No.";
                            ProductionOrderDetailsTempRecLcl.ProdorderlineNo := ProdOrderComponentRecLcl."Prod. Order Line No.";
                            ProductionOrderDetailsTempRecLcl."Remaining Qty" := ProdOrderComponentRecLcl."Remaining Quantity";
                            ProductionOrderDetailsTempRecLcl.ProdorderlineNo := ProdOrderComponentRecLcl."Prod. Order Line No.";
                            ProductionOrderDetailsTempRecGbl."Work Center No" := '';
                            if UserRecLc1.Get("Prod. Order Line".SystemCreatedBy) then
                                ProductionOrderDetailsTempRecLcl."Production Order Posted by" := UserRecLc1."User Name";
                            ProductionOrderDetailsTempRecLcl.insert;
                        end else begin
                            ProductionOrderDetailsTempRecGbl.SetRange("Component Item No", '');
                            if ProductionOrderDetailsTempRecGbl.FindFirst() then begin
                                ProductionOrderDetailsTempRecGbl."Component Item No" := ProdOrderComponentRecLcl."Item No.";
                                ProductionOrderDetailsTempRecGbl."Remaining Qty" := ProdOrderComponentRecLcl."Remaining Quantity";
                                ProductionOrderDetailsTempRecGbl.Modify()
                            end else begin //insert a new line for the component matching routing 
                                clear(ProductionOrderDetailsTempRecLcl);
                                Entryno += 1;
                                ProductionOrderDetailsTempRecLcl."Entry No." := Entryno;
                                ProductionOrderDetailsTempRecLcl.status := Format("Prod. Order Line".status);
                                ProductionOrderDetailsTempRecLcl."Production Order No" := "Prod. Order Line"."Prod. Order No.";
                                ProductionOrderDetailsTempRecLcl.status := Format("Prod. Order Line".status);
                                ProductionOrderDetailsTempRecLcl.Description := ProductionOrderDetailsTempRecGbl.Description;
                                ProductionOrderDetailsTempRecLcl."Production Line Item" := "Prod. Order Line"."Item No.";
                                ProductionOrderDetailsTempRecLcl."Routing Link Code" := ProdOrderComponentRecLcl."Routing Link Code";
                                ProductionOrderDetailsTempRecLcl."Component Item No" := ProdOrderComponentRecLcl."Item No.";
                                ProductionOrderDetailsTempRecLcl.ProdorderlineNo := ProdOrderComponentRecLcl."Prod. Order Line No.";
                                ProductionOrderDetailsTempRecLcl."Remaining Qty" := ProdOrderComponentRecLcl."Remaining Quantity";
                                ProductionOrderDetailsTempRecLcl.ProdorderlineNo := ProdOrderComponentRecLcl."Prod. Order Line No.";
                                ProductionOrderDetailsTempRecLcl."Work Center No" := ProductionOrderDetailsTempRecGbl."Work Center No";
                                ProductionOrderDetailsTempRecLcl."Production Order Posted by" := ProductionOrderDetailsTempRecGbl."Production Order Posted by";
                                ProductionOrderDetailsTempRecLcl.insert;
                            end;
                        end;
                    until (ProdOrderComponentRecLcl.next = 0);
                end else begin
                    ProductionOrderDetailsTempRecGbl.reset;
                    ProductionOrderDetailsTempRecGbl.SetRange("Production Order No", "Prod. Order Line"."Prod. Order No.");
                    ProductionOrderDetailsTempRecGbl.SetRange(ProdorderlineNo, "Prod. Order Line"."Line No.");
                    if ProductionOrderDetailsTempRecGbl.FindSet() then begin
                        ProductionOrderDetailsTempRecGbl.ModifyAll("Component Item No", '');
                        ProductionOrderDetailsTempRecGbl.ModifyAll("Remaining Qty", 0);
                    end
                end;
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
            }
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
                TempExcelBufferRecGbl.AddColumn(ProductionOrderDetailsTempRecGbl."Production Order No", false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn(ProductionOrderDetailsTempRecGbl."Production Line Item", false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn(ProductionOrderDetailsTempRecGbl.Status, false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn(ProductionOrderDetailsTempRecGbl."Work Center No", false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn(ProductionOrderDetailsTempRecGbl."Routing Link Code", false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn(ProductionOrderDetailsTempRecGbl.Description, false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn(ProductionOrderDetailsTempRecGbl."Finished Quantity", false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn(ProductionOrderDetailsTempRecGbl."Component Item No", false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn(ProductionOrderDetailsTempRecGbl."Remaining Qty", false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Number);
                TempExcelBufferRecGbl.AddColumn(ProductionOrderDetailsTempRecGbl."Production Order Posted by", false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn(ProductionOrderDetailsTempRecGbl."ShopFloor Employee", false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
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
        ProductionOrderDetailsTempRecGbl: record "ORB Finished ProdOrder ZeroQty";
        TempExcelBufferRecGbl: Record "Excel Buffer" temporary;
        Entryno: Integer;




}



