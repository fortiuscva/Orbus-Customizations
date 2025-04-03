page 52649 "ORB Sales Order - Update"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = Card;
    ShowFilter = false;
    SourceTable = "Sales Header";
    SourceTableTemporary = true;
    Caption = 'Sales Order - Update';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Versapay ID"; Rec."Your Reference")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = true;
                    Caption = 'Versapay ID';
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        xSalesHeader := Rec;
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        SalesHeader: Record "Sales Header";
    begin
        if CloseAction = ACTION::LookupOK then
            if RecordChanged() then begin
                SalesHeader.copy(Rec);
                SalesHeader."Your Reference" := Rec."Your Reference";
                SalesHeader.Modify();
                Rec.Copy(SalesHeader);
            end;
    end;


    var
        xSalesHeader: Record "Sales Header";

    local procedure RecordChanged() IsChanged: Boolean
    begin
        IsChanged := (Rec."Your Reference" <> xSalesHeader."Your Reference");
    end;

    procedure SetRec(SalesHeader: Record "Sales Header")
    begin
        Rec := SalesHeader;
        Rec.Insert();
    end;
}
