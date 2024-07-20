tableextension 52621 "ORB Sales Line" extends "Sales Line"
{
    fields
    {
        field(52605; "ORB Magento Artwork Job ID"; Text[20])
        {
            Caption = 'Magento Artwork Job ID';
            DataClassification = ToBeClassified;
        }
        field(52118; "ORB Ship-to State_fl"; Text[50])
        {
            Caption = 'State';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Header"."Ship-to County" where("Document Type" = field("Document Type"), "No." = field("Document No.")));
        }
        field(50119; "ORB Explode"; Boolean)
        {
            Caption = 'Explode';

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
        field(52119; "ORB Order Status"; Enum OrderStatus)
        {
            Caption = 'State';
            Editable = false;
            FieldClass = FlowField;
            calcformula = Lookup("Sales Header"."Order Status" where("Document Type" = const(Order), "No." = field("Document No.")));
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
                //end;
            end;
        }
    }

    trigger OnAfterModify()
    var
        SalesHeader: Record "Sales Header";
    begin
        if GuiAllowed then
            exit;
        Rec.Validate("ORB Explode", true);
        Rec.Modify();
        if Rec."Shortcut Dimension 2 Code" = '01' then
            if SalesHeader.get(Rec."Document Type"::Order, Rec."Document No.") then
                if not SalesHeader."Graphics Only" then begin
                    SalesHeader.Validate("Graphics Only", true);
                    SalesHeader.Modify();
                end;

    end;

    trigger OnAfterInsert()
    begin
        if GuiAllowed then
            exit;

        if Rec.Quantity <> 0 then begin
            Rec.Validate("ORB Explode", true);
            Rec.Modify();
        end;
    end;

    var
        OrbusSingleInstanceCUGbl: codeunit "ORB Orbus Single Instance";
}

