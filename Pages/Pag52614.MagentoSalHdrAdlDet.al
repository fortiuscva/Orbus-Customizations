page 52614 "ORB Magento Sal. Hdr. Adl. Det"
{
    UsageCategory = Lists;
    APIGroup = 'orbus';
    APIPublisher = 'orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'MagentoSalesHeaderAddlDetails';
    DelayedInsert = true;
    EntityName = 'MagentosalesHeaderAddlDetailsAPI';
    EntitySetName = 'MagentosalesHeaderAddlDetailsAPI';
    PageType = API;
    ModifyAllowed = true;
    DeleteAllowed = true;
    InsertAllowed = true;
    SourceTable = "ORB Sales Header Add. Fields";
    Permissions = tabledata "ORB Sales Header Add. Fields" = rmid;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(DocumentType; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field(No; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(DirecttoshowLabel; Rec."Direct to show Label")
                {
                    ToolTip = 'Specifies the value of the Direct to show Label field.';
                }
                field(Productiontimeline; Rec."Production timeline")
                {
                    ToolTip = 'Specifies the value of the Production timeline field.';
                }
                field(PaymentType; Rec."Payment Type")
                {
                    ToolTip = 'Specifies the value of the Payment Type field.';
                }
                field(PaymentAccountNo; Rec."Payment Account No.")
                {
                    ToolTip = 'Specifies the value of the Payment Account No. field.';
                }
                field(PaymentProvince; Rec."Payment Province")
                {
                    ToolTip = 'Specifies the value of the Payment Province field.';
                }

                field(PaymentPostalCode; Rec."Payment Postal Code")
                {
                    ToolTip = 'Specifies the value of the Payment Postal Code field.';
                }
                field(PaymentCountryCode; Rec."Payment Country Code")
                {
                    ToolTip = 'Specifies the value of the Payment Country Code field.';
                }
                field(JobURL; Rec."Job URL")
                {
                    ToolTip = 'Specifies the value of the Job URL field.';
                }
                field(PolaraidURL; Rec."Polaraid URL")
                {
                    ToolTip = 'Specifies the value of the Polaraid URL field.';
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        NewRecLink: Record "Record Link";
        EntryNo: Integer;
        SalesHeader: Record "Sales Header";
    begin
        if SalesHeader.get(Rec."Document Type", Rec."No.") then begin
            if Rec."Polaraid URL" <> '' then begin
                NewRecLink.Reset();
                if NewRecLink.FindLast() then
                    EntryNo := NewRecLink."Link ID" + 1
                else
                    EntryNo := 1;
                NewRecLink.INIT;
                NewRecLink."Link ID" := EntryNo;
                NewRecLink."Record ID" := SalesHeader.RECORDID;
                NewRecLink.URL1 := Rec."Polaraid URL";
                NewRecLink.Description := 'Polarid URL';
                NewRecLink.Type := NewRecLink.Type::Link;
                NewRecLink."User ID" := UserId;
                NewRecLink.Created := CreateDateTime(Today, Time);
                NewRecLink.Company := CompanyName;
                NewRecLink.INSERT;
            end;
        end;
    end;

    trigger OnModifyRecord(): Boolean
    Var
        NewRecLink: Record "Record Link";
        SalesHeader: Record "Sales Header";
        EntryNo: Integer;
    begin
        if SalesHeader.get(Rec."Document Type", Rec."No.") then begin
            if (rec."Polaraid URL" <> xRec."Polaraid URL") and (rec."Polaraid URL" <> '') then begin
                NewRecLink.Reset();
                if NewRecLink.FindLast() then
                    EntryNo := NewRecLink."Link ID" + 1
                else
                    EntryNo := 1;

                NewRecLink.reset;
                NewRecLink.SetFilter("Record ID", format(SalesHeader.RecordId));
                NewRecLink.SetRange(Description, 'Polarid URL');
                if NewRecLink.FindFirst() then begin
                    NewRecLink.URL1 := Rec."Polaraid URL";
                    NewRecLink.Modify();
                end else begin
                    NewRecLink.INIT;
                    NewRecLink."Link ID" := EntryNo;
                    NewRecLink."Record ID" := SalesHeader.RECORDID;
                    NewRecLink.URL1 := Rec."Polaraid URL";
                    NewRecLink.Description := 'Polarid URL';
                    NewRecLink.Type := NewRecLink.Type::Link;
                    NewRecLink."User ID" := UserId;
                    NewRecLink.Created := CreateDateTime(Today, Time);
                    NewRecLink.Company := CompanyName;
                    NewRecLink.INSERT;
                end;
            end;
        end;
    end;
}
