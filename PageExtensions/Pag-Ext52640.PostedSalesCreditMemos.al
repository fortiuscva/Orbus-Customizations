pageextension 52640 "ORB Posted Sales Credit Memos" extends "Posted Sales Credit Memos"
{
    layout
    {
        addlast(Control1)
        {
            /* field("ORB Your Reference"; Rec."Your Reference")
            {
                ApplicationArea = All;
                Caption = 'Your Reference';
                ToolTip = 'Specifies the document referenced for credits';
            } */
            field("ORB Your Reference(CS)"; Rec."ORB Your Reference(CS)")
            {
                ApplicationArea = All;
                Caption = 'Your Reference (CS)';
                ToolTip = 'Specifies the document referenced for credits';
            }
            field("ORB Shipping Agent Code"; Rec."Shipping Agent Code")
            {
                ApplicationArea = All;
                Caption = 'Shipping Agent Code';
                ToolTip = 'Specifies the Shipping Agent Code';
            }
            field("ORB Shipping Agent Service Code"; Rec."Shipping Agent Service Code")
            {
                ApplicationArea = All;
                Caption = 'Shipping Agent Service Code';
                ToolTip = 'Specifies the Shipping Agent Service Code';
            }

        }

    }
}