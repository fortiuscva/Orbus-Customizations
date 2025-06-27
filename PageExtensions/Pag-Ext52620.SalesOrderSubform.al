pageextension 52620 "ORB Sales Order Subform" extends "Sales Order Subform"
{
    layout
    {

        addafter("No.")
        {
            field("ORB Magento Artwork Job ID"; Rec."ORB Magento Artwork Job ID")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Magento Artwork Job ID field.';
                Editable = false;
            }
        }
        addafter("Line Discount %")
        {
            field("ORB LIFT Discount Amount"; Rec."ORB LIFT Discount Amount")
            {
                ApplicationArea = All;
                Editable = IsLIFTDiscountEditable;
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
        modify("Unit Price")
        {
            trigger OnAfterValidate()
            begin
                LIFTBCFunctionsCU.ValidateRestrictedLineChanges(rec, xRec);
            end;
        }
        modify("Line Discount %")
        {
            trigger OnAfterValidate()
            begin
                LIFTBCFunctionsCU.ValidateRestrictedLineChanges(rec, xRec);
            end;
        }
        modify("Line Discount Amount")
        {
            trigger OnAfterValidate()
            begin
                LIFTBCFunctionsCU.ValidateRestrictedLineChanges(rec, xRec);
            end;
        }
    }

    actions
    {

        addafter(SelectMultiItems)
        {
            action("ORB Change JobWorkID")
            {
                ApplicationArea = All;
                Caption = 'Change JobWork ID';
                Image = UpdateDescription;
                trigger OnAction()
                var
                    salesLine: Record "Sales Line";
                    InputDialogue: Page "ORB Input Dialogue";
                begin
                    //Page.Run(Page::"ORB Input Dialogue", Rec);
                    InputDialogue.SetOrderLine(Rec);
                    InputDialogue.RunModal();
                    CurrPage.Update(false);
                end;
            }

            action("ORB Sales Line Addtional Fields")
            {
                ApplicationArea = All;
                Caption = 'Additional Fields';
                Image = RelatedInformation;
                RunObject = Page "ORB Sales Line Add. Fields";
                RunPageLink = "Document Type" = field("Document Type"), "Document No." = field("Document No."), "Line No." = field("Line No.");
            }

        }
    }
    trigger OnAfterGetRecord()
    begin
        if UserId <> 'BCADMIN' then
            IsLIFTDiscountEditable := false
        else
            IsLIFTDiscountEditable := true;
    end;

    var
        OrbusSingleInstanceCUGbl: codeunit "ORB Orbus Single Instance";
        LIFTBCFunctionsCU: Codeunit "ORB LIFTtoBC Functions";
        IsLIFTDiscountEditable: Boolean;
}
