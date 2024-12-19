pageextension 52645 "ORB Posted Sales Credit Memo" extends "Posted Sales Credit Memo"
{
    layout
    {
        addafter("Posting Date")
        {

            field("ORB Your Reference(CS)"; Rec."ORB Your Reference(CS)")
            {
                Caption = 'Your Reference(CS)';
                ApplicationArea = All;
                Tooltip = 'Specifies Your Reference';
                Editable = False;
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