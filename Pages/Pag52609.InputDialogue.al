page 52609 "ORB Input Dialogue"
{
    ApplicationArea = All;
    Caption = 'Enter Value';
    PageType = StandardDialog;

    layout
    {
        area(content)
        {

            group(ArtworkIdGroup)
            {
                Caption = 'Artwork Id';
                field(ArtworkId; ArtworkId)
                {
                    Caption = 'Magento Artwork Job ID';
                    ApplicationArea = all;
                }

            }
        }
    }
    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        salesLine: Record "Sales Line";
        confirmManagement: Codeunit "Confirm Management";
    begin
        if CloseAction = CloseAction::Cancel then
            exit;
        if CloseAction = CloseAction::No then
            exit;
        if ArtworkId = '' then
            if not confirmManagement.GetResponse(BlankQst, false) then
                exit;
        salesLine.Get(OriginalSalesLine."Document Type", OriginalSalesLine."Document No.", OriginalSalesLine."Line No.");
        salesLine."ORB Magento Artwork Job ID" := ArtworkId;
        salesLine.Modify();
    end;

    procedure SetOrderLine(SalesLine: Record "Sales Line")
    begin
        OriginalSalesLine := SalesLine;
    end;

    var
        OriginalSalesLine: Record "Sales Line";
        ArtworkId: Text[20];
        BlankQst: Label 'You have not assigned any value. Do you want to update BLANK value?';
}
