pageextension 52620 "ORB Sales Order Subform" extends "Sales Order Subform"
{
    layout
    {
        addlast(Control1)
        {
            field("ORB Magento Artwork Job ID"; Rec."ORB Magento Artwork Job ID")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Magento Artwork Job ID of Sales';
            }
        }

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
