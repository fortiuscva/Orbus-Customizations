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
        addafter("Requested Delivery Date")
        {
            field("ORB Your Reference(CS)"; Rec."ORB Your Reference(CS)")
            {
                Caption = 'Your Reference(CS)';
                ApplicationArea = All;
                ToolTip = 'Specifies your reference';
            }

        }
        modify("Your Reference")
        {
            Caption = 'Versapay ID';
            Editable = false;
        }
    }
}