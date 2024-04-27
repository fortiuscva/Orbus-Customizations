tableextension 52621 "ORB Sales Line" extends "Sales Line"
{
    fields
    {
        field(52605; "ORB Magento Artwork Job ID"; Text[20])
        {
            Caption = 'Magento Artwork Job ID';
            DataClassification = ToBeClassified;
        }

        field(50119; "ORB Explode"; Boolean)
        {
            trigger OnValidate()
            var
                ItemRecLcl: Record Item;
                SalesLineLoc: Record "Sales Line";
                DocumentTotals: Codeunit "Document Totals";
            begin
                if not "ORB Explode" then
                    exit;
                if (rec."Document Type" = Rec."Document Type"::Order) or (rec."Document Type" = rec."Document Type"::Quote) then begin
                    if (rec.Type = rec.Type::Item) and (rec.Quantity <> 0) then begin
                        OrbusSingleInstanceCUGbl.SetExplodeBOMConfirm(true);
                        if (ItemRecLcl.get(rec."No.")) and (rec."Prepmt. Amt. Inv." = 0) then begin
                            SalesLineLoc := Rec;
                            ItemRecLcl.CalcFields("Assembly BOM");
                            if ItemRecLcl."Assembly BOM" then begin
                                CODEUNIT.Run(CODEUNIT::"Sales-Explode BOM", Rec);
                                Rec.INIT;
                                Rec.Description := SalesLineLoc.Description;
                                Rec."Description 2" := SalesLineLoc."Description 2";
                                Rec."BOM Item No." := SalesLineLoc."BOM Item No.";
                                Rec.MODIFY;
                            end;
                        end;
                        DocumentTotals.SalesDocTotalsNotUpToDate();
                        OrbusSingleInstanceCUGbl.SetExplodeBOMConfirm(false);
                    end;
                end;
            end;
        }

        modify(Quantity)
        {
            trigger OnAfterValidate()
            var
                ItemRecLcl: Record Item;
                SalesLineLoc: Record "Sales Line";
                DocumentTotals: Codeunit "Document Totals";
            begin
                //if CurrFieldNo = FieldNo(Quantity) then begin
                /*
                                if GuiAllowed then
                                    exit;
                                if Rec.Quantity = 0 then
                                    exit;
                                if (rec."Document Type" = Rec."Document Type"::Order) or (rec."Document Type" = rec."Document Type"::Quote) then begin
                                    if (rec.Type = rec.Type::Item) and (rec.Quantity <> 0) then begin
                                        OrbusSingleInstanceCUGbl.SetExplodeBOMConfirm(true);
                                        if (ItemRecLcl.get(rec."No.")) and (rec."Prepmt. Amt. Inv." = 0) then begin
                                            SalesLineLoc := Rec;
                                            ItemRecLcl.CalcFields("Assembly BOM");
                                            if ItemRecLcl."Assembly BOM" then begin
                                                CODEUNIT.Run(CODEUNIT::"Sales-Explode BOM", Rec);
                                                Rec.INIT;
                                                Rec.Description := SalesLineLoc.Description;
                                                Rec."Description 2" := SalesLineLoc."Description 2";
                                                Rec."BOM Item No." := SalesLineLoc."BOM Item No.";
                                                Rec.MODIFY;
                                            end;
                                        end;
                                        DocumentTotals.SalesDocTotalsNotUpToDate();
                                        OrbusSingleInstanceCUGbl.SetExplodeBOMConfirm(false);
                                    end;
                                end;
                */
            end;

            //end;
        }
    }

    trigger OnAfterModify()
    begin

        Rec.Validate("ORB Explode", true);
        //Rec.Modify();
    end;

    var
        OrbusSingleInstanceCUGbl: codeunit "ORB Orbus Single Instance";
}

