codeunit 52606 "ORB Functions"
{
    procedure RestrictZeroTransactionAmountforCreditCardPayment(SalesHeader: Record "Sales Header")
    var
        EFTTransactionRecLcl: Record "EFT Transaction -CL-";
        PaymentMethodLbl: label 'CREDITCARD';
        CRMAGPaymentMethodLbl: Label 'CC MAG';
        NoValidCreditCardErrorLbl: Label 'No Valid Credit Card Authorization Charged, Please Authorize Valid Credit Card to Release Sales Order.';
    begin
        SalesHeader.CalcFields("Amount Including VAT");
        if SalesHeader."Amount Including VAT" > 0 then
            if (SalesHeader."Payment Method Code" = PaymentMethodLbl) or (SalesHeader."Payment Method Code" = CRMAGPaymentMethodLbl) then begin
                EFTTransactionRecLcl.Reset();
                EFTTransactionRecLcl.SetRange("Document Type", SalesHeader."Document Type");
                EFTTransactionRecLcl.SetRange("Document No.", SalesHeader."No.");
                //Charge|Settle|Capture|Refund|Credit|Return Settle|Authorize|Return Authorize|Voice Authorize

                EFTTransactionRecLcl.SetFilter("Method Type", '%1|%2|%3|%4|%5|%6|%7|%8|%9', EFTTransactionRecLcl."Method Type"::Charge, EFTTransactionRecLcl."Method Type"::Settle,
                EFTTransactionRecLcl."Method Type"::Capture, EFTTransactionRecLcl."Method Type"::Refund, EFTTransactionRecLcl."Method Type"::Credit, EFTTransactionRecLcl."Method Type"::"Return Settle",
                EFTTransactionRecLcl."Method Type"::Authorize, EFTTransactionRecLcl."Method Type"::"Return Authorize", EFTTransactionRecLcl."Method Type"::"Voice Authorize");

                EFTTransactionRecLcl.Setfilter("Transaction Status", '%1|%2|%3', EFTTransactionRecLcl."Transaction Status"::Queued, EFTTransactionRecLcl."Transaction Status"::Batched,
                EFTTransactionRecLcl."Transaction Status"::Approved);
                EFTTransactionRecLcl.SetFilter("Expiration Filter", '<%1', WorkDate());
                EFTTransactionRecLcl.CalcSums("Transaction Amount");

                if EFTTransactionRecLcl."Transaction Amount" <= 0 then
                    Error(NoValidCreditCardErrorLbl);
            end;
    end;

    procedure CheckForShippingAgentCode(SalesHeader: Record "Sales Header")
    begin
        if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then begin
            if (SalesHeader."Shipping Agent Code" = '') and (SalesHeader."Shipping Agent Service Code" = '') then
                Error('Shipping Agent Code and Shipping Agent Service have a value of "blank". Both fields need a value other than "blank"');
            if (SalesHeader."Shipping Agent Code" = '') then
                Error('Shipping Agent Code cannot have a value of "blank"');
            if SalesHeader."Shipping Agent Service Code" = '' then
                Error('Shipping Agent Service Code cannot have a value of "blank"');
        end;
    end;

    procedure CheckForShippingCollect(SalesHeader: Record "Sales Header")
    var
        NoCollectwithoutCaseLbl: Label 'Collect Orders need to have a Case No';
        NoCollectOrderFedexLbl: Label 'Collect Orders cannot Ship FEDEX';
        ShippingAgentCodeVarLcl: Text;
    begin
        clear(ShippingAgentCodeVarLcl);
        ShippingAgentCodeVarLcl := SalesHeader."Shipping Agent Code";
        if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then begin
            if (SalesHeader."Sales Order Payment Type" = SalesHeader."Sales Order Payment Type"::Collect) then begin
                if (ShippingAgentCodeVarLcl.Contains('FED')) then
                    Error(NoCollectOrderFedexLbl);
                if (SalesHeader."Case No." = '') then
                    Error(NoCollectwithoutCaseLbl);
            end;

        end;
    end;

    procedure CheckForSenderReceiverPaymentType(SalesHeader: Record "Sales Header")
    var
        NotAllowedSenderReceiverLbl: Label 'Payment Type %1 is not allowed';
    begin
        if (SalesHeader."Sales Order Payment Type" = SalesHeader."Sales Order Payment Type"::Sender) or
        (SalesHeader."Sales Order Payment Type" = SalesHeader."Sales Order Payment Type"::Receiver) then
            Error(NotAllowedSenderReceiverLbl, Format(SalesHeader."Sales Order Payment Type"));
    end;

    procedure ValidateOnSalesRelease(SalesHeader: Record "Sales Header")
    begin
        CheckForShippingAgentCode(SalesHeader);
        CheckForSenderReceiverPaymentType(SalesHeader);
        CheckForShippingCollect(SalesHeader);
        RestrictZeroTransactionAmountforCreditCardPayment(SalesHeader);
    end;

    procedure CalcINBINQty(ProdOrderComponents: Record "Prod. Order Component"): Decimal
    var
        WarehouseActLinRecLcl: Record "Warehouse Activity Line";
        WarehouseEntryRecLcl: Record "Warehouse Entry";
    begin
        WarehouseActLinRecLcl.Reset();
        WarehouseActLinRecLcl.SetCurrentKey("Source No.", "Source Line No.", "Source Subline No.", "Bin Code", "Action Type");
        WarehouseActLinRecLcl.SetRange("Source No.", ProdOrderComponents."Prod. Order No.");
        WarehouseActLinRecLcl.SetRange("Source Line No.", ProdOrderComponents."Prod. Order Line No.");
        WarehouseActLinRecLcl.SetRange("Source Subline No.", ProdOrderComponents."Line No.");
        WarehouseActLinRecLcl.SetRange("Bin Code", ProdOrderComponents."Bin Code");
        WarehouseActLinRecLcl.SetRange("Action Type", WarehouseActLinRecLcl."Action Type"::Place);
        IF WarehouseActLinRecLcl.FindSet() then
            WarehouseActLinRecLcl.CalcSums(Quantity);

        WarehouseEntryRecLcl.Reset();
        WarehouseEntryRecLcl.SetCurrentKey("Source No.", "Source Line No.", "Source Subline No.", "Bin Code", "Reference Document");
        WarehouseEntryRecLcl.SetRange("Source No.", ProdOrderComponents."Prod. Order No.");
        WarehouseEntryRecLcl.SetRange("Source Line No.", ProdOrderComponents."Prod. Order Line No.");
        WarehouseEntryRecLcl.SetRange("Source Subline No.", ProdOrderComponents."Line No.");
        WarehouseEntryRecLcl.SetRange("Bin Code", ProdOrderComponents."Bin Code");
        WarehouseEntryRecLcl.SetRange("Reference Document", WarehouseEntryRecLcl."Reference Document"::Pick);
        IF WarehouseEntryRecLcl.FindSet() then
            WarehouseEntryRecLcl.CalcSums(Quantity);

        exit(WarehouseActLinRecLcl.Quantity + WarehouseEntryRecLcl.Quantity);
    end;

    procedure CalcReviewRequiredQty(ProdOrderComponents: Record "Prod. Order Component"): Decimal
    var
        WarehouseActLinRecLcl: Record "Warehouse Activity Line";
        WarehouseEntryRecLcl: Record "Warehouse Entry";
        WarehouseEntry2RecLcl: Record "Warehouse Entry";
    begin
        WarehouseActLinRecLcl.Reset();
        WarehouseActLinRecLcl.SetCurrentKey("Source No.", "Source Line No.", "Source Subline No.", "Bin Code", "Action Type");
        WarehouseActLinRecLcl.SetRange("Source No.", ProdOrderComponents."Prod. Order No.");
        WarehouseActLinRecLcl.SetRange("Source Line No.", ProdOrderComponents."Prod. Order Line No.");
        WarehouseActLinRecLcl.SetRange("Source Subline No.", ProdOrderComponents."Line No.");
        WarehouseActLinRecLcl.SetRange("Bin Code", ProdOrderComponents."Bin Code");
        WarehouseActLinRecLcl.SetRange("Action Type", WarehouseActLinRecLcl."Action Type"::Place);
        IF WarehouseActLinRecLcl.FindSet() then
            WarehouseActLinRecLcl.CalcSums(Quantity);

        WarehouseEntryRecLcl.Reset();
        WarehouseEntryRecLcl.SetCurrentKey("Source No.", "Source Line No.", "Source Subline No.", "Bin Code", "Reference Document");
        WarehouseEntryRecLcl.SetRange("Source No.", ProdOrderComponents."Prod. Order No.");
        WarehouseEntryRecLcl.SetRange("Source Line No.", ProdOrderComponents."Prod. Order Line No.");
        WarehouseEntryRecLcl.SetRange("Source Subline No.", ProdOrderComponents."Line No.");
        WarehouseEntryRecLcl.SetRange("Bin Code", ProdOrderComponents."Bin Code");
        WarehouseEntryRecLcl.SetRange("Reference Document", WarehouseEntryRecLcl."Reference Document"::Pick);
        IF WarehouseEntryRecLcl.FindSet() then
            WarehouseEntryRecLcl.CalcSums(Quantity);

        WarehouseEntry2RecLcl.Reset();
        WarehouseEntry2RecLcl.SetCurrentKey("Source No.", "Source Line No.", "Source Subline No.", "Bin Code", "Reference Document");
        WarehouseEntry2RecLcl.SetRange("Source No.", ProdOrderComponents."Prod. Order No.");
        WarehouseEntry2RecLcl.SetRange("Source Line No.", ProdOrderComponents."Prod. Order Line No.");
        WarehouseEntry2RecLcl.SetRange("Source Subline No.", ProdOrderComponents."Line No.");
        WarehouseEntry2RecLcl.SetRange("Bin Code", ProdOrderComponents."Bin Code");
        WarehouseEntry2RecLcl.SetRange("Reference Document", WarehouseEntry2RecLcl."Reference Document"::"Prod.");
        IF WarehouseEntry2RecLcl.FindSet() then
            WarehouseEntry2RecLcl.CalcSums(Quantity);

        exit(WarehouseActLinRecLcl.Quantity + WarehouseEntryRecLcl.Quantity - Abs(WarehouseEntry2RecLcl.Quantity));
    end;


    procedure UpdateTakeZone(WarehouseActHeaderPar: Record "Warehouse Activity Header")
    var
        WarehouseActLineRecLcl: Record "Warehouse Activity Line";
        WarehouseActLine2RecLcl: Record "Warehouse Activity Line";
        BinContentsRecLcl: Record "Bin Content";
        BinQtyFoundVarLcl: Boolean;
        BinRecLcl: Record Bin;
    begin
        if not Confirm('Are you sure you want to update the "Take" line zone code', false) then
            exit;

        WarehouseActLineRecLcl.Reset();
        WarehouseActLineRecLcl.SetRange("Activity Type", WarehouseActLineRecLcl."Activity Type"::Pick);
        WarehouseActLineRecLcl.SetRange("No.", WarehouseActHeaderPar."No.");
        WarehouseActLineRecLcl.SetRange("Action Type", WarehouseActLineRecLcl."Action Type"::Place);
        if WarehouseActLineRecLcl.FindSet() then
            repeat
                WarehouseActLine2RecLcl.Reset();
                WarehouseActLine2RecLcl.SetRange("Activity Type", WarehouseActLine2RecLcl."Activity Type"::Pick);
                WarehouseActLine2RecLcl.SetRange("No.", WarehouseActLineRecLcl."No.");
                WarehouseActLine2RecLcl.SetRange("Item No.", WarehouseActLineRecLcl."Item No.");
                WarehouseActLine2RecLcl.SetRange("Source No.", WarehouseActLineRecLcl."Source No.");
                WarehouseActLine2RecLcl.SetRange("Source Line No.", WarehouseActLineRecLcl."Source Line No.");
                WarehouseActLine2RecLcl.SetRange("Action Type", WarehouseActLine2RecLcl."Action Type"::Take);
                WarehouseActLine2RecLcl.SetRange("Variant Code", WarehouseActLineRecLcl."Variant Code");
                WarehouseActLine2RecLcl.SetFilter("Line No.", '<%1', WarehouseActLineRecLcl."Line No.");
                if WarehouseActLine2RecLcl.FindLast() then begin
                    WarehouseActLine2RecLcl.Validate("Zone Code", WarehouseActLineRecLcl."Zone Code");

                    Clear(BinQtyFoundVarLcl);
                    BinContentsRecLcl.Reset();
                    BinContentsRecLcl.SetRange("Item No.", WarehouseActLine2RecLcl."Item No.");
                    BinContentsRecLcl.SetRange("Location Code", WarehouseActLine2RecLcl."Location Code");
                    BinContentsRecLcl.SetRange("Zone Code", WarehouseActLine2RecLcl."Zone Code");
                    BinContentsRecLcl.SetRange("Variant Code", WarehouseActLine2RecLcl."Variant Code");
                    if BinContentsRecLcl.FindFirst() then
                        repeat
                            BinRecLcl.get(BinContentsRecLcl."Location Code", BinContentsRecLcl."Bin Code");
                            if BinRecLcl."Bin Type Code" = 'PICK/PUT' then begin
                                if BinContentsRecLcl.CalcQtyAvailToTakeUOM() >= WarehouseActLine2RecLcl.Quantity then begin
                                    WarehouseActLine2RecLcl.Validate("Bin Code", BinContentsRecLcl."Bin Code");
                                    BinQtyFoundVarLcl := true;
                                end;
                            end;
                        until (BinContentsRecLcl.Next() = 0) or BinQtyFoundVarLcl;

                    WarehouseActLine2RecLcl.Modify();
                end;
            until WarehouseActLineRecLcl.Next() = 0;

        if GuiAllowed then
            Message('Warehouse Pick Lines updated.');
    end;

    procedure SendOrderConfirmationEmailItem(SalesHeader: Record "Sales Header"; HideEditor: Boolean)
    var
        TempEmailItem: Record "Email Item" temporary;
        Customer: Record Customer;
        EmailScenrio: Enum "Email Scenario";
    begin
        Customer.Get(SalesHeader."Sell-to Customer No.");
        TempEmailItem."Send to" := SalesHeader."Sell-To Email (Custom)";
        TempEmailItem."Subject" := 'Orbus Order #' + SalesHeader."No." + 'confirmation';
        TempEmailItem.SetBodyText(GenerateOrderConfirmationEmailBody());
        AddAttachmentToCustomerOrderConfirmation(TempEmailItem, SalesHeader);
        TempEmailItem.Send(HideEditor, EmailScenrio::Default);
    end;

    procedure GetOrderConfirmationReportandLayoutCode(var ReportId: Integer; var LayoutCode: Code[20]; var ReportLayoutSelection: Record "Report Layout Selection")
    var
        Reportselections: Record "Report Selections";
    begin
        ReportId := Report::"ORB Email Confirmation Layout";
        if ReportLayoutSelection.Get(ReportId, CompanyName) then;
    end;

    procedure GenerateOrderConfirmationEmailBody() BodyText: Text
    var
        ReportLayoutSelection: Record "Report Layout Selection";
        TempBlob: Codeunit "Temp Blob";
        ReportInStream: InStream;
        ReportOutStream: OutStream;
        LayoutCode: Code[20];
        ReportId: Integer;
        StartDate: Date;
        EndDate: Date;
    begin
        TempBlob.CreateOutStream(ReportOutStream);
        GetOrderConfirmationReportandLayoutCode(ReportId, LayoutCode, ReportLayoutSelection);
        LayoutCode := ReportLayoutSelection."Custom Report Layout Code";
        ReportLayoutSelection.SetTempLayoutSelected(LayoutCode);
        Report.SaveAs(Report::"ORB Email Confirmation Layout", '', ReportFormat::Html, ReportOutStream);
        ReportLayoutSelection.SetTempLayoutSelected('');
        TempBlob.CreateInStream(ReportInStream);
        ReportInStream.ReadText(BodyText);
    end;

    local procedure AddAttachmentToCustomerOrderConfirmation(var TempEmailItem: Record "Email Item" temporary; SalesHeader: Record "Sales Header")
    var
        ReportSelection: Record "Report Selections";
        TempBlob: Codeunit "Temp Blob";
        CustomerRecordRef: RecordRef;
        StartDate: Date;
        EndDate: Date;
        ReportInStream: InStream;
        ReportOutStream: OutStream;
        IntialDate: Date;
        ReportId: Integer;
        ReportUsage: Enum "Report Selection Usage";
        AttachmentFileNameLbl: Label 'Sales Order %1.pdf', Comment = '%1 Order No.';
        ReportParameter: Label '<?xml version="1.0" standalone="yes"?><ReportParameters name="Standard Sales - Order Conf." id="1305"><Options><Field name="LogInteraction">true</Field><Field name="DisplayAssemblyInformation">false</Field><Field name="ArchiveDocument">false</Field></Options><DataItems><DataItem name="Header">VERSION(1) SORTING(Field1,Field3) WHERE(Field3=1(%1))</DataItem></DataItems></ReportParameters>';
    begin
        if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then
            ReportUsage := ReportSelection.Usage::"S.Order";
        ReportSelection.SetRange(Usage, ReportUsage);
        if ReportSelection.FindFirst() then;
        TempBlob.CreateOutStream(ReportOutStream);
        Report.SaveAs(ReportSelection."Report ID", StrSubstNo(ReportParameter, SalesHeader."No."), ReportFormat::Pdf, ReportOutStream);
        TempBlob.CreateInStream(ReportInStream);
        TempEmailItem.AddAttachment(ReportInStream, StrSubstNo(AttachmentFileNameLbl, SalesHeader."No."));
    end;

    procedure CreateSalesLine(SalesHeader: Record "Sales Header"; shipmentLine: Record "Warehouse Shipment Line")
    var
        salesline: Record "Sales Line";
        salesline2: Record "Sales Line";
        SalesSetup: Record "Sales & Receivables Setup";
        DSHIPCarrierRateBuffer: Record "DSHIP Carrier Rate Buffer" temporary;
        DSHIPFreightPrice: Record "DSHIP Freight Price";
        SingleInstance: Codeunit "ORB Orbus Single Instance";
        DSHIPPackageRateManagement: Codeunit "DSHIP Package Rate Management";
        salesType: Option " ",Customer,"Customer Price Group","All Customers",Campaign;
        LineNo: Integer;
        TotalUnitPrice: Decimal;
    begin
        SalesHeader.CalcFields("ORB DS Payment Type");
        SalesSetup.Get();
        SalesSetup.TestField("ORB Default Resource for DSHIP");
        salesline2.SetRange("Document Type", salesline."Document Type"::Order);
        salesline2.SetRange("Document No.", SalesHeader."No.");
        if salesline2.FindLast() then
            LineNo := salesline2."Line No." + 10000
        else
            LineNo := 10000;
        DSHIPPackageRateManagement.getSpecificSalesTypeRate(
                                    DSHIPFreightPrice,
                                    SalesHeader."Shipping Agent Code",
                                    DSHIPCarrierRateBuffer,
                                    salesType::"All Customers",
                                    '',
                                    SalesHeader.Amount);
        SingleInstance.SetMarkupPercentage(DSHIPFreightPrice."Markup %");
        if SalesHeader."ORB DS Payment Type" = SalesHeader."ORB DS Payment Type"::COLLECT then
            exit;
        salesline.init();
        salesline.SuspendStatusCheck(true);
        salesline."Document No." := SalesHeader."No.";
        salesline."Document Type" := salesline."Document Type"::Order;
        salesline."Line No." := LineNo;
        salesline.Type := salesline.Type::Resource;
        salesline.Validate("No.", SalesSetup."ORB Default Resource for DSHIP");
        salesline.Validate(Quantity, 1);
        salesline.Validate("Unit Cost", SingleInstance.GetFrieghtPrice());
        //ldRateToReturn * (lrecDShipRatePrice."Markup %" / 100 + 1);
        TotalUnitPrice := (SingleInstance.GetHandlingPrice() + SingleInstance.GetFrieghtPrice()) * (DSHIPFreightPrice."Markup %" / 100 + 1);
        salesline.Validate("Unit Price", TotalUnitPrice);
        salesline.Insert();
    end;

    procedure AutoCreatePick(WhseShptHeader: Record "Warehouse Shipment Header")
    var
        Rec: Record "Warehouse Shipment Line";
        WhseShptLine: Record "Warehouse Shipment Line";
        ReleaseWhseShipment: Codeunit "Whse.-Shipment Release";
        WhseShipmentCreatePick: Report "Whse.-Shipment - Create Pick";
        SortActivity: Enum "Whse. Activity Sorting Method";
    begin
        Rec.Reset();
        Rec.SetRange("No.", WhseShptHeader."No.");
        if Rec.FindSet() then;

        WhseShptLine.Copy(Rec);
        WhseShptHeader.Get(WhseShptLine."No.");
        if WhseShptHeader.Status = WhseShptHeader.Status::Open then
            ReleaseWhseShipment.Release(WhseShptHeader);

        WhseShptHeader.TestField(Status, WhseShptHeader.Status::Released);
        WhseShptLine.SetFilter(Quantity, '>0');
        WhseShptLine.SetRange("Completely Picked", false);
        if WhseShptLine.Find('-') then begin
            WhseShipmentCreatePick.Initialize('', SortActivity::None, false, false, false);
            WhseShipmentCreatePick.SetWhseShipmentLine(WhseShptLine, WhseShptHeader);
            WhseShipmentCreatePick.SetHideValidationDialog(true);
            WhseShipmentCreatePick.UseRequestPage(false);
            WhseShipmentCreatePick.RunModal();
            WhseShipmentCreatePick.GetResultMessage();
            Clear(WhseShipmentCreatePick);
        end;
    end;

    procedure RegisterPick(WarehouseShipmentHeader: Record "Warehouse Shipment Header")
    var
        WhseActivLine: Record "Warehouse Activity Line";
    begin
        WhseActivLine.SetRange("Whse. Document Type", WhseActivLine."Whse. Document Type"::Shipment);
        WhseActivLine.SetRange("Whse. Document No.", WarehouseShipmentHeader."No.");
        if WhseActivLine.FindSet() then
            repeat
                RegisterActivityYesNo(WhseActivLine);
            until WhseActivLine.Next() = 0;
    end;

    procedure RegisterActivityYesNo(WarehouseActivityLine: Record "Warehouse Activity Line")
    var
        WhseActivLine: Record "Warehouse Activity Line";
        IsHandled: Boolean;
    begin
        WhseActivLine.Copy(WarehouseActivityLine);
        WhseActivLine.FilterGroup(3);
        WhseActivLine.SetRange(Breakbulk);
        WhseActivLine.FilterGroup(0);
        Codeunit.Run(CODEUNIT::"Whse.-Act.-Register (Yes/No)", WhseActivLine);
    end;


    procedure PrintPickHeader(WhseActivHeader: Record "Warehouse Activity Header")
    var
        ReportSelectionWhse: Record "Report Selection Warehouse";
    begin
        WhseActivHeader.SetRange(Type, WhseActivHeader.Type::Pick);
        WhseActivHeader.SetRange("No.", WhseActivHeader."No.");
        PrintWhseActivityHeader(WhseActivHeader, ReportSelectionWhse.Usage::Pick, false);
    end;

    procedure PrintWhseActivityHeader(var WhseActivHeader: Record "Warehouse Activity Header"; ReportUsage: Enum "Report Selection Warehouse Usage"; HideDialog: Boolean)
    begin
        PrintDocuments(WhseActivHeader, ReportUsage, not HideDialog);
    end;

    procedure PrintDocuments(RecVarToPrint: Variant; ReportUsage: Enum "Report Selection Warehouse Usage"; ShowRequestPage: Boolean)
    var
        TempReportSelectionWarehouse: Record "Report Selection Warehouse" temporary;
        IsHandled: Boolean;
    begin
        SelectTempReportSelectionsToPrint(TempReportSelectionWarehouse, ReportUsage);
        if TempReportSelectionWarehouse.FindSet() then
            repeat
                Report.RunModal(TempReportSelectionWarehouse."Report ID", ShowRequestPage, false, RecVarToPrint);
            until TempReportSelectionWarehouse.Next() = 0;
    end;

    procedure CalculateSalesTotals(var ThisYearSales: Decimal; var PreviousYearSales: Decimal; var LTMSales: Decimal; var LifetimeSales: Decimal; CustomerNo: Code[20])
    var
        ThisYearStartDate: Date;
        PrevYearStartDate: Date;
        PrevYearEndDate: Date;
        OneYearAgoDate: Date;
        CustLedgEntry: Record "Cust. Ledger Entry";
        GLEntry: Record "G/L Entry";
        GLEntriesQuery: Query "ORB Get G/L Entries Value";
    begin

        //Reset variable values
        ThisYearSales := 0;
        PreviousYearSales := 0;
        LTMSales := 0;
        LifetimeSales := 0;

        // Initialize date ranges
        ThisYearStartDate := DMY2Date(1, 1, Date2DMY(WorkDate(), 3));
        PrevYearStartDate := DMY2Date(1, 1, Date2DMY(WorkDate(), 3) - 1);
        PrevYearEndDate := DMY2Date(31, 12, Date2DMY(WorkDate(), 3) - 1);
        OneYearAgoDate := CalcDate('<-1Y>', WorkDate());

        // Calculate This Year Sales Total
        Clear(GLEntriesQuery);
        GLEntriesQuery.SetRange(PostingDate, ThisYearStartDate, WorkDate());
        GLEntriesQuery.SetRange(Document_Type, GLEntry."Document Type"::Invoice);
        GLEntriesQuery.SetRange(SourceType, GLEntry."Source Type"::Customer);
        GLEntriesQuery.SetRange(SourceNo, CustomerNo);
        GLEntriesQuery.setfilter(G_L_Account_No_, '4* &<>41100 &<>41110');
        if GLEntriesQuery.Open() then
            if GLEntriesQuery.Read() then
                ThisYearSales := Abs(GLEntriesQuery.Amount);
        GLEntriesQuery.Close();

        // Calculate Previous Year Sales Total
        Clear(GLEntriesQuery);
        GLEntriesQuery.SetRange(PostingDate, PrevYearStartDate, PrevYearEndDate);
        GLEntriesQuery.SetRange(Document_Type, GLEntry."Document Type"::Invoice);
        GLEntriesQuery.SetRange(SourceType, GLEntry."Source Type"::Customer);
        GLEntriesQuery.SetRange(SourceNo, CustomerNo);
        GLEntriesQuery.setfilter(G_L_Account_No_, '4* &<>41100 &<>41110');
        if GLEntriesQuery.Open() then
            if GLEntriesQuery.Read() then
                PreviousYearSales := Abs(GLEntriesQuery.Amount);
        GLEntriesQuery.Close();

        // Calculate LTM Sales Total
        Clear(GLEntriesQuery);
        GLEntriesQuery.SetRange(PostingDate, OneYearAgoDate, WorkDate());
        GLEntriesQuery.SetRange(Document_Type, GLEntry."Document Type"::Invoice);
        GLEntriesQuery.SetRange(SourceType, GLEntry."Source Type"::Customer);
        GLEntriesQuery.SetRange(SourceNo, CustomerNo);
        GLEntriesQuery.setfilter(G_L_Account_No_, '4* &<>41100 &<>41110');
        if GLEntriesQuery.Open() then
            if GLEntriesQuery.Read() then
                LTMSales := Abs(GLEntriesQuery.Amount);
        GLEntriesQuery.Close();

        // Calculate Lifetime Sales Total
        Clear(GLEntriesQuery);
        GLEntriesQuery.SetRange(Document_Type, GLEntry."Document Type"::Invoice);
        GLEntriesQuery.SetRange(SourceType, GLEntry."Source Type"::Customer);
        GLEntriesQuery.SetRange(SourceNo, CustomerNo);
        GLEntriesQuery.setfilter(G_L_Account_No_, '4* &<>41100 &<>41110');
        if GLEntriesQuery.Open() then
            if GLEntriesQuery.Read() then
                LifetimeSales := Abs(GLEntriesQuery.Amount);
        GLEntriesQuery.Close();
    end;

    procedure CalculateCreditMemoTotals(var ThisYearSalesCrMemo: Decimal; var PreviousYearSalesCrMemo: Decimal; var LTMSalesCrMemo: Decimal; var LifetimeSalesCrMemo: Decimal; CustomerNo: Code[20])
    var
        ThisYearStartDate: Date;
        PrevYearStartDate: Date;
        PrevYearEndDate: Date;
        OneYearAgoDate: Date;
        GLEntry: Record "G/L Entry";
        GLEntriesQuery: Query "ORB Get G/L Entries Value";
    begin

        //Reset variable values
        ThisYearSalesCrMemo := 0;
        PreviousYearSalesCrMemo := 0;
        LTMSalesCrMemo := 0;
        LifetimeSalesCrMemo := 0;

        // Initialize date ranges
        ThisYearStartDate := DMY2Date(1, 1, Date2DMY(WorkDate(), 3));
        PrevYearStartDate := DMY2Date(1, 1, Date2DMY(WorkDate(), 3) - 1);
        PrevYearEndDate := DMY2Date(31, 12, Date2DMY(WorkDate(), 3) - 1);
        OneYearAgoDate := CalcDate('<-1Y>', WorkDate());

        // Calculate This Year Sales Credit Memo Total
        Clear(GLEntriesQuery);
        GLEntriesQuery.SetRange(PostingDate, ThisYearStartDate, WorkDate());
        GLEntriesQuery.SetRange(Document_Type, GLEntry."Document Type"::"Credit Memo");
        GLEntriesQuery.SetRange(SourceType, GLEntry."Source Type"::Customer);
        GLEntriesQuery.SetRange(SourceNo, CustomerNo);
        GLEntriesQuery.setfilter(G_L_Account_No_, '4* &<>41100 &<>41110');
        if GLEntriesQuery.Open() then
            if GLEntriesQuery.Read() then
                ThisYearSalesCrMemo := GLEntriesQuery.Amount;
        GLEntriesQuery.Close();

        // Calculate Previous Year Sales Credit Memo Total
        Clear(GLEntriesQuery);
        GLEntriesQuery.SetRange(PostingDate, PrevYearStartDate, PrevYearEndDate);
        GLEntriesQuery.SetRange(Document_Type, GLEntry."Document Type"::"Credit Memo");
        GLEntriesQuery.SetRange(SourceType, GLEntry."Source Type"::Customer);
        GLEntriesQuery.SetRange(SourceNo, CustomerNo);
        GLEntriesQuery.setfilter(G_L_Account_No_, '4* &<>41100 &<>41110');
        if GLEntriesQuery.Open() then
            if GLEntriesQuery.Read() then
                PreviousYearSalesCrMemo := GLEntriesQuery.Amount;
        GLEntriesQuery.Close();

        // Calculate LTM Sales Credit Memo Total
        Clear(GLEntriesQuery);
        GLEntriesQuery.SetRange(PostingDate, OneYearAgoDate, WorkDate());
        GLEntriesQuery.SetRange(Document_Type, GLEntry."Document Type"::"Credit Memo");
        GLEntriesQuery.SetRange(SourceType, GLEntry."Source Type"::Customer);
        GLEntriesQuery.SetRange(SourceNo, CustomerNo);
        GLEntriesQuery.setfilter(G_L_Account_No_, '4* &<>41100 &<>41110');
        if GLEntriesQuery.Open() then
            if GLEntriesQuery.Read() then
                LTMSalesCrMemo := GLEntriesQuery.Amount;
        GLEntriesQuery.Close();

        // Calculate Lifetime Sales Credit Memo Total           
        Clear(GLEntriesQuery);
        GLEntriesQuery.SetRange(Document_Type, GLEntry."Document Type"::"Credit Memo");
        GLEntriesQuery.SetRange(SourceType, GLEntry."Source Type"::Customer);
        GLEntriesQuery.SetRange(SourceNo, CustomerNo);
        GLEntriesQuery.setfilter(G_L_Account_No_, '4* &<>41100 &<>41110');
        if GLEntriesQuery.Open() then
            if GLEntriesQuery.Read() then
                LifetimeSalesCrMemo := GLEntriesQuery.Amount;
        GLEntriesQuery.Close();

    end;

    local procedure SelectTempReportSelectionsToPrint(var TempReportSelectionWarehouse: Record "Report Selection Warehouse"; ReportUsage: Enum "Report Selection Warehouse Usage")
    var
        ReportSelectionMgt: Codeunit "Report Selection Mgt.";
        IsHandled: Boolean;
    begin
        ReportSelectionWarehouse.SetRange(Usage, ReportUsage);
        if ReportSelectionWarehouse.IsEmpty() then
            ReportSelectionMgt.InitReportSelectionWhse(ReportSelectionWarehouse.Usage);

        if ReportSelectionWarehouse.FindSet() then
            repeat
                TempReportSelectionWarehouse := ReportSelectionWarehouse;
                if TempReportSelectionWarehouse.Insert() then;
            until ReportSelectionWarehouse.Next() = 0;
    end;

    procedure AutomaticShipToAddressValidation(SalesHeaderRec: Record "Sales Header")
    var
        AddressValidation: Codeunit "DSHIP Address Validation";
    begin
        if SalesHeaderRec."Ship-to Country/Region Code" = 'US' then begin
            AddressValidation.RunAddressValidation(SalesHeaderRec, true);
        end;
    end;


    var
        ReportSelectionWarehouse: Record "Report Selection Warehouse";

}
