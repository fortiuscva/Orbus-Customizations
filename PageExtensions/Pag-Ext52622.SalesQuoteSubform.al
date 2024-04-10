pageextension 52622 "ORB Sales Quote Subform" extends "Sales Quote Subform"
{
    layout
    {
        modify(Quantity)
        {
            trigger OnAfterValidate()
            var
                DocumentTotals: Codeunit "Document Totals";
                ItemRecLcl: Record Item;
            begin
                if (rec.Type = rec.Type::Item) and (rec.Quantity <> 0) then begin
                    OrbusSingleInstanceCUGbl.SetExplodeBOMConfirm(true);
                    if (ItemRecLcl.get(rec."No.")) and (rec."Prepmt. Amt. Inv." = 0) then begin
                        ItemRecLcl.CalcFields("Assembly BOM");
                        if ItemRecLcl."Assembly BOM" then
                            CODEUNIT.Run(CODEUNIT::"Sales-Explode BOM", Rec);
                    end;

                    DocumentTotals.SalesDocTotalsNotUpToDate();
                    OrbusSingleInstanceCUGbl.SetExplodeBOMConfirm(false);
                    CurrPage.Update(false);
                end;
            end;
        }
    }
    var
        OrbusSingleInstanceCUGbl: codeunit "ORB Orbus Single Instance";
}
