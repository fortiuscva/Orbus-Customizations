pageextension 52630 "ORB Sales Quote" extends "Sales Quote"
{
    layout
    {
        addafter("Last Followup Date")
        {
            field("ORB Last Followup By"; Rec."ORB Last Followup By")
            {
                Caption = 'Last Followup By';
                ApplicationArea = All;
                ToolTip = 'Followup by the sales person';
            }
        }
    }
}