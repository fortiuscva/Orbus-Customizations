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
                     (SalesInvoiceHeader."External Document No." <> xSalesInvoiceHeader."External Document No.");
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

    var
        OrbusSingleInstanceCUGbl: Codeunit "ORB Orbus Single Instance";
}
