pageextension 52630 "ORB SalesQuote" extends "Sales Quote"
{
    layout
    {
        addafter("Last Followup Date")
        {
            field("ORB Last Followup By"; Rec."ORB Last Followup By")
            {
                Caption = 'Last Folloup By';
                ApplicationArea = All;
                ToolTip = 'Followup by the sales person';
            }
        }
    }
}