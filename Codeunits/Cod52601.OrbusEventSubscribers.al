codeunit 52601 "ORB Orbus Event & Subscribers"
{

    [EventSubscriber(ObjectType::Page, Page::"Posted Sales Inv. - Update", OnAfterRecordChanged, '', false, false)]
    local procedure Pag1355_OnAfterRecordChanged(var SalesInvoiceHeader: Record "Sales Invoice Header"; xSalesInvoiceHeader: Record "Sales Invoice Header"; var IsChanged: Boolean);
    begin
        IsChanged := (SalesInvoiceHeader."Sell-to Customer Name" <> xSalesInvoiceHeader."Sell-to Customer Name") or
                     (SalesInvoiceHeader."Bill-to Name" <> xSalesInvoiceHeader."Bill-to Name") or
                     (SalesInvoiceHeader."Ship-to Name" <> xSalesInvoiceHeader."Ship-to Name") or
                     (SalesInvoiceHeader."Sell-to E-Mail" <> xSalesInvoiceHeader."Sell-to E-Mail") or
                     (SalesInvoiceHeader."ORB Email Sent by JQ" <> xSalesInvoiceHeader."ORB Email Sent by JQ") or
                     (SalesInvoiceHeader."External Document No." <> xSalesInvoiceHeader."External Document No.") or
                     (SalesInvoiceHeader."ORB Delayed Ship Reason Code" <> xSalesInvoiceHeader."ORB Delayed Ship Reason Code") or
                     (SalesInvoiceHeader."ORB Delayed Ship Sub-Reason" <> xSalesInvoiceHeader."ORB Delayed Ship Sub-Reason");
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Inv. Header - Edit", OnOnRunOnBeforeTestFieldNo, '', false, false)]
    local procedure Cod1409_OnOnRunOnBeforeTestFieldNo(var SalesInvoiceHeader: Record "Sales Invoice Header"; SalesInvoiceHeaderRec: Record "Sales Invoice Header");
    begin
        SalesInvoiceHeader."Sell-to Customer Name" := SalesInvoiceHeaderRec."Sell-to Customer Name";
        SalesInvoiceHeader."Bill-to Name" := SalesInvoiceHeaderRec."Bill-to Name";
        SalesInvoiceHeader."Ship-to Name" := SalesInvoiceHeaderRec."Ship-to Name";
        SalesInvoiceHeader."Sell-to E-Mail" := SalesInvoiceHeaderRec."Sell-to E-Mail";
        SalesInvoiceHeader."ORB Email Sent by JQ" := SalesInvoiceHeaderRec."ORB Email Sent by JQ";
        SalesInvoiceHeader."External Document No." := SalesInvoiceHeaderRec."External Document No.";
        SalesInvoiceHeader."ORB Delayed Ship Reason Code" := SalesInvoiceHeaderRec."ORB Delayed Ship Reason Code";
        SalesInvoiceHeader."ORB Delayed Ship Sub-Reason" := SalesInvoiceHeaderRec."ORB Delayed Ship Sub-Reason";
    end;

    [EventSubscriber(ObjectType::Page, Page::"Pstd. Sales Cr. Memo - Update", OnAfterRecordChanged, '', false, false)]
    local procedure Pag1354_OnAfterRecordChanged(var SalesCrMemoHeader: Record "Sales Cr.Memo Header"; xSalesCrMemoHeader: Record "Sales Cr.Memo Header"; var IsChanged: Boolean);
    begin
        IsChanged := (SalesCrMemoHeader."Sell-to Customer Name" <> xSalesCrMemoHeader."Sell-to Customer Name") or
                     (SalesCrMemoHeader."Bill-to Name" <> xSalesCrMemoHeader."Bill-to Name") or
                     (SalesCrMemoHeader."Ship-to Name" <> xSalesCrMemoHeader."Ship-to Name") or
                     (SalesCrMemoHeader."External Document No." <> xSalesCrMemoHeader."External Document No.") or
                       // (SalesCrMemoHeader."Your Reference" <> xSalesCrMemoHeader."Your Reference");
                       (SalesCrMemoHeader."ORB Your Reference(CS)" <> xSalesCrMemoHeader."ORB Your Reference(CS)");

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Credit Memo Hdr. - Edit", OnBeforeSalesCrMemoHeaderModify, '', false, false)]
    local procedure Cod1408_OnBeforeSalesCrMemoHeaderModify(var SalesCrMemoHeader: Record "Sales Cr.Memo Header"; FromSalesCrMemoHeader: Record "Sales Cr.Memo Header");
    begin
        SalesCrMemoHeader."Sell-to Customer Name" := FromSalesCrMemoHeader."Sell-to Customer Name";
        SalesCrMemoHeader."Bill-to Name" := FromSalesCrMemoHeader."Bill-to Name";
        SalesCrMemoHeader."Ship-to Name" := FromSalesCrMemoHeader."Ship-to Name";
        SalesCrMemoHeader."External Document No." := FromSalesCrMemoHeader."External Document No.";
        //SalesCrMemoHeader."Your Reference" := FromSalesCrMemoHeader."Your Reference";
        SalesCrMemoHeader."ORB Your Reference(CS)" := FromSalesCrMemoHeader."ORB Your Reference(CS)";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Document Sending Profile", OnSendCustomerRecordsOnBeforeLookupProfile, '', false, false)]
    local procedure Tab60_OnSendCustomerRecordsOnBeforeLookupProfile(ReportUsage: Integer; RecordVariant: Variant; CustomerNo: Code[20]; var RecRefToSend: RecordRef; SingleCustomerSelected: Boolean; var ShowDialog: Boolean);
    begin
        if not GuiAllowed or OrbusSingleInstanceCUGbl.GetEmailSendFromCustomerCardButton() then
            ShowDialog := OrbusSingleInstanceCUGbl.GetOnSendCustomerRecordsOnBeforeLookupProfile();
    end;

    [EventSubscriber(ObjectType::Table, Database::"Report Selections", OnBeforeSendEmailToCust, '', false, false)]
    local procedure Tab77_OnBeforeSendEmailToCust(ReportUsage: Integer; RecordVariant: Variant; DocNo: Code[20]; DocName: Text[150]; var ShowDialog: Boolean; CustNo: Code[20]; var Handled: Boolean)
    begin
        if not GuiAllowed or OrbusSingleInstanceCUGbl.GetEmailSendFromCustomerCardButton() then
            ShowDialog := OrbusSingleInstanceCUGbl.GetOnBeforeSendEmailToCust();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document-Mailing", OnBeforeSendEmail, '', false, false)]
    local procedure Cod260_OnBeforeSendEmail(var TempEmailItem: Record "Email Item" temporary; var IsFromPostedDoc: Boolean; var PostedDocNo: Code[20]; var HideDialog: Boolean; var ReportUsage: Integer; var EmailSentSuccesfully: Boolean; var IsHandled: Boolean; EmailDocName: Text[250]; SenderUserID: Code[50]; EmailScenario: Enum "Email Scenario");
    begin
        if not GuiAllowed or OrbusSingleInstanceCUGbl.GetEmailSendFromCustomerCardButton() then
            HideDialog := OrbusSingleInstanceCUGbl.GetOnBeforeSendEmail();
    end;

    [EventSubscriber(ObjectType::Table, Database::"Document Sending Profile", OnBeforeCheckShowProfileSelectionMethodDialog, '', false, false)]
    local procedure OnBeforeCheckShowProfileSelectionMethodDialog(var ProfileSelectionMethod: Option; AccountNo: Code[20]; IsCustomer: Boolean; var Result: Boolean; var IsHandled: Boolean);
    begin
        if not GuiAllowed or OrbusSingleInstanceCUGbl.GetEmailSendFromCustomerCardButton() then begin
            ProfileSelectionMethod := OrbusSingleInstanceCUGbl.GetOnBeforeCheckShowProfileSelectionMethod();
            IsHandled := OrbusSingleInstanceCUGbl.GetOnBeforeCheckShowProfileSelectionMethodIshandled();
            Result := OrbusSingleInstanceCUGbl.GetOnBeforeCheckShowProfileSelectionMethodResult();
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"DSHIP Event Publisher", OnAfterSetAddress, '', false, false)]
    local procedure OnAfterSetAddress(addressSource: RecordRef; var addressBuffer: Record "DSHIP Address Buffer" temporary; var isValidationRequired: Boolean; var isHandled: Boolean);
    var
        SalesHeaderRecLcl: Record "Sales Header";
        WarehouseShipmentHeaderRecLcl: Record "Warehouse Shipment Header";
        WarehouseShipmentLineRecLcl: Record "Warehouse Shipment Line";
        BillToCustomerRecLcl: Record Customer;
    begin
        if SalesHeaderRecLcl.get(addressSource.RecordId) then begin
            if (addressBuffer."Address Type" = addressBuffer."Address Type"::Destination) or (addressBuffer."Address Type" = addressBuffer."Address Type"::Buffer) then begin
                //if SalesHeaderRecLcl."Ship-to Contact" <> '' then
                addressBuffer.Name := SalesHeaderRecLcl."Ship-to Contact";

                //Update Bill To Customer Phone No.
                if BillToCustomerRecLcl.get(SalesHeaderRecLcl."Bill-to Customer No.") then
                    addressBuffer."Phone No." := BillToCustomerRecLcl."Phone No.";
            end;
        end else begin

            if WarehouseShipmentHeaderRecLcl.get(addressSource.RecordId) then begin
                WarehouseShipmentLineRecLcl.Reset();
                WarehouseShipmentLineRecLcl.SetRange("No.", WarehouseShipmentHeaderRecLcl."No.");
                if WarehouseShipmentLineRecLcl.FindFirst() then begin
                    if SalesHeaderRecLcl.get(SalesHeaderRecLcl."Document Type"::Order, WarehouseShipmentLineRecLcl."Source No.") then begin
                        if (addressBuffer."Address Type" = addressBuffer."Address Type"::Destination) or (addressBuffer."Address Type" = addressBuffer."Address Type"::Buffer) then begin
                            //if SalesHeaderRecLcl."Ship-to Contact" <> '' then
                            addressBuffer.Name := SalesHeaderRecLcl."Ship-to Contact";

                            //Update Bill To Customer Phone No.
                            if BillToCustomerRecLcl.get(SalesHeaderRecLcl."Bill-to Customer No.") then
                                addressBuffer."Phone No." := BillToCustomerRecLcl."Phone No.";
                        end;
                    end;
                end;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post Prepayments", OnBeforeSalesInvHeaderInsert, '', false, false)]
    local procedure Cod442_OnBeforeSalesInvHeaderInsert(var SalesInvHeader: Record "Sales Invoice Header"; SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; GenJnlDocNo: Code[20]);
    begin
        SalesInvHeader."Order No." := SalesHeader."No."
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document-Mailing", OnBeforeGetEmailSubject, '', false, false)]
    local procedure CU260_OnBeforeGetEmailSubject(PostedDocNo: Code[20]; EmailDocumentName: Text[250]; ReportUsage: Integer; var EmailSubject: Text[250]; var IsHandled: Boolean);
    var
        SalesInvHdrRecLcl: Record "Sales Invoice Header";
        CompanyInformation: Record "Company Information";
        EmailSubjectCapTxt: Label '%1 - %2 P.O.# %3', Comment = '%1 = Customer Name. %2 = Document Type %3 = P.O. #';
    begin
        CompanyInformation.get();
        if PostedDocNo <> '' then
            if SalesInvHdrRecLcl.get(PostedDocNo) then begin
                EmailSubject := CopyStr(
                                StrSubstNo(EmailSubjectCapTxt, CompanyInformation.Name, EmailDocumentName, SalesInvHdrRecLcl."External Document No."), 1, MaxStrLen(EmailSubject));
                IsHandled := true;
            end;
    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, OnAfterOnInsert, '', false, false)]
    local procedure OnAfterOnInsert(var Customer: Record Customer; xCustomer: Record Customer);
    begin
        Customer."Tax Liable" := true;
        Customer.Validate("Tax Area Code", 'AVATAX');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Explode BOM", OnBeforeConfirmExplosion, '', false, false)]
    local procedure CU63_OnBeforeConfirmExplosion(var SalesLine: Record "Sales Line"; var Selection: Integer; var HideDialog: Boolean; var NoOfBOMComp: Integer);
    begin
        if OrbusSingleInstanceCUGbl.GetExplodeBOMConfirm() then
            HideDialog := true;

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::ArchiveManagement, OnAfterStoreSalesDocument, '', false, false)]
    local procedure ArchiveManagement_OnAfterStoreSalesDocument(var SalesHeader: Record "Sales Header"; var SalesHeaderArchive: Record "Sales Header Archive")
    var
        SalesHeaderAdditionalFields: Record "ORB Sales Header Add. Fields";
        SalesHeaderArchAddFields: Record "ORB Sales Hdr. Arch. Add. Flds";
    begin
        if SalesHeaderAdditionalFields.Get(SalesHeader."Document Type", SalesHeader."No.") then begin
            SalesHeaderArchAddFields.Init();
            SalesHeaderArchAddFields.TransferFields(SalesHeaderAdditionalFields);
            SalesHeaderArchAddFields."Version No." := SalesHeaderArchive."Version No.";
            SalesHeaderArchAddFields."Doc. No. Occurrence" := SalesHeaderArchive."Doc. No. Occurrence";
            if not SalesHeaderArchAddFields.Insert() then
                SalesHeaderArchAddFields.Modify();
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::ArchiveManagement, OnAfterStoreSalesLineArchive, '', false, false)]
    local procedure ArchiveManagement_OnAfterStoreSalesLineArchive(var SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line"; var SalesHeaderArchive: Record "Sales Header Archive"; var SalesLineArchive: Record "Sales Line Archive")
    var
        SalesLineAdditionalFields: Record "ORB Sales Line Add. Fields";
        SalesLineArchAdditonalFields: Record "ORB Sales Line Arch.Add.Fields";
    begin
        if SaleslineAdditionalFields.Get(SalesLine."Document Type", SalesLine."Document No.", SalesLine."Line No.") then begin
            SalesLineArchAdditonalFields.Init();
            SalesLineArchAdditonalFields.TransferFields(SaleslineAdditionalFields);
            if not SalesLineArchAdditonalFields.Insert() then
                SalesLineArchAdditonalFields.Modify();
        end;
    end;

    /*
    [EventSubscriber(ObjectType::Codeunit, Codeunit::ArchiveManagement, OnAfterAutoArchiveSalesDocument, '', false, false)]
    local procedure ArchiveManagement_OnAfterAutoArchiveSalesDocument(var SalesHeader: Record "Sales Header")
    var
        SalesHeaderAdditionalFields: Record "ORB Sales Header Add. Fields";
        SalesHeaderArchAddFields: Record "ORB Sales Hdr. Arch. Add. Flds";
    begin
        if SalesHeaderAdditionalFields.Get(SalesHeader."Document Type", SalesHeader."No.") then begin
            SalesHeaderArchAddFields.Init();
            SalesHeaderArchAddFields.TransferFields(SalesHeaderAdditionalFields);
            if not SalesHeaderArchAddFields.Insert() then
                SalesHeaderArchAddFields.Modify();
        end;
    end;
    */

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterInsertShipmentHeader, '', false, false)]
    local procedure "Sales-Post_OnAfterInsertShipmentHeader"(var SalesHeader: Record "Sales Header"; var SalesShipmentHeader: Record "Sales Shipment Header")
    var
        SalesHeaderAdditionalFields: Record "ORB Sales Header Add. Fields";
        SalesShipmentHeaderAddFields: Record "ORB Sales Ship. Hdr Add. Flds";
    begin
        if SalesHeaderAdditionalFields.Get(SalesHeader."Document Type", SalesHeader."No.") then begin
            SalesShipmentHeaderAddFields.Init();
            SalesShipmentHeaderAddFields.TransferFields(SalesHeaderAdditionalFields);
            SalesShipmentHeaderAddFields."No." := SalesShipmentHeader."No.";
            if not SalesShipmentHeaderAddFields.Insert() then
                SalesShipmentHeaderAddFields.Modify();
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterInsertShipmentLine, '', false, false)]
    local procedure "Sales-Post_OnAfterInsertShipmentLine"(var SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line"; var SalesShptLine: Record "Sales Shipment Line"; PreviewMode: Boolean; xSalesLine: Record "Sales Line")
    var
        SalesLineAdditionalFields: Record "ORB Sales Line Add. Fields";
        SalesShipLineAddtionalFields: Record "ORB Sales Ship. Line Add Flds";
    begin
        if SalesLineAdditionalFields.Get(SalesLine."Document Type", SalesLine."Document No.", SalesLine."Line No.") then begin
            SalesShipLineAddtionalFields.Init();
            SalesShipLineAddtionalFields.TransferFields(SalesLineAdditionalFields);
            SalesShipLineAddtionalFields."Document No." := SalesShptLine."Document No.";
            SalesShipLineAddtionalFields."Line No." := SalesShptLine."Line No.";
            if not SalesShipLineAddtionalFields.Insert() then
                SalesShipLineAddtionalFields.Modify();
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterInsertInvoiceHeader, '', false, false)]
    local procedure "Sales-Post_OnAfterInsertInvoiceHeader"(var SalesHeader: Record "Sales Header"; var SalesInvHeader: Record "Sales Invoice Header")
    var
        SalesHeaderAdditionalFields: Record "ORB Sales Header Add. Fields";
        SalesInvHeaderAddFields: Record "ORB Sales Inv. Hdr. Add. Flds";
    begin
        if SalesHeaderAdditionalFields.Get(SalesHeader."Document Type", SalesHeader."No.") then begin
            SalesInvHeaderAddFields.Init();
            SalesInvHeaderAddFields.TransferFields(SalesHeaderAdditionalFields);
            SalesInvHeaderAddFields."No." := SalesInvHeader."No.";
            if not SalesInvHeaderAddFields.Insert() then
                SalesInvHeaderAddFields.Modify();
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterSalesInvLineInsert, '', false, false)]
    local procedure "Sales-Post_OnAfterSalesInvLineInsert"(var SalesInvLine: Record "Sales Invoice Line"; SalesInvHeader: Record "Sales Invoice Header"; SalesLine: Record "Sales Line"; ItemLedgShptEntryNo: Integer; WhseShip: Boolean; WhseReceive: Boolean; CommitIsSuppressed: Boolean; var SalesHeader: Record "Sales Header"; var TempItemChargeAssgntSales: Record "Item Charge Assignment (Sales)" temporary; var TempWhseShptHeader: Record "Warehouse Shipment Header" temporary; var TempWhseRcptHeader: Record "Warehouse Receipt Header" temporary; PreviewMode: Boolean)
    var
        SalesLineAdditionalFields: Record "ORB Sales Line Add. Fields";
        SalesInvLineAdditonalFields: Record "ORB Sales Inv. Line Add. Flds";
    begin
        if SalesLineAdditionalFields.Get(SalesLine."Document Type", SalesLine."Document No.", SalesLine."Line No.") then begin
            SalesInvLineAdditonalFields.Init();
            SalesInvLineAdditonalFields.TransferFields(SalesLineAdditionalFields);
            SalesInvLineAdditonalFields."Document No." := SalesInvLine."Document No.";
            SalesInvLineAdditonalFields."Line No." := SalesInvLine."Line No.";
            if not SalesInvLineAdditonalFields.Insert() then
                SalesInvLineAdditonalFields.Modify();
        end;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterInsertCrMemoHeader, '', false, false)]
    local procedure "Sales-Post_OnAfterInsertCrMemoHeader"(var SalesHeader: Record "Sales Header"; var SalesCrMemoHeader: Record "Sales Cr.Memo Header")
    var
        SalesHeaderAdditionalFields: Record "ORB Sales Header Add. Fields";
        SalesCrMemoHeaderAddFields: Record "ORB Sales Cr.M Hdr Add. Flds";
    begin
        if SalesHeaderAdditionalFields.Get(SalesHeader."Document Type", SalesHeader."No.") then begin
            SalesCrMemoHeaderAddFields.Init();
            SalesCrMemoHeaderAddFields.TransferFields(SalesHeaderAdditionalFields);
            SalesCrMemoHeaderAddFields."No." := SalesCrMemoHeader."No.";
            if not SalesCrMemoHeaderAddFields.Insert() then
                SalesCrMemoHeaderAddFields.Modify();
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterSalesCrMemoLineInsert, '', false, false)]
    local procedure "Sales-Post_OnAfterSalesCrMemoLineInsert"(var SalesCrMemoLine: Record "Sales Cr.Memo Line"; SalesCrMemoHeader: Record "Sales Cr.Memo Header"; var SalesHeader: Record "Sales Header"; SalesLine: Record "Sales Line"; var TempItemChargeAssgntSales: Record "Item Charge Assignment (Sales)" temporary; CommitIsSuppressed: Boolean; WhseShip: Boolean; WhseReceive: Boolean; var TempWhseShptHeader: Record "Warehouse Shipment Header" temporary; var TempWhseRcptHeader: Record "Warehouse Receipt Header" temporary)
    var
        SalesLineAdditionalFields: Record "ORB Sales Line Add. Fields";
        SalesCrMemoLineAdditonalFields: Record "ORB Sales CrM. Line Add. Flds";
    begin
        if SalesLineAdditionalFields.Get(SalesLine."Document Type", SalesLine."Document No.", SalesLine."Line No.") then begin
            SalesCrMemoLineAdditonalFields.Init();
            SalesCrMemoLineAdditonalFields.TransferFields(SalesLineAdditionalFields);
            SalesCrMemoLineAdditonalFields."Document No." := SalesCrMemoLine."Document No.";
            SalesCrMemoLineAdditonalFields."Line No." := SalesCrMemoLine."Line No.";
            if not SalesCrMemoLineAdditonalFields.Insert() then
                SalesCrMemoLineAdditonalFields.Modify();
        end;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"PostSales-Delete", OnAfterInitDeleteHeader, '', false, false)]
    local procedure "PostSales-Delete_OnAfterInitDeleteHeader"(SalesHeader: Record "Sales Header"; var SalesShipmentHeader: Record "Sales Shipment Header"; var SalesInvoiceHeader: Record "Sales Invoice Header"; var SalesCrMemoHeader: Record "Sales Cr.Memo Header"; var ReturnReceiptHeader: Record "Return Receipt Header"; var SalesInvoiceHeaderPrepmt: Record "Sales Invoice Header"; var SalesCrMemoHeaderPrepmt: Record "Sales Cr.Memo Header")
    var
        SalesHeaderAdditionalFields: Record "ORB Sales Header Add. Fields";
    begin
        if SalesHeaderAdditionalFields.Get(SalesHeader."Document Type", SalesHeader."No.") then
            SalesHeaderAdditionalFields.Delete();
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"DSHIP Event Publisher", OnBeforeAddRateToOrder, '', false, false)]

    internal procedure OnBeforeAddRateToOrder(docType: Enum "DSHIP Document Type"; docNo: Code[50]; rateRequestSource: Enum "DSHIP Rate Request Source"; var selectedRate: Record "DSHIP Carrier Rate Buffer" temporary; var isHandled: Boolean)
    var
        shipmentheader: Record "Warehouse Shipment Header";
        shipmentLine: Record "Warehouse Shipment Line";
        SalesHeader: Record "Sales Header";
        OrbusFunctions: Codeunit "ORB Functions";
    begin
        if (docType = docType::"Warehouse Shipment") then begin
            shipmentheader.Get(docNo);
            shipmentLine.SetRange("No.", shipmentheader."No.");
            //if shipmentheader."Shipping Agent Code" <> 'TRUCKING' then
            //    exit;
            if shipmentLine.FindFirst() then;

            SalesHeader.Get(SalesHeader."Document Type"::Order, shipmentLine."Source No.");
            OrbusFunctions.CreateSalesLine(SalesHeader, shipmentLine);
        end else
            if (docType = docType::"Sales Order") then begin
                SalesHeader.Get(SalesHeader."Document Type"::Order, docNo);
                OrbusFunctions.CreateSalesLine(SalesHeader, shipmentLine);
            end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"DSHIP Event Publisher", OnAfterProcessMultipleCommands, '', false, false)]
    internal procedure OnAfterProcessMultipleCommands(docType: Enum "DSHIP Document Type"; docNo: Code[50]; var licensePlateNo: Code[50]; var itemNo: Code[50]; scanValue: Text)
    var
        shipmentheader: Record "Warehouse Shipment Header";
        shipmentLine: Record "Warehouse Shipment Line";
        SalesHeader: Record "Sales Header";
        salesline: Record "Sales Line";
    begin
        case scanValue of
            '--unpackall',
                '--upa':
                if (docType = docType::"Warehouse Shipment") then begin
                    shipmentheader.Get(docNo);
                    //if shipmentheader."Shipping Agent Code" <> 'TRUCKING' then
                    //    exit;
                    shipmentLine.SetRange("No.", shipmentheader."No.");
                    if shipmentLine.FindFirst() then;
                    SalesHeader.Get(SalesHeader."Document Type"::Order, shipmentLine."Source No.");
                    salesline.SetRange("Document Type", SalesHeader."Document Type");
                    salesline.SetRange("Document No.", SalesHeader."No.");
                    salesline.SetRange(Type, salesline.Type::Resource);
                    if not salesline.IsEmpty then begin
                        salesline.FindSet();
                        salesline.SuspendStatusCheck(true);
                        salesline.Deleteall();
                    end;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"DSHIP Event Publisher", OnBeforeSetShipmentDetails, '', false, false)]
    internal procedure OnBeforeSetShipmentDetails(recRef: RecordRef; shipAgent: Code[50]; shipAgentSvc: Code[50]; trackingNo: Text; deliveryDays: Integer; var isHandled: Boolean)
    var
        WhseShipmentHeader: Record "Warehouse Shipment Header";
        labelData: Record "DSHIP Label Data";
        lpHeader: Record "IWX LP Header";
        SingleInstance: Codeunit "ORB Orbus Single Instance";
    begin
        if recRef.Number() = Database::"Warehouse Shipment Header" then
            recRef.SetTable(WhseShipmentHeader);
        lpHeader.SetRange("Source No.", WhseShipmentHeader."No.");
        //if WhseShipmentHeader."Shipping Agent Code" <> 'TRUCKING' then
        //    exit;
        if lpHeader.FindFirst() then begin
            labelData.SetRange("Label Type", labelData."Label Type"::Shipping);
            labelData.SetRange("Label Format", labelData."Label Format"::PNG);
            labelData.SetRange("License Plate No.", lpHeader."No.");
            if labelData.FindFirst() then begin
                labelData."ORB Handling" := SingleInstance.GetHandlingPrice();
                if labelData."ORB Handling" = 0 then
                    labelData."ORB Handling" := SingleInstance.GetMarkupAmountPrice();
                labelData."ORB Freight Quote" := SingleInstance.GetFreightQuote();
                labelData."ORB Markup %" := SingleInstance.GetMarkupPercentage();
                labelData.Modify();
                SingleInstance.Reset();
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"DSHIP Event Publisher", OnBeforeProcessMultipleCommands, '', false, false)]
    internal procedure OnBeforeProcessMultipleCommands(docType: Enum "DSHIP Document Type"; docNo: Code[50]; var licensePlateNo: Code[50]; var itemNo: Code[50]; var scanValue: Text; var isHandled: Boolean)
    var
        SingleInstanceCU: Codeunit "ORB Orbus Single Instance";
    begin
        SingleInstanceCU.SetLastCommandRan(scanValue);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"DSHIP Event Publisher", OnAfterBuildPackageOptions, '', false, false)]
    local procedure "DSHIP Event Publisher_OnAfterBuildPackageOptions"(docType: Enum "DSHIP Document Type"; docNo: Code[50]; licensePlate: Code[20]; var packOptions: Record "DSHIP Package Options")
    var
        SalesHeaderAdditionalFields: Record "ORB Sales Header Add. Fields";
    begin
        if docType <> docType::"Sales Order" then
            exit;
        SalesHeaderAdditionalFields.SetRange("Document Type", SalesHeaderAdditionalFields."Document Type"::Order);
        SalesHeaderAdditionalFields.SetRange("No.", docNo);
        if SalesHeaderAdditionalFields.FindFirst() then begin
            if SalesHeaderAdditionalFields."Payment Type" <> SalesHeaderAdditionalFields."Payment Type"::" " then
                packOptions.Validate("Payment Type", SalesHeaderAdditionalFields."Payment Type");
            if SalesHeaderAdditionalFields."Payment Account No." <> '' then
                packOptions.Validate("Payment Account No.", SalesHeaderAdditionalFields."Payment Account No.");
            if SalesHeaderAdditionalFields."Payment Country Code" <> '' then
                packOptions.Validate("Payment Country Code", SalesHeaderAdditionalFields."Payment Country Code");
            if SalesHeaderAdditionalFields."Payment Postal Code" <> '' then
                packOptions.Validate("Payment Postal Code", SalesHeaderAdditionalFields."Payment Postal Code");
            if SalesHeaderAdditionalFields."Payment Province" <> '' then
                packOptions.Validate("Payment Province", SalesHeaderAdditionalFields."Payment Province");
        end;
        packOptions.Modify();


    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Create Prod. Order Lines", OnAfterInitProdOrderLine, '', false, false)]
    local procedure "Create Prod. Order Lines_OnAfterInitProdOrderLine"(var ProdOrderLine: Record "Prod. Order Line"; ProdOrder: Record "Production Order"; SalesLine: Record "Sales Line")
    var
        SalesLineAddFieldsRecLcl: Record "ORB Sales Line Add. Fields";
        NewRecLink: Record "Record Link";
        CreateLink: Boolean;
        EntryNo: Integer;
    begin
        Clear(CreateLink);
        if ProdOrder."Source Type" = ProdOrder."Source Type"::Item then begin
            if ProdOrderLine."Item No." = ProdOrder."Source No." then
                CreateLink := true;
        end else
            if ProdOrder."Source Type" = ProdOrder."Source Type"::"Sales Header" then
                CreateLink := true;


        if CreateLink then begin
            ProdOrderLine."ORB Sales Order No." := SalesLine."Document No.";
            ProdOrderLine."ORB Sales Order Line No." := SalesLine."Line No.";

            if SalesLineAddFieldsRecLcl.get(SalesLine."Document Type", SalesLine."Document No.", SalesLine."Line No.") then begin
                NewRecLink.Reset();
                if NewRecLink.FindLast() then
                    EntryNo := NewRecLink."Link ID" + 1
                else
                    EntryNo := 1;

                NewRecLink.INIT;
                NewRecLink."Link ID" := EntryNo;
                NewRecLink."Record ID" := ProdOrder.RECORDID;
                NewRecLink.URL1 := SalesLineAddFieldsRecLcl."Job URL";
                NewRecLink.Description := SalesLine."No.";
                NewRecLink.Type := NewRecLink.Type::Link;
                NewRecLink."User ID" := UserId;
                NewRecLink.Created := CreateDateTime(Today, Time);
                NewRecLink.Company := CompanyName;
                NewRecLink.INSERT;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Create Prod. Order from Sale", OnAfterCreateProdOrderFromSalesLine, '', false, false)]
    local procedure "Create Prod. Order from Sale_OnAfterCreateProdOrderFromSalesLine"(var ProdOrder: Record "Production Order"; var SalesLine: Record "Sales Line")
    var
        SalesHdrAddFields: Record "ORB Sales Header Add. Fields";
        NewRecLink: Record "Record Link";
        EntryNo: Integer;
    begin
        if ProdOrder."Source Type" = ProdOrder."Source Type"::"Sales Header" then
            if SalesHdrAddFields.get(SalesLine."Document Type", SalesLine."Document No.") then begin
                NewRecLink.Reset();
                if NewRecLink.FindLast() then
                    EntryNo := NewRecLink."Link ID" + 1
                else
                    EntryNo := 1;

                NewRecLink.INIT;
                NewRecLink."Link ID" := EntryNo;
                NewRecLink."Record ID" := ProdOrder.RECORDID;
                NewRecLink.URL1 := SalesHdrAddFields."Job URL";
                NewRecLink.Description := '<' + SalesLine."Document No." + '>' + 'Merged URL';
                NewRecLink.Type := NewRecLink.Type::Link;
                NewRecLink."User ID" := UserId;
                NewRecLink.Created := CreateDateTime(Today, Time);
                NewRecLink.Company := CompanyName;
                NewRecLink.INSERT;
            end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Create Prod. Order from Sale", OnAfterCreateProdOrder, '', false, false)]
    local procedure "Create Prod. Order from Sale_OnAfterCreateProdOrder"(var ProdOrder: Record "Production Order"; var SalesLine: Record "Sales Line")
    var
        ProdOrderLine: Record "Prod. Order Line";
        SalesHdrAddFields: Record "ORB Sales Header Add. Fields";
        NewRecLink: Record "Record Link";
        EntryNo: Integer;
    begin
        if ProdOrder."Source Type" = ProdOrder."Source Type"::Item then begin
            ProdOrderLine.Reset();
            ProdOrderLine.SetRange("Prod. Order No.", ProdOrder."No.");
            if ProdOrder.FindFirst() then begin
                if SalesHdrAddFields.get(SalesLine."Document Type", SalesLine."Document No.") then begin
                    NewRecLink.Reset();
                    if NewRecLink.FindLast() then
                        EntryNo := NewRecLink."Link ID" + 1
                    else
                        EntryNo := 1;

                    NewRecLink.INIT;
                    NewRecLink."Link ID" := EntryNo;
                    NewRecLink."Record ID" := ProdOrder.RECORDID;
                    NewRecLink.URL1 := SalesHdrAddFields."Job URL";
                    NewRecLink.Description := '<' + SalesLine."Document No." + '>' + 'Merged URL';
                    NewRecLink.Type := NewRecLink.Type::Link;
                    NewRecLink."User ID" := UserId;
                    NewRecLink.Created := CreateDateTime(Today, Time);
                    NewRecLink.Company := CompanyName;
                    NewRecLink.INSERT;
                end;
            end;
        end;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnAfterReleaseSalesDoc', '', false, false)]
    local procedure Cod414_OnAfterReleaseSalesDoc(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean; var LinesWereModified: Boolean; SkipWhseRequestOperations: Boolean)
    var
    begin
        IF (SalesHeader."Document Type" = SalesHeader."Document Type"::Order) and (SalesHeader.Status = SalesHeader.Status::Released) and (SalesHeader."ORB Original Promised Ship Dt." = 0D) then begin
            //SalesHeader.Validate("ORB Original Promised Ship Dt.", today);
            SalesHeader.Validate("ORB Original Promised Ship Dt.", SalesHeader."Shipment Date");
            SalesHeader.Modify;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", OnBeforeReleaseSalesDoc, '', false, false)]
    local procedure "Release Sales Document_OnBeforeReleaseSalesDoc"(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean; var IsHandled: Boolean; var SkipCheckReleaseRestrictions: Boolean; SkipWhseRequestOperations: Boolean)
    begin
        IF SalesHeader."Document Type" = SalesHeader."Document Type"::Order then
            OrbusFunctionsCUGbl.ValidateOnSalesRelease(SalesHeader);
    end;

    [EventSubscriber(ObjectType::Report, Report::"Batch Post Sales Orders", OnBeforeSalesBatchPostMgt, '', false, false)]
    local procedure "Batch Post Sales Orders_OnBeforeSalesBatchPostMgt"(var SalesHeader: Record "Sales Header"; var ShipReq: Boolean; var InvReq: Boolean; var SalesBatchPostMgt: Codeunit "Sales Batch Post Mgt."; var IsHandled: Boolean)
    begin
        if OrbusSingleInstanceCUGbl.GetShippedNotInvoiced() then begin
            SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
            SalesHeader.SetRange("Shipped Not Invoiced", true);
            SalesHeader.SetFilter("Package Tracking No.", '<>%1', '');
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, codeunit::"DSHIP Event Publisher", OnAfterGetShippingRate, '', false, false)]
    internal procedure OnAfterGetShippingRate(orderBuffer: Record "DSHIP Package Order Buffer" temporary; var rateBuffer: Record "DSHIP Carrier Rate Buffer" temporary; var messageBuffer: Record "DSHIP Shipment Message Buffer" temporary; var objectId: Text[100])
    var
        DSHIPPackageRateManagement: Codeunit "DSHIP Package Rate Management";
        DShipFreightPrice: Record "DSHIP Freight Price";
        salesType: Option " ",Customer,"Customer Price Group","All Customers",Campaign;
    begin
        //if rateBuffer."Carrier Name" <> 'TRUCKING' then
        //    exit;
        if rateBuffer.IsEmpty then
            exit;
        DSHIPPackageRateManagement.getSpecificSalesTypeRate(
                            DShipFreightPrice,
                            orderBuffer."Shipping Agent Code",
                            rateBuffer,
                            salesType::"All Customers",
                            '',
                            0);
        rateBuffer."ORB Handling" := DShipFreightPrice."Markup Amount";
        rateBuffer."ORB Freight Quote" := DShipFreightPrice."Maximum Rate";
        rateBuffer.Modify(false);
    end;

    [EventSubscriber(ObjectType::Codeunit, codeunit::"DSHIP Event Publisher", OnBeforeSelectRate, '', false, false)]
    internal procedure OnBeforeSelectRate(docType: Enum "DSHIP Document Type"; docNo: Code[50]; var rateBuffer: Record "DSHIP Carrier Rate Buffer" temporary; rateRequestSource: Enum "DSHIP Rate Request Source"; var isHandled: Boolean)
    var
        DSHIPPackageRateManagement: Codeunit "DSHIP Package Rate Management";
        DShipFreightPrice: Record "DSHIP Freight Price";
        salesType: Option " ",Customer,"Customer Price Group","All Customers",Campaign;
    begin
        //if rateBuffer."Carrier Name" <> 'TRUCKING' then
        //    exit;
        if rateBuffer.IsEmpty then
            exit;
        DSHIPPackageRateManagement.getSpecificSalesTypeRate(
                    DShipFreightPrice,
                    rateBuffer."Shipping Agent Code",
                    rateBuffer,
                    salesType::"All Customers",
                    '',
                    0);
        rateBuffer."ORB Handling" := DShipFreightPrice."Markup Amount";
        rateBuffer."ORB Freight Quote" := DShipFreightPrice."Maximum Rate";
        rateBuffer.Modify(false);
        OrbusSingleInstanceCUGbl.SetMarkupAmountPrice(rateBuffer."ORB Handling");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", OnBeforeInsertItemLedgEntry, '', false, false)]
    local procedure "Item Jnl.-Post Line_OnBeforeInsertItemLedgEntry"(var ItemLedgerEntry: Record "Item Ledger Entry"; ItemJournalLine: Record "Item Journal Line"; TransferItem: Boolean; OldItemLedgEntry: Record "Item Ledger Entry"; ItemJournalLineOrigin: Record "Item Journal Line")
    begin
        ItemLedgerEntry."ORB LIFT Inv. Transaction ID" := ItemJournalLine."ORB LIFT Inv. Transaction ID";
        ItemLedgerEntry."ORB LIFT Order Line ID" := ItemJournalLine."ORB LIFT Order Line ID";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse. Jnl.-Register Line", OnInitWhseEntryCopyFromWhseJnlLine, '', false, false)]
    local procedure "Whse. Jnl.-Register Line_OnInitWhseEntryCopyFromWhseJnlLine"(var WarehouseEntry: Record "Warehouse Entry"; var WarehouseJournalLine: Record "Warehouse Journal Line"; OnMovement: Boolean; Sign: Integer; Location: Record Location; BinCode: Code[20]; var IsHandled: Boolean)
    begin
        WarehouseEntry."ORB LIFT Inv. Transaction ID" := WarehouseJournalLine."ORB LIFT Inv. Transaction ID";
        WarehouseEntry."ORB LIFT Order Line ID" := WarehouseJournalLine."ORB LIFT Order Line ID";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse. Jnl.-Register Batch", OnCreateItemJnlLineOnBeforeExit, '', false, false)]
    local procedure "Whse. Jnl.-Register Batch_OnCreateItemJnlLineOnBeforeExit"(WhseJnlLine2: Record "Warehouse Journal Line"; var ItemJnlLine: Record "Item Journal Line"; var QtytoHandleBase: Decimal)
    begin
        WhseJnlLine2."ORB LIFT Inv. Transaction ID" := ItemJnlLine."ORB LIFT Inv. Transaction ID";
        WhseJnlLine2."ORB LIFT Order Line ID" := ItemJnlLine."ORB LIFT Order Line ID";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"WMS Management", OnInitWhseJnlLineCopyFromItemJnlLine, '', false, false)]
    local procedure "WMS Management_OnInitWhseJnlLineCopyFromItemJnlLine"(var WarehouseJournalLine: Record "Warehouse Journal Line"; ItemJournalLine: Record "Item Journal Line")
    begin
        WarehouseJournalLine."ORB LIFT Inv. Transaction ID" := ItemJournalLine."ORB LIFT Inv. Transaction ID";
        WarehouseJournalLine."ORB LIFT Order Line ID" := ItemJournalLine."ORB LIFT Order Line ID";
    end;

    [EventSubscriber(ObjectType::Report, report::"Whse.-Shipment - Create Pick", OnBeforeSortWhseActivHeaders, '', false, false)]

    local procedure OnBeforeSortWhseActivHeaders(var WhseActivHeader: Record "Warehouse Activity Header"; FirstActivityNo: Code[20]; LastActivityNo: Code[20]; var HideNothingToHandleError: Boolean)
    begin
        OrbusSingleInstanceCUGbl.SetWarehouseActivity(FirstActivityNo, LastActivityNo);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Create Inventory Pick/Movement", OnBeforeFindFromBinContent, '', false, false)]
    local procedure "Create Inventory Pick/Movement_OnBeforeFindFromBinContent"(var FromBinContent: Record "Bin Content"; var WarehouseActivityLine: Record "Warehouse Activity Line"; FromBinCode: Code[20]; BinCode: Code[20]; IsInvtMovement: Boolean; IsBlankInvtMovement: Boolean; DefaultBin: Boolean; WhseItemTrackingSetup: Record "Item Tracking Setup" temporary; var WarehouseActivityHeader: Record "Warehouse Activity Header"; var WarehouseRequest: Record "Warehouse Request")
    var
        BinContentRecLcl: Record "Bin Content";
        UserPickZone: Record "ORB User Pick Zone";
        Zone: Record Zone;
        ExistAfterFilter: Boolean;
    begin
        if not OrbusSetup.Get() or not OrbusSetup."Enable User Pick Zone" then
            exit;

        BinContentRecLcl.Reset();
        BinContentRecLcl.CopyFilters(FromBinContent);
        if not BinContentRecLcl.IsEmpty() then
            OrbusSingleInstanceCUGbl.SetBinContentExistBefore(true);

        if WarehouseActivityLine."Source Type" = DATABASE::"Production Order" then
            exit;

        case WarehouseActivityLine."Activity Type" of
            WarehouseActivityLine."Activity Type"::"Invt. Pick":
                ;
            WarehouseActivityLine."Activity Type"::Pick:
                if WarehouseActivityLine."Action Type" <> WarehouseActivityLine."Action Type"::Take then
                    exit;
            else
                exit;
        end;

        UserPickZone.SetRange("User ID", UserId);
        UserPickZone.SetRange("Location Code", WarehouseActivityLine."Location Code");
        if not UserPickZone.FindLast() then begin
            OrbusSingleInstanceCUGbl.SetBinContentExistAfter(true);
            exit;
        end;

        Zone.SetRange(Code, UserPickZone."Zone Code");
        Zone.SetRange("Location Code", FromBinContent."Location Code");
        if not Zone.FindFirst() then
            Error('Zone "%1" assigned to user "%2" does not exist in the Warehouse Zone table.', UserPickZone."Zone Code", UserId);

        Clear(ExistAfterFilter);
        BinContentRecLcl.Reset();
        BinContentRecLcl.CopyFilters(FromBinContent);
        if FromBinContent.GetFilter("Bin Code") <> '' then
            BinContentRecLcl.SetRange("Bin Code");

        BinContentRecLcl.SetRange("Zone Code", UserPickZone."Zone Code");
        if not BinContentRecLcl.IsEmpty() then begin
            ExistAfterFilter := true;
            OrbusSingleInstanceCUGbl.SetBinContentExistAfter(true);
        end;

        if ExistAfterFilter then begin
            if FromBinContent.GetFilter("Bin Code") <> '' then
                FromBinContent.SetRange("Bin Code");

            FromBinContent.SetRange("Zone Code", UserPickZone."Zone Code");
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Create Inventory Pick/Movement", OnBeforeNewWhseActivLineInsert, '', false, false)]
    local procedure "Create Inventory Pick/Movement_OnBeforeNewWhseActivLineInsert"(var WarehouseActivityLine: Record "Warehouse Activity Line"; WarehouseActivityHeader: Record "Warehouse Activity Header")
    begin
        if not OrbusSetup.Get() or not OrbusSetup."Enable User Pick Zone" then
            exit;

        if OrbusSingleInstanceCUGbl.GetBinContentExistBefore() and not OrbusSingleInstanceCUGbl.GetBinContentExistAfter() then begin
            WarehouseActivityLine."Bin Code" := '';
            WarehouseActivityLine."Zone Code" := '';
        end;

        OrbusSingleInstanceCUGbl.SetBinContentExistBefore(false);
        OrbusSingleInstanceCUGbl.SetBinContentExistAfter(false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Create Pick", OnBeforeGetBinContent, '', false, false)]
    local procedure "Create Pick_OnBeforeGetBinContent"(var TempBinContent: Record "Bin Content" temporary; ItemNo: Code[20]; VariantCode: Code[10]; UnitofMeasureCode: Code[10]; LocationCode: Code[10]; ToBinCode: Code[20]; CrossDock: Boolean; IsMovementWorksheet: Boolean; WhseItemTrkgExists: Boolean; BreakbulkBins: Boolean; SmallerUOMBins: Boolean; WhseItemTrackingSetup: Record "Item Tracking Setup" temporary; TotalQtytoPick: Decimal; TotalQtytoPickBase: Decimal; var Result: Boolean; var IsHandled: Boolean)
    begin
        OrbusSingleInstanceCUGbl.SetWarehousePickLocationCode(LocationCode);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Bin Content", OnAfterBinContentExists, '', false, false)]
    local procedure "Bin Content_OnAfterBinContentExists"(var BinContent: Record "Bin Content")
    var
        UserPickZone: Record "ORB User Pick Zone";
        Zone: Record Zone;
    begin
        if not OrbusSetup.Get() or not OrbusSetup."Enable User Pick Zone" then
            exit;

        UserPickZone.SetRange("User ID", UserId);
        UserPickZone.SetRange("Location Code", OrbusSingleInstanceCUGbl.GetWarehousePickLocationCode);
        if not UserPickZone.FindLast() then
            exit;

        Zone.SetRange(Code, UserPickZone."Zone Code");
        Zone.SetRange("Location Code", OrbusSingleInstanceCUGbl.GetWarehousePickLocationCode);
        if not Zone.FindFirst() then
            Error('Zone "%1" assigned to user "%2" does not exist in the Warehouse Zone table.', UserPickZone."Zone Code", UserId);

        BinContent.SetRange("Zone Code", UserPickZone."Zone Code");

        OrbusSingleInstanceCUGbl.SetWarehousePickLocationCode('');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterCopyToTempLines, '', false, false)]
    local procedure "Sales-Post_OnAfterCopyToTempLines"(var TempSalesLine: Record "Sales Line" temporary; SalesHeader: Record "Sales Header")
    var
        SalesCommentLine: Record "Sales Comment Line";
        HighestLineNo: Integer;
        SingleInstanceCU: Codeunit "ORB Orbus Single Instance";
    begin
        if SingleInstanceCU.GetRunFromOrderConfirmation then begin
            if TempSalesLine.FindSet() then
                repeat
                    HighestLineNo := TempSalesLine."Line No.";

                    SalesCommentLine.Reset();
                    SalesCommentLine.SetRange("Document Type", TempSalesLine."Document Type");
                    SalesCommentLine.SetRange("No.", TempSalesLine."Document No.");
                    SalesCommentLine.SetRange("Document Line No.", TempSalesLine."Line No.");
                    if SalesCommentLine.FindSet() then
                        repeat
                            TempSalesLine.Init();
                            TempSalesLine."Document No." := SalesCommentLine."No.";
                            TempSalesLine."Line No." := HighestLineNo + 1;
                            HighestLineNo := TempSalesLine."Line No.";
                            TempSalesLine.Description := SalesCommentLine.Comment;
                            TempSalesLine.Insert();
                        until SalesCommentLine.Next() = 0;
                until TempSalesLine.Next() = 0;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse. Jnl.-Register", 'OnBeforeConfirmRegisterLines', '', false, false)]
    local procedure "Whse. Jnl.-Register_OnBeforeConfirmRegisterLines"(WhseJnlLine: Record "Warehouse Journal Line"; var Result: Boolean; var IsHandled: Boolean)
    begin
        if OrbusSingleInstanceCUGbl.GetSuppressWhseConfirm() then begin
            Result := true;
            IsHandled := true;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post", OnBeforeCode, '', false, false)]
    local procedure "Item Jnl.-Post_OnBeforeCode"(var ItemJournalLine: Record "Item Journal Line"; var HideDialog: Boolean; var SuppressCommit: Boolean; var IsHandled: Boolean)
    begin
        if OrbusSingleInstanceCUGbl.GetSuppressItemJnlConfirm() then
            HideDialog := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Price Calc. Mgt.", OnBeforeSalesLineLineDiscExists, '', false, false)]
    local procedure "Sales Price Calc. Mgt._OnBeforeSalesLineLineDiscExists"(var SalesLine: Record "Sales Line"; var SalesHeader: Record "Sales Header"; var TempSalesLineDisc: Record "Sales Line Discount" temporary; StartingDate: Date; Qty: Decimal; QtyPerUOM: Decimal; ShowAll: Boolean; var IsHandled: Boolean)
    begin
        OrbusSingleInstanceCUGbl.SetCampaignNo(SalesHeader."Campaign No.");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Price Calc. Mgt.", OnAfterSalesLineLineDiscExists, '', false, false)]
    local procedure "Sales Price Calc. Mgt._OnAfterSalesLineLineDiscExists"(var SalesLine: Record "Sales Line"; var SalesHeader: Record "Sales Header"; var TempSalesLineDisc: Record "Sales Line Discount" temporary; ShowAll: Boolean)
    begin
        OrbusSingleInstanceCUGbl.SetCampaignNo('');
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Price Calc. Mgt.", OnBeforeActivatedCampaignExists, '', false, false)]
    local procedure "Sales Price Calc. Mgt._OnBeforeActivatedCampaignExists"(var ToCampaignTargetGr: Record "Campaign Target Group"; CustNo: Code[20]; ContNo: Code[20]; CampaignNo: Code[20]; var IsHandled: Boolean)
    begin
        if CampaignNo = '' then
            CampaignNo := OrbusSingleInstanceCUGbl.GetCampaignNo();

        if CampaignNo = '' then
            IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", OnCodeOnBeforeSetStatusReleased, '', false, false)]
    local procedure "Release Sales Document_OnCodeOnBeforeSetStatusReleased"(var SalesHeader: Record "Sales Header")
    begin
        //if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then
        //OrbusFunctionsCUGbl.AutomaticShipToAddressValidation(SalesHeader);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Act.-Post (Yes/No)", OnBeforeConfirmPost, '', false, false)]
    local procedure "Whse.-Act.-Post (Yes/No)_OnBeforeConfirmPost"(var WhseActivLine: Record "Warehouse Activity Line"; var HideDialog: Boolean; var Selection: Integer; var DefaultOption: Integer; var IsHandled: Boolean; var PrintDoc: Boolean)
    begin
        if WhseActivLine."Activity Type" = WhseActivLine."Activity Type"::"Invt. Pick" then
            DefaultOption := 1;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Activity-Post", OnBeforeCheckLines, '', false, false)]
    local procedure "Whse.-Activity-Post_OnBeforeCheckLines"(var WhseActivityHeader: Record "Warehouse Activity Header")
    begin
        if WhseActivityHeader.Type = WhseActivityHeader.Type::"Invt. Pick" then
            WhseActivityHeader."Posting Date" := WorkDate();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Activity-Post", OnAfterPostedInvtPickHeaderInsert, '', false, false)]
    local procedure "Whse.-Activity-Post_OnAfterPostedInvtPickHeaderInsert"(var PostedInvtPickHeader: Record "Posted Invt. Pick Header"; WarehouseActivityHeader: Record "Warehouse Activity Header")
    begin
        if WarehouseActivityHeader.Get(WarehouseActivityHeader.Type::"Invt. Pick", PostedInvtPickHeader."Invt Pick No.") then
            if WarehouseActivityHeader."Source Document" = WarehouseActivityHeader."Source Document"::"Sales Order" then begin
                PostedInvtPickHeader."ORB Order No." := WarehouseActivityHeader."Source No.";
                PostedInvtPickHeader.Modify();
            end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Item Ledger Entry", 'OnBeforeInsertEvent', '', false, false)]
    local procedure ILE_OnBeforeInsert(var Rec: Record "Item Ledger Entry"; RunTrigger: Boolean)
    begin
        if (rec."Document No." = '') and (rec."Location Code" = '') and (Rec.Quantity > 0) then
            Error('Invalid Transaction, Please contact your admin. (kanch.kumar@orbus.com;uma.rao@orbus.com;samn@orbus.com;shivateja@panaceasofttech.com)');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Global Triggers", 'GetDatabaseTableTriggerSetup', '', false, false)]
    local procedure GetDatabaseTableTriggerSetup(TableId: Integer; var OnDatabaseInsert: Boolean; var OnDatabaseModify: Boolean; var OnDatabaseDelete: Boolean)
    begin
        if TableId = Database::"item ledger entry" then begin
            OnDatabaseInsert := true;
            OnDatabaseModify := true;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::GlobalTriggerManagement, OnAfterOnDatabaseInsert, '', false, false)]
    local procedure GlobalTriggerManagement_OnAfterOnDatabaseInsert(RecRef: RecordRef)
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"GlobalTriggerManagement", 'OnBeforeOnDatabaseInsert', '', false, false)]
    local procedure GlobalTriggerManagement_OnBeforeOnDatabaseInsert(RecRef: RecordRef; var IsHandled: Boolean)
    var
        TableID: Integer;
    begin
        TableID := RecRef.Number;
        if TableID = Database::"item Ledger Entry" then begin
            if (Format(RecRef.Field(6).Value) = '') and (Format(RecRef.Field(8).Value) = '') then begin
                Error('Invalid Transaction, Please contact your admin. (kanch.kumar@orbus.com;uma.rao@orbus.com;samn@orbus.com;shivateja@panaceasofttech.com)');
                IsHandled := true;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::GlobalTriggerManagement, OnBeforeOnDatabaseModify, '', false, false)]
    local procedure GlobalTriggerManagement_OnBeforeOnDatabaseModify(RecRef: RecordRef; var IsHandled: Boolean)
    var
        TableID: Integer;
    begin
        TableID := RecRef.Number;
        if TableID = Database::"item Ledger Entry" then begin
            if (Format(RecRef.Field(6).Value) = '') and (Format(RecRef.Field(8).Value) = '') then begin
                Error('Invalid Transaction, Please contact your admin. (kanch.kumar@orbus.com;uma.rao@orbus.com;samn@orbus.com;shivateja@panaceasofttech.com)');
                IsHandled := true;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse. Jnl.-Register Line", OnUpdateDefaultBinContentOnBeforeBinContent2Modify, '', false, false)]
    local procedure "Whse. Jnl.-Register Line_OnUpdateDefaultBinContentOnBeforeBinContent2Modify"(var BinContent: Record "Bin Content")
    begin
        BinContent.Default := false;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse. Jnl.-Register Line", OnBeforeBinContentInsert, '', false, false)]
    local procedure "Whse. Jnl.-Register Line_OnBeforeBinContentInsert"(var BinContent: Record "Bin Content"; WarehouseEntry: Record "Warehouse Entry"; Bin: Record Bin)
    begin
        BinContent.Default := false;
        BinContent.Fixed := false;
    end;

    var
        OrbusSingleInstanceCUGbl: Codeunit "ORB Orbus Single Instance";
        SOPla: page "Sales Order Planning";

        OrbusFunctionsCUGbl: Codeunit "ORB Functions";
        OrbusSetup: Record "ORB Orbus Setup";

}
