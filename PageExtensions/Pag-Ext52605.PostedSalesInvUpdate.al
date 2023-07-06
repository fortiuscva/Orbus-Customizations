pageextension 52605 "ORB Posted Sales Inv. - Update" extends "Posted Sales Inv. - Update"
{
    layout
    {
        modify("Sell-to Customer Name")
        {
            Editable = true;
        }
        addafter("Sell-to Customer Name")
        {
            field("ORB Bill-to Name"; Rec."Bill-to Name")
            {
                ApplicationArea = All;
                Editable = true;
                ToolTip = 'Specifies the name of the customer that the invoice was sent to.';
            }
            field("ORB Ship-to Name"; Rec."Ship-to Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the name of the customer that the items were shipped to.';
            }
        }
    }
}
