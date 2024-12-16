pageextension 52648 "ORB Sales Quotes" extends "Sales Quotes"
{
    layout
    {
        addlast(Control1)
        {
            field("ORB Your Reference(CS)"; Rec."ORB Your Reference(CS)")
            {
                ApplicationArea = ALL;
                ToolTip = 'Specifies the Reference';
            }

        }

        modify("Your Reference")
        {
            Caption = 'VersapayID';
            Editable = false;
        }
    }


}