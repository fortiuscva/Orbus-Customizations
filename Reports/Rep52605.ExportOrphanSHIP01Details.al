report 52605 "Export Orphan SHIP01 Details"
{
    ApplicationArea = All;
    Caption = 'Export Orphan SHIP01 Details';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    dataset
    {
        dataitem("Warehouse Entry"; "Warehouse Entry")
        {
            RequestFilterFields = "Registering Date", "Source No.", "Reference No.";

            trigger OnPreDataItem()
            var
                MovementQtyVarLcl: Decimal;
                FirstTransDateVarLcl: Date;
                AppliedQtyVarLcl: Decimal;
            begin
                Clear(TempExcelBufferRecGbl);
                TempExcelBufferRecGbl.DeleteAll();

                TempExcelBufferRecGbl.AddColumn('Item No.', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Variant Code', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Bin Code', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Order No.', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Order Line No.', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Quantity', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Invoice No.', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('User ID', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Deleted Date', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Cancellation', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('Cancelled Date', false, '', true, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.NewRow();


                //Retrieve all shipments posted for Bin Code SHIP01
                SHIP01OrderDetailsTempRecGbl.Reset();
                Clear(SHIP01OrderDetailsTempRecGbl);
                SHIP01OrderDetailsTempRecGbl.DeleteAll();

                SHIP01OrderDetailsTempRecGbl.Reset();
                if SHIP01OrderDetailsTempRecGbl.FindLast() then
                    NextEntryNoGbl := (SHIP01OrderDetailsTempRecGbl."Entry No." + 1)
                else
                    NextEntryNoGbl := 1;

                RegDateFilter := GetFilter("Registering Date");
                SourceNoFilter := GetFilter("Source No.");
                ReferenceNoFilter := GetFilter("Reference No.");
                if RegDateFilter <> '' then
                    GroupWhseOrderSHIP01QueryGbl.SetFilter(Registering_Date_Filter, RegDateFilter);
                if SourceNoFilter <> '' then
                    GroupWhseOrderSHIP01QueryGbl.SetFilter(Source_No_Filter, SourceNoFilter);
                if ReferenceNoFilter <> '' then
                    GroupWhseOrderSHIP01QueryGbl.SetFilter(Reference_No_Filter, ReferenceNoFilter);
                GroupWhseOrderSHIP01QueryGbl.Open();
                while GroupWhseOrderSHIP01QueryGbl.Read() do begin
                    SHIP01OrderDetailsTempRecGbl.Init();
                    SHIP01OrderDetailsTempRecGbl."Entry No." := NextEntryNoGbl;
                    SHIP01OrderDetailsTempRecGbl."Source No." := GroupWhseOrderSHIP01QueryGbl.Source_No_;
                    SHIP01OrderDetailsTempRecGbl."Source Line No." := GroupWhseOrderSHIP01QueryGbl.Source_Line_No_;
                    SHIP01OrderDetailsTempRecGbl."Item No." := GroupWhseOrderSHIP01QueryGbl.Item_No_;
                    SHIP01OrderDetailsTempRecGbl."Variant Code" := GroupWhseOrderSHIP01QueryGbl.Variant_Code;
                    SHIP01OrderDetailsTempRecGbl."Location Code" := GroupWhseOrderSHIP01QueryGbl.Location_Code;
                    SHIP01OrderDetailsTempRecGbl."Bin Code" := GroupWhseOrderSHIP01QueryGbl.Bin_Code;
                    SHIP01OrderDetailsTempRecGbl."Qty. in Warehouse" := GroupWhseOrderSHIP01QueryGbl.Qty___Base_;
                    SHIP01OrderDetailsTempRecGbl."Remaining Whse. Qty." := GroupWhseOrderSHIP01QueryGbl.Qty___Base_;
                    SHIP01OrderDetailsTempRecGbl."User ID" := UserId;

                    WhseEntryRecGbl.Reset();
                    WhseEntryRecGbl.SetCurrentKey("Source Type", "Source Subtype", "Source No.", "Source Line No.", "Source Subline No.", "Source Document", "Bin Code");
                    WhseEntryRecGbl.SetRange("Source No.", SHIP01OrderDetailsTempRecGbl."Source No.");
                    WhseEntryRecGbl.SetRange("Source Line No.", SHIP01OrderDetailsTempRecGbl."Source Line No.");
                    WhseEntryRecGbl.SetRange("Location Code", SHIP01OrderDetailsTempRecGbl."Location Code");
                    WhseEntryRecGbl.SetRange("Bin Code", SHIP01OrderDetailsTempRecGbl."Bin Code");
                    WhseEntryRecGbl.SetRange("Item No.", SHIP01OrderDetailsTempRecGbl."Item No.");
                    WhseEntryRecGbl.SetRange("Variant Code", SHIP01OrderDetailsTempRecGbl."Variant Code");
                    if WhseEntryRecGbl.FindLast() then
                        SHIP01OrderDetailsTempRecGbl."Last Transaction Date" := WhseEntryRecGbl."Registering Date";
                    SHIP01OrderDetailsTempRecGbl.Insert();
                    NextEntryNoGbl += 1;
                end;

                //Retrieve all movements for all items after the first transaction date in this execution.
                Clear(FirstTransDateVarLcl);
                SHIP01OrderDetailsTempRecGbl.Reset();
                SHIP01OrderDetailsTempRecGbl.SetCurrentKey("Last Transaction Date");
                if SHIP01OrderDetailsTempRecGbl.FindFirst() then
                    FirstTransDateVarLcl := SHIP01OrderDetailsTempRecGbl."Last Transaction Date";

                clear(SHIP01WhseMvmtDetailsTempRecGbl);
                SHIP01WhseMvmtDetailsTempRecGbl.Reset();
                SHIP01WhseMvmtDetailsTempRecGbl.DeleteAll();

                SHIP01WhseMvmtDetailsTempRecGbl.Init();
                if SHIP01WhseMvmtDetailsTempRecGbl.FindLast() then
                    NextMvmtEntryNoGbl := (SHIP01WhseMvmtDetailsTempRecGbl."Entry No." + 1)
                else
                    NextMvmtEntryNoGbl := 1;

                if FirstTransDateVarLcl <> 0D then begin
                    GroupWhseMvmtSHIP01QueryGbl.SetFilter("Registering_Date_Filter", '>%1', FirstTransDateVarLcl);
                    GroupWhseMvmtSHIP01QueryGbl.Open();
                    while GroupWhseMvmtSHIP01QueryGbl.Read() do begin
                        SHIP01WhseMvmtDetailsTempRecGbl.Init();
                        SHIP01WhseMvmtDetailsTempRecGbl."Entry No." := NextMvmtEntryNoGbl;
                        SHIP01WhseMvmtDetailsTempRecGbl."Item No." := GroupWhseMvmtSHIP01QueryGbl.Item_No_;
                        SHIP01WhseMvmtDetailsTempRecGbl."Variant Code" := GroupWhseMvmtSHIP01QueryGbl.Variant_Code;
                        SHIP01WhseMvmtDetailsTempRecGbl."Location Code" := GroupWhseMvmtSHIP01QueryGbl.Location_Code;
                        SHIP01WhseMvmtDetailsTempRecGbl."Bin Code" := GroupWhseMvmtSHIP01QueryGbl.Bin_Code;
                        SHIP01WhseMvmtDetailsTempRecGbl."Movement Qty." := GroupWhseMvmtSHIP01QueryGbl.Qty___Base_;
                        SHIP01WhseMvmtDetailsTempRecGbl."Remaining Mvmt. Qty." := GroupWhseMvmtSHIP01QueryGbl.Qty___Base_;
                        SHIP01WhseMvmtDetailsTempRecGbl.Insert();
                        NextMvmtEntryNoGbl += 1;
                    end;
                end;

                //Loop through all entries and apply the movement to calculate real orphan qty. after the movement.    
                SHIP01OrderDetailsTempRecGbl.Reset();
                if SHIP01OrderDetailsTempRecGbl.FindSet() then
                    repeat
                        SHIP01WhseMvmtDetailsTempRecGbl.reset;
                        SHIP01WhseMvmtDetailsTempRecGbl.SetRange("Item No.", SHIP01OrderDetailsTempRecGbl."Item No.");
                        SHIP01WhseMvmtDetailsTempRecGbl.SetRange("Variant Code", SHIP01OrderDetailsTempRecGbl."Variant Code");
                        SHIP01WhseMvmtDetailsTempRecGbl.SetRange("Location Code", SHIP01OrderDetailsTempRecGbl."Location Code");
                        SHIP01WhseMvmtDetailsTempRecGbl.SetRange("Bin Code", SHIP01OrderDetailsTempRecGbl."Bin Code");
                        SHIP01WhseMvmtDetailsTempRecGbl.SetFilter("Remaining Mvmt. Qty.", '>%1', 0);
                        if SHIP01WhseMvmtDetailsTempRecGbl.FindSet() then
                            repeat
                                if SHIP01OrderDetailsTempRecGbl."Remaining Whse. Qty." > SHIP01WhseMvmtDetailsTempRecGbl."Remaining Mvmt. Qty." then begin
                                    AppliedQtyVarLcl := SHIP01OrderDetailsTempRecGbl."Remaining Whse. Qty." - SHIP01WhseMvmtDetailsTempRecGbl."Remaining Mvmt. Qty.";
                                    SHIP01OrderDetailsTempRecGbl."Applied Qty." += AppliedQtyVarLcl;
                                    SHIP01OrderDetailsTempRecGbl."Remaining Whse. Qty." -= AppliedQtyVarLcl;
                                    SHIP01WhseMvmtDetailsTempRecGbl."Remaining Mvmt. Qty." := 0
                                end else begin
                                    AppliedQtyVarLcl := (SHIP01WhseMvmtDetailsTempRecGbl."Remaining Mvmt. Qty." - SHIP01OrderDetailsTempRecGbl."Remaining Whse. Qty.");
                                    SHIP01OrderDetailsTempRecGbl."Applied Qty." += AppliedQtyVarLcl;
                                    SHIP01WhseMvmtDetailsTempRecGbl."Remaining Mvmt. Qty." -= AppliedQtyVarLcl;
                                    SHIP01OrderDetailsTempRecGbl."Remaining Whse. Qty." := 0;
                                end;
                                SHIP01OrderDetailsTempRecGbl.Modify()
                            until SHIP01WhseMvmtDetailsTempRecGbl.Next() = 0;
                    until SHIP01OrderDetailsTempRecGbl.Next() = 0;

                ExportToExcel();
            end;
        }
    }
    procedure ExportToExcel()
    begin
        //export data to excel
        SHIP01OrderDetailsTempRecGbl.Reset();
        SHIP01OrderDetailsTempRecGbl.SetFilter("Orphan Qty.", '<>%1', 0);
        if SHIP01OrderDetailsTempRecGbl.FindSet() then
            repeat
                TempExcelBufferRecGbl.AddColumn(SHIP01OrderDetailsTempRecGbl."Item No.", false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn(SHIP01OrderDetailsTempRecGbl."Variant Code", false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn(SHIP01OrderDetailsTempRecGbl."Bin Code", false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn(SHIP01OrderDetailsTempRecGbl."Source No.", false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn(SHIP01OrderDetailsTempRecGbl."Source Line No.", false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn(Format(SHIP01OrderDetailsTempRecGbl."Orphan Qty."), false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Number);
                TempExcelBufferRecGbl.AddColumn('', false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('', false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('', false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('', false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.AddColumn('', false, '', false, false, false, '', TempExcelBufferRecGbl."Cell Type"::Text);
                TempExcelBufferRecGbl.NewRow();
            until SHIP01OrderDetailsTempRecGbl.Next() = 0;

        TempExcelBufferRecGbl.CreateNewBook('Orphan SHIP01 Details');
        TempExcelBufferRecGbl.WriteSheet('SHIP01 Entries', CompanyName, UserId);
        TempExcelBufferRecGbl.CloseBook();

        TempExcelBufferRecGbl.SetFriendlyFilename('Orphan SHIP01 Details');
        TempExcelBufferRecGbl.OpenExcel();
    end;


    var
        GroupWhseOrderSHIP01QueryGbl: Query "Group Warehouse Entries Ship01";
        GroupWhseMvmtSHIP01QueryGbl: Query "ORB Group Whse. Mvmt. Ship01";
        SHIP01OrderDetailsTempRecGbl: Record "ORB Orphan Ship01 Order Det." temporary;
        SHIP01WhseMvmtDetailsTempRecGbl: Record "ORB Orphan Ship01 Whse. Det." temporary;
        TempExcelBufferRecGbl: Record "Excel Buffer" temporary;
        WhseEntryRecGbl: Record "Warehouse Entry";
        RegDateFilter: Text;
        SourceNoFilter: Text;
        ReferenceNoFilter: Text;
        NextEntryNoGbl: Integer;
        NextMvmtEntryNoGbl: Integer;
}


