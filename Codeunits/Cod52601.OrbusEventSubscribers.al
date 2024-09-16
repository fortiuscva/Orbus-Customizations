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
                     (SalesCrMemoHeader."Your Reference" <> xSalesCrMemoHeader."Your Reference");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Credit Memo Hdr. - Edit", OnBeforeSalesCrMemoHeaderModify, '', false, false)]
    local procedure Cod1408_OnBeforeSalesCrMemoHeaderModify(var SalesCrMemoHeader: Record "Sales Cr.Memo Header"; FromSalesCrMemoHeader: Record "Sales Cr.Memo Header");
    begin
        SalesCrMemoHeader."Sell-to Customer Name" := FromSalesCrMemoHeader."Sell-to Customer Name";
        SalesCrMemoHeader."Bill-to Name" := FromSalesCrMemoHeader."Bill-to Name";
        SalesCrMemoHeader."Ship-to Name" := FromSalesCrMemoHeader."Ship-to Name";
        SalesCrMemoHeader."External Document No." := FromSalesCrMemoHeader."External Document No.";
        SalesCrMemoHeader."Your Reference" := FromSalesCrMemoHeader."Your Reference";
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
            if addressBuffer."Address Type" = addressBuffer."Address Type"::Destination then begin
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
                        if addressBuffer."Address Type" = addressBuffer."Address Type"::Destination then begin
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

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"PostSales-Delete", OnAfterInitDeleteHeader, '', false, false)]
    local procedure "PostSales-Delete_OnAfterInitDeleteHeader"(SalesHeader: Record "Sales Header"; var SalesShipmentHeader: Record "Sales Shipment Header"; var SalesInvoiceHeader: Record "Sales Invoice Header"; var SalesCrMemoHeader: Record "Sales Cr.Memo Header"; var ReturnReceiptHeader: Record "Return Receipt Header"; var SalesInvoiceHeaderPrepmt: Record "Sales Invoice Header"; var SalesCrMemoHeaderPrepmt: Record "Sales Cr.Memo Header")
    var
        SalesHeaderAdditionalFields: Record "ORB Sales Header Add. Fields";
    begin
        if SalesHeaderAdditionalFields.Get(SalesHeader."Document Type", SalesHeader."No.") then
            SalesHeaderAdditionalFields.Delete();
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

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnAfterReleaseSalesDoc', '', false, false)]
    local procedure Cod414_OnAfterReleaseSalesDoc(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean; var LinesWereModified: Boolean; SkipWhseRequestOperations: Boolean)
    var
    begin
        IF (SalesHeader."Document Type" = SalesHeader."Document Type"::Order) and (SalesHeader.Status = SalesHeader.Status::Released) and (SalesHeader."ORB Original Promised Ship Dt." = 0D) then begin
            SalesHeader.Validate("ORB Original Promised Ship Dt.", today);
            SalesHeader.Modify;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", OnBeforeReleaseSalesDoc, '', false, false)]
    local procedure "Release Sales Document_OnBeforeReleaseSalesDoc"(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean; var IsHandled: Boolean; var SkipCheckReleaseRestrictions: Boolean; SkipWhseRequestOperations: Boolean)
    begin
        OrbusFunctionsCUGbl.ValidateOnSalesRelease(SalesHeader);
    end;

    [EventSubscriber(ObjectType::Report, Report::"Batch Post Sales Orders", OnBeforeSalesBatchPostMgt, '', false, false)]
    local procedure "Batch Post Sales Orders_OnBeforeSalesBatchPostMgt"(var SalesHeader: Record "Sales Header"; var ShipReq: Boolean; var InvReq: Boolean; var SalesBatchPostMgt: Codeunit "Sales Batch Post Mgt."; var IsHandled: Boolean)
    begin
        if OrbusSingleInstanceCUGbl.GetShippedNotInvoiced() then
            SalesHeader.SetRange("Shipped Not Invoiced", true);
    end;


    var
        OrbusSingleInstanceCUGbl: Codeunit "ORB Orbus Single Instance";
        OrbusFunctionsCUGbl: Codeunit "ORB Functions";

}
