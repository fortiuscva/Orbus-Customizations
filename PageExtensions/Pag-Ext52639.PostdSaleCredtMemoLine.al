pageextension 52639 "ORB Postd Sale Credt Memo Line" extends "Posted Sales Credit Memo Lines"
{
    layout
    {
        addlast(Control1)
        {
            field("ORB Posting Date"; Rec."Posting Date")
            {
                ApplicationArea = all;
                ToolTip = 'Posting Date';

            }
            field("ORB ProductLine Dim"; Rec."ORB ProductLine Dim")
            {
                ApplicationArea = All;
            }
            field("ORB LIFT Discount Amount"; Rec."ORB LIFT Discount Amount")
            {
                ApplicationArea = All;
                Editable = IsLIFTDiscountEditable;
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
        IsLIFTDiscountEditable: Boolean;
}