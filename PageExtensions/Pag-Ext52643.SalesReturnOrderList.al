pageextension 52643 "ORB Sales Return Order List" extends "Sales Return Order List"
{
    layout
    {
        addlast(Control1)
        {
            /* field("ORB Your Reference"; Rec."Your Reference")
            {
                ApplicationArea = ALL;
                ToolTip = 'Specifies the reference for the returns';
            } */

            field("ORB Your Reference(CS)"; Rec."ORB Your Reference(CS)")
            {
                ApplicationArea = ALL;
                ToolTip = 'Specifies the reference for the returns';
            }

        }
    }
}