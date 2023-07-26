codeunit 52601 "ORB Orbus Event & Subscribers"
{

    [EventSubscriber(ObjectType::Page, Page::"Posted Sales Inv. - Update", OnAfterRecordChanged, '', false, false)]
    local procedure Pag1355_OnAfterRecordChanged(var SalesInvoiceHeader: Record "Sales Invoice Header"; xSalesInvoiceHeader: Record "Sales Invoice Header"; var IsChanged: Boolean);
    begin
        IsChanged := (SalesInvoiceHeader."Sell-to Customer Name" <> xSalesInvoiceHeader."Sell-to Customer Name") or
                     (SalesInvoiceHeader."Bill-to Name" <> xSalesInvoiceHeader."Bill-to Name") or
                     (SalesInvoiceHeader."Ship-to Name" <> xSalesInvoiceHeader."Ship-to Name") or
                     (SalesInvoiceHeader."Sell-to E-Mail" <> xSalesInvoiceHeader."Sell-to E-Mail") or
                     (SalesInvoiceHeader."ORB Email Sent by JQ" <> xSalesInvoiceHeader."ORB Email Sent by JQ");
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Inv. Header - Edit", OnOnRunOnBeforeTestFieldNo, '', false, false)]
    local procedure Cod1409_OnOnRunOnBeforeTestFieldNo(var SalesInvoiceHeader: Record "Sales Invoice Header"; SalesInvoiceHeaderRec: Record "Sales Invoice Header");
    begin
        SalesInvoiceHeader."Sell-to Customer Name" := SalesInvoiceHeaderRec."Sell-to Customer Name";
        SalesInvoiceHeader."Bill-to Name" := SalesInvoiceHeaderRec."Bill-to Name";
        SalesInvoiceHeader."Ship-to Name" := SalesInvoiceHeaderRec."Ship-to Name";
        SalesInvoiceHeader."Sell-to E-Mail" := SalesInvoiceHeaderRec."Sell-to E-Mail";
        SalesInvoiceHeader."ORB Email Sent by JQ" := SalesInvoiceHeaderRec."ORB Email Sent by JQ";
    end;

    [EventSubscriber(ObjectType::Page, Page::"Pstd. Sales Cr. Memo - Update", OnAfterRecordChanged, '', false, false)]
    local procedure Pag1354_OnAfterRecordChanged(var SalesCrMemoHeader: Record "Sales Cr.Memo Header"; xSalesCrMemoHeader: Record "Sales Cr.Memo Header"; var IsChanged: Boolean);
    begin
        IsChanged := (SalesCrMemoHeader."Sell-to Customer Name" <> xSalesCrMemoHeader."Sell-to Customer Name") or
                     (SalesCrMemoHeader."Bill-to Name" <> xSalesCrMemoHeader."Bill-to Name") or
                     (SalesCrMemoHeader."Ship-to Name" <> xSalesCrMemoHeader."Ship-to Name");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Credit Memo Hdr. - Edit", OnBeforeSalesCrMemoHeaderModify, '', false, false)]
    local procedure Cod1408_OnBeforeSalesCrMemoHeaderModify(var SalesCrMemoHeader: Record "Sales Cr.Memo Header"; FromSalesCrMemoHeader: Record "Sales Cr.Memo Header");
    begin
        SalesCrMemoHeader."Sell-to Customer Name" := FromSalesCrMemoHeader."Sell-to Customer Name";
        SalesCrMemoHeader."Bill-to Name" := FromSalesCrMemoHeader."Bill-to Name";
        SalesCrMemoHeader."Ship-to Name" := FromSalesCrMemoHeader."Ship-to Name";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Document Sending Profile", OnSendCustomerRecordsOnBeforeLookupProfile, '', false, false)]
    local procedure Tab60_OnSendCustomerRecordsOnBeforeLookupProfile(ReportUsage: Integer; RecordVariant: Variant; CustomerNo: Code[20]; var RecRefToSend: RecordRef; SingleCustomerSelected: Boolean; var ShowDialog: Boolean);
    begin
        if not GuiAllowed then
            ShowDialog := OrbusSingleInstanceCUGbl.GetOnSendCustomerRecordsOnBeforeLookupProfile();
    end;

    [EventSubscriber(ObjectType::Table, Database::"Report Selections", OnBeforeSendEmailToCust, '', false, false)]
    local procedure Tab77_OnBeforeSendEmailToCust(ReportUsage: Integer; RecordVariant: Variant; DocNo: Code[20]; DocName: Text[150]; var ShowDialog: Boolean; CustNo: Code[20]; var Handled: Boolean)
    begin
        if not GuiAllowed then
            ShowDialog := OrbusSingleInstanceCUGbl.GetOnBeforeSendEmailToCust();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document-Mailing", OnBeforeSendEmail, '', false, false)]
    local procedure Cod260_OnBeforeSendEmail(var TempEmailItem: Record "Email Item" temporary; var IsFromPostedDoc: Boolean; var PostedDocNo: Code[20]; var HideDialog: Boolean; var ReportUsage: Integer; var EmailSentSuccesfully: Boolean; var IsHandled: Boolean; EmailDocName: Text[250]; SenderUserID: Code[50]; EmailScenario: Enum "Email Scenario");
    begin
        if not GuiAllowed then
            HideDialog := OrbusSingleInstanceCUGbl.GetOnBeforeSendEmail();
    end;

    [EventSubscriber(ObjectType::Table, Database::"Document Sending Profile", OnBeforeCheckShowProfileSelectionMethodDialog, '', false, false)]
    local procedure OnBeforeCheckShowProfileSelectionMethodDialog(var ProfileSelectionMethod: Option; AccountNo: Code[20]; IsCustomer: Boolean; var Result: Boolean; var IsHandled: Boolean);
    begin
        if not GuiAllowed then begin
            ProfileSelectionMethod := OrbusSingleInstanceCUGbl.GetOnBeforeCheckShowProfileSelectionMethod();
            IsHandled := OrbusSingleInstanceCUGbl.GetOnBeforeCheckShowProfileSelectionMethodIshandled();
            Result := OrbusSingleInstanceCUGbl.GetOnBeforeCheckShowProfileSelectionMethodResult();
        end;
    end;

    var
        OrbusSingleInstanceCUGbl: Codeunit "ORB Orbus Single Instance";

}
