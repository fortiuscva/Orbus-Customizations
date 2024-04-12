page 52611 "ORB Magento Sales Line Details"
{

    APIGroup = 'orbus';
    APIPublisher = 'orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'MagentoSalesLineDetails';
    DelayedInsert = true;
    PageType = API;
    EntityName = 'MagentosalesLineDetailsAPI';
    EntitySetName = 'MagentosalesLineDetailsAPI';
    SourceTable = "Sales Line";
    ModifyAllowed = true;
    DeleteAllowed = true;
    InsertAllowed = true;
    Permissions = tabledata "Sales Line" = rmid;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(SystemId; Rec.SystemId)
                {
                }
                field(DocumentType; Rec."Document Type")
                {
                    ToolTip = 'Specifies the type of document that you are about to create.';
                }
                field(DocumentNo; Rec."Document No.")
                {
                    ToolTip = 'Specifies the document number.';
                }
                field(LineNo; Rec."Line No.")
                {
                    ToolTip = 'Specifies the line number.';
                }
                field(LineType; Rec."Type")
                {
                    ToolTip = 'Specifies the line type.';
                }
                field(ItemNo; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
                field(LineQuantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Item No. field.';

                    trigger OnValidate()
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
                field(MagentoArtworkJobID; Rec."ORB Magento Artwork Job ID")
                {
                    ToolTip = 'Specifies the value of the Magento Artwork Job ID field.';
                }
            }
        }
    }

    Var
        OrbusSingleInstanceCUGbl: codeunit "ORB Orbus Single Instance";
}
