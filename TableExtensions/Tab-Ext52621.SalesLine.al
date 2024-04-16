tableextension 52621 "ORB Sales Line" extends "Sales Line"
{
    fields
    {
        field(52605; "ORB Magento Artwork Job ID"; Text[20])
        {
            Caption = 'Magento Artwork Job ID';
            DataClassification = ToBeClassified;
        }

        modify(Quantity)
        {
            trigger OnAfterValidate()
            var
                DocumentTotals: Codeunit "Document Totals";
                ItemRecLcl: Record Item;
            begin
                if CurrFieldNo = FieldNo(Quantity) then begin
                    if (rec."Document Type" = Rec."Document Type"::Order) or (rec."Document Type" = rec."Document Type"::Quote) then begin
                        if (rec.Type = rec.Type::Item) and (rec.Quantity <> 0) then begin
                            OrbusSingleInstanceCUGbl.SetExplodeBOMConfirm(true);
                            if (ItemRecLcl.get(rec."No.")) and (rec."Prepmt. Amt. Inv." = 0) then begin
                                ItemRecLcl.CalcFields("Assembly BOM");
                                if ItemRecLcl."Assembly BOM" then
                                    CODEUNIT.Run(CODEUNIT::"Sales-Explode BOM", Rec);
                            end;
                            DocumentTotals.SalesDocTotalsNotUpToDate();
                            OrbusSingleInstanceCUGbl.SetExplodeBOMConfirm(false);
                        end;
                    end;
                end;
            end;
        }
    }

    var
        OrbusSingleInstanceCUGbl: codeunit "ORB Orbus Single Instance";
}
