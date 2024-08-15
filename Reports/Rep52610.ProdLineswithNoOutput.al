report 52610 "ORB Prod. Lines With No Output"
{
    Caption = 'Prod. Order Lines with No Output';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    dataset
    {
        dataitem("Prod. Order Line"; "Prod. Order Line")
        {
            RequestFilterFields = SystemCreatedAt;
            DataItemTableView = sorting(Status, "Prod. Order No.", "Line No.") where("Finished Quantity" = filter(<> 0));
            trigger OnPreDataItem()
            begin

                Clear(TempExcelBufferRecGbl);
                TempExcelBufferRecGbl.DeleteAll();

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
                OpenExcel();
            end;

            trigger OnAfterGetRecord()
            var
                ProdOrderRoutingLineRecLcl: Record "Prod. Order Routing Line";
                SFITimeCardLineRecLc1: Record "SFI Time Card Line";
                ProdOrderHeaderRecLcl: Record "Production Order";
                ShopfloorEmployeeRecLc1: Record "SFI Employee";
                UserRecLc1: Record User;
                ProductionOrderDetailsTempRecLcl: record "ORB Fin. Prod. Ord. Zero Qty.";
                SystemRefNo: Integer;
                ProductRecRef: RecordRef;
                ProductFieldRef: FieldRef;
            begin
                ProdOrderRoutingLineRecLcl.Reset();
                ProdOrderRoutingLineRecLcl.SetRange("Prod. Order No.", "Prod. Order Line"."Prod. Order No.");
                ProdOrderRoutingLineRecLcl.SetRange("Routing Reference No.", "Prod. Order Line"."Line No.");
                ProdOrderRoutingLineRecLcl.SetRange("SFI Finished Quantity", 0);
                If ProdOrderRoutingLineRecLcl.FindSet() then
                    repeat
                        TempExcelBufferRecGbl.AddColumn("Prod. Order Line"."Prod. Order No.", false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                        TempExcelBufferRecGbl.AddColumn("Prod. Order Line"."Item No.", false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                        TempExcelBufferRecGbl.AddColumn(Format("Prod. Order Line".Status), false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                        TempExcelBufferRecGbl.AddColumn(Format(ProdOrderRoutingLineRecLcl."SFI Finished Quantity"), false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Number);
                        TempExcelBufferRecGbl.AddColumn(ProdOrderRoutingLineRecLcl."No.", false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                        TempExcelBufferRecGbl.AddColumn(ProdOrderRoutingLineRecLcl.Description, false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                        TempExcelBufferRecGbl.AddColumn(ProdOrderRoutingLineRecLcl."Routing Link Code", false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                        TempExcelBufferRecGbl.AddColumn(Format("Prod. Order Line".SystemModifiedAt), false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                        If not UserRecLc1.Get("Prod. Order Line".SystemModifiedBy) then
                            UserRecLc1.Init();

                        TempExcelBufferRecGbl.AddColumn(UserRecLc1."User Name", false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                        TempExcelBufferRecGbl.NewRow();
                    until (ProdOrderRoutingLineRecLcl.next = 0);
            end;
        }
    }
    requestpage
    {
        SaveValues = true;
    }
    procedure OpenExcel()
    begin
        TempExcelBufferRecGbl.CreateNewBook('Production Order No Output');
        TempExcelBufferRecGbl.WriteSheet('Production Order No Output', CompanyName, UserId);
        TempExcelBufferRecGbl.CloseBook();
        TempExcelBufferRecGbl.SetFriendlyFilename('Production Orders with No Output');
        TempExcelBufferRecGbl.OpenExcel();

    end;

    var
        TempExcelBufferRecGbl: Record "Excel Buffer" temporary;
        Entryno: Integer;
        Dt_var: DateTime;


}



