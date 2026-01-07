pageextension 53414 "Posted Sales Cr. Memo Subform" extends "Posted Sales Cr. Memo Subform"
{
    layout
    {
        addlast(Control1)
        {
            field("ORB Family Dimension"; Rec."ORB Family Dimension")
            {
                ApplicationArea = All;
                Caption = 'Family Dimension';
                Tooltip = 'Specifies Family Dimension';
                Editable = false;
            }

        }

    }

}