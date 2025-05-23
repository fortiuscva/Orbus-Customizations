tableextension 52621 "ORB Sales Line" extends "Sales Line"
{
    fields
    {
        modify("No.")
        {
            trigger OnAfterValidate()
            var
                salesHeader: Record "Sales Header";
                SalesLine: Record "Sales Line";
                SetGraphicsFlag: Boolean;
            begin
                SetGraphicsFlag := false;
                if not GuiAllowed then begin
                    SalesLine.SetRange("Document Type", Rec."Document Type");
                    SalesLine.SetRange("Document No.", Rec."Document No.");
                    SalesLine.SetRange("Shortcut Dimension 2 Code", '01');
                    if not SalesLine.IsEmpty then
                        SetGraphicsFlag := false
                    else
                        SetGraphicsFlag := true;
                    if Rec."Shortcut Dimension 2 Code" = '01' then
                        SetGraphicsFlag := false
                end;
                if SalesHeader.get(Rec."Document Type"::Order, Rec."Document No.") then begin
                    SalesHeader.Validate("Graphics Only", SetGraphicsFlag);
                    SalesHeader.Modify();
                end;
            end;
        }
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
                                Rec."ORB Magento Artwork Job ID" := SalesLineLoc."ORB Magento Artwork Job ID";
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
        field(52120; "ORB Quote Status"; Enum QuoteStatus)
        {
            Caption = 'Quote Status';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Quote Status" where("Document Type" = const(Quote), "No." = field("Document No.")));
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
        field(52121; "ORB Custom"; Boolean)
        {
            Caption = 'Custom';
            Editable = false;
            FieldClass = FlowField;
            calcformula = Lookup("Sales Header".Custom where("Document Type" = const(Order), "No." = field("Document No.")));
        }
        field(52122; "ORB ProductLine Dim"; Code[20])
        {
            Caption = 'ProductLine Dim';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Dimension Set Entry"."Dimension Value Code" where("Dimension Set ID" = field("Dimension Set ID"), "Dimension Code" = const('PRDLN')));
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

