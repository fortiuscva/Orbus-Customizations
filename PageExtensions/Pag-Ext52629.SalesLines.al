
pageextension 52629 "ORB Sales Lines" extends "Sales Lines"
{
    layout
    {
        addafter("Sell-to Customer No.")
        {
            field("ORB State"; Rec."ORB Ship-to State_fl")
            {
                Caption = 'Ship-To State';
                Editable = false;
                ApplicationArea = All;
                ToolTip = 'Specifies Ship to State';
            }
        }
        addafter("Location Code")
        {
            field("ORB Order Status"; Rec."ORB Order Status")
            {
                ApplicationArea = All;
            }
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