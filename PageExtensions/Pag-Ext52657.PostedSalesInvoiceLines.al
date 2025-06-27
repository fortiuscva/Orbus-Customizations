pageextension 52657 "ORB Posted Sales Invoice Lines" extends "Posted Sales Invoice Lines"
{
    layout
    {
        addafter("Location Code")
        {
            field("ORB ProductLine Dim"; rec."ORB ProductLine Dim")
            {
                ApplicationArea = All;
            }
            field("ORB Custom"; Rec."ORB Custom")
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
