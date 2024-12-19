pageextension 52646 "ORB Sales Return Order" extends "Sales Return Order"
{
    layout
    {
        addafter("Posting Date")
        {
            field("ORB Your Reference(CS)"; Rec."ORB Your Reference(CS)")
            {
                Caption = 'Your Reference(CS)';
                ApplicationArea = All;
                ToolTip = 'Specifies Your Reference';

            }
        }
        modify("Your Reference")
        {
            Caption = 'Versapay ID';
            Editable = False;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}