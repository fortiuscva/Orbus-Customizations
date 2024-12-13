pageextension 52647 "ORB Sales Credit Memo" extends "Sales Credit Memo"
{
    layout
    {
        addlast(General)
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
            Caption = 'VersapayID';
            Editable = false;
        }

    }

}