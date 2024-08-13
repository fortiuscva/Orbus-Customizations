report 52610 "ORB Prod Lines with No Output"
{
    Caption = 'Production Orders with No Output';
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
                SetRange("Finished Quantity", 1);
                Clear(TempExcelBufferRecGbl);
                TempExcelBufferRecGbl.DeleteAll();
                ProductionOrderDetailsTempRecGbl.DeleteAll();
                TempExcelBufferRecGbl.AddColumn('Production Order No', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Production Line Item', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Production Order Status', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Routing Line Finished Quantity', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Work Center No', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Description', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Routing Link code', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Last Posted Date', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Last Modified By', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
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
                SFITimeCardLineRecLc1: Record "SFI Time Card Line";
                ProdOrderHeaderRecLcl: Record "Production Order";
                ShopfloorEmployeeRecLc1: Record "SFI Employee";
                UserRecLc1: Record User;
                ProductionOrderDetailsTempRecLcl: record "ORB Finished ProdOrder ZeroQty";
                SystemRefNo: Integer;
                ProductRecRef: RecordRef;
                ProductFieldRef: FieldRef;
            begin
                clear(ProductionOrderDetailsTempRecGbl);
                clear(ProdOrderRoutingLineRecLcl);
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
                        ProductionOrderDetailsTempRecGbl."Work Center No" := ProdOrderRoutingLineRecLcl."No.";
                        ProductionOrderDetailsTempRecGbl."Production Line Item" := "Prod. Order Line"."Item No.";
                        ProductionOrderDetailsTempRecGbl."Routing Link Code" := ProdOrderRoutingLineRecLcl."Routing Link Code";
                        ProductionOrderDetailsTempRecLcl."Finished Quantity" := ProdOrderRoutingLineRecLcl."SFI Finished Quantity";
                        ProductionOrderDetailsTempRecGbl.ProdorderlineNo := "Prod. Order Line"."Line No.";
                        ProductionOrderDetailsTempRecGbl.Status := Format("Prod. Order Line".Status);
                        ProductionOrderDetailsTempRecGbl."Prod Line Modified DT" := "Prod. Order Line".SystemModifiedAt;
                        UserRecLc1.reset;
                        If UserRecLc1.Get("Prod. Order Line".SystemModifiedBy) then
                            ProductionOrderDetailsTempRecGbl."Prod Line Modified By" := UserRecLc1."User Name"
                        else
                            ProductionOrderDetailsTempRecGbl."Prod Line Modified By" := '';
                        ProductionOrderDetailsTempRecGbl."ShopFloor Employee" := '';
                        ProductionOrderDetailsTempRecGbl."Remaining Qty" := 0;
                        ProductionOrderDetailsTempRecGbl."Component Item No" := '';
                        ProductionOrderDetailsTempRecGbl.Insert;
                    until (ProdOrderRoutingLineRecLcl.next = 0);
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
                TempExcelBufferRecGbl.AddColumn(ProductionOrderDetailsTempRecGbl."Finished Quantity", false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn(ProductionOrderDetailsTempRecGbl."Work Center No", false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn(ProductionOrderDetailsTempRecGbl.Description, false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn(ProductionOrderDetailsTempRecGbl."Routing Link Code", false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn(Format(ProductionOrderDetailsTempRecGbl."Prod Line Modified DT"), false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn(ProductionOrderDetailsTempRecGbl."Prod Line Modified By", false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.NewRow();
            until ProductionOrderDetailsTempRecGbl.Next() = 0;
        end;
    end;

    procedure OpenExcel()
    begin
        TempExcelBufferRecGbl.CreateNewBook('Production Order No Output');
        TempExcelBufferRecGbl.WriteSheet('Production Order No Output', CompanyName, UserId);
        TempExcelBufferRecGbl.CloseBook();
        TempExcelBufferRecGbl.SetFriendlyFilename('Production Orders with No Output');
        TempExcelBufferRecGbl.OpenExcel();

    end;

    var
        ProductionOrderDetailsTempRecGbl: record "ORB Finished ProdOrder ZeroQty" temporary;
        TempExcelBufferRecGbl: Record "Excel Buffer" temporary;
        Entryno: Integer;
        Dt_var: DateTime;


}



