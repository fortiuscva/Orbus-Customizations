codeunit 52606 "ORB Functions"
{
    procedure RestrictZeroTransactionAmountforCreditCardPayment(SalesHeader: Record "Sales Header")
    var
        EFTTransactionRecLcl: Record "EFT Transaction -CL-";
        PaymentMethodLbl: label 'CREDITCARD';
        NoValidCreditCardErrorLbl: Label 'No Valid Credit Card Authorization Charged, Please Authorize Valid Credit Card to Release Sales Order.';
    begin
        SalesHeader.CalcFields("Amount Including VAT");
        if SalesHeader."Amount Including VAT" > 0 then
            if SalesHeader."Payment Method Code" = PaymentMethodLbl then begin
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
                WarehouseActLine2RecLcl.SetFilter("Line No.", '<%1', WarehouseActLineRecLcl."Line No.");
                if WarehouseActLine2RecLcl.FindLast() then begin
                    WarehouseActLine2RecLcl.Validate("Zone Code", WarehouseActLineRecLcl."Zone Code");

                    Clear(BinQtyFoundVarLcl);
                    BinContentsRecLcl.Reset();
                    BinContentsRecLcl.SetRange("Item No.", WarehouseActLine2RecLcl."Item No.");
                    BinContentsRecLcl.SetRange("Location Code", WarehouseActLine2RecLcl."Location Code");
                    BinContentsRecLcl.SetRange("Zone Code", WarehouseActLine2RecLcl."Zone Code");
                    if BinContentsRecLcl.FindFirst() then
                        repeat
                            if BinContentsRecLcl.CalcQtyAvailToTakeUOM() >= WarehouseActLine2RecLcl.Quantity then begin
                                WarehouseActLine2RecLcl.Validate("Bin Code", BinContentsRecLcl."Bin Code");
                                BinQtyFoundVarLcl := true;
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

    procedure CreateSalesLine(SalesHeader: Record "Sales Header")
    var
        salesline: Record "Sales Line";
        salesline2: Record "Sales Line";
        SalesSetup: Record "Sales & Receivables Setup";
        SingleInstance: Codeunit "ORB Orbus Single Instance";
        LineNo: Integer;
    begin
        SalesSetup.Get();
        SalesSetup.TestField("ORB Default Resource for DSHIP");
        salesline2.SetRange("Document Type", salesline."Document Type"::Order);
        salesline2.SetRange("Document No.", SalesHeader."No.");
        if salesline2.FindLast() then
            LineNo := salesline2."Line No." + 10000
        else
            LineNo := 10000;
        salesline.init();
        salesline.SuspendStatusCheck(true);
        salesline."Document No." := SalesHeader."No.";
        salesline."Document Type" := salesline."Document Type"::Order;
        salesline."Line No." := LineNo;
        salesline.Type := salesline.Type::Resource;
        salesline.Validate("No.", SalesSetup."ORB Default Resource for DSHIP");
        salesline.Validate(Quantity, 1);
        salesline.Validate("Unit Cost", SingleInstance.GetHandlingPrice());
        salesline.Validate("Unit Price", SingleInstance.GetHandlingPrice());
        salesline.Insert();
    end;
}
