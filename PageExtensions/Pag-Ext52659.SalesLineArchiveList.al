pageextension 52659 "ORB Sales Line Archive List" extends "Sales Line Archive List"
{
    layout
    {
        addafter("Amount Including VAT")
        {
            field("ORB ProductLine Dim"; Rec."ORB ProductLine Dim")
            {
                ApplicationArea = All;
            }
            field("ORB LIFT Discount Amount"; Rec."ORB LIFT Discount Amount")
            {
                ApplicationArea = All;
            }
        }
    }
}
