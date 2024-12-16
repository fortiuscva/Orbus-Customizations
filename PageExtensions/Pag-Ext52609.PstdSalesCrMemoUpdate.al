pageextension 52609 "ORB Pstd. Sales Cr.Memo-Update" extends "Pstd. Sales Cr. Memo - Update"
{
    layout
    {
        modify("Sell-to Customer Name")
        {
            Editable = true;
        }
        addafter("Sell-to Customer Name")
        {
            field("ORB Bill-to Name"; Rec."Bill-to Name")
            {
                ApplicationArea = All;
                Editable = true;
                ToolTip = 'Specifies the name of the customer that the Credit Memo was sent to.';
            }

            field("ORB Ship-to Name"; Rec."Ship-to Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the name of the customer that the items were shipped to.';
            }
            field("ORB External Document No."; Rec."External Document No.")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the External Doc No. on Sales Cr Memo Header';
            }
            /* field("ORB Your Reference"; Rec."Your Reference")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Your Reference on Sales Cr Memo Header';
            } */
            field("ORB Your Reference(CS)"; Rec."ORB Your Reference(CS)")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Your Reference on Sales Cr Memo Header';
            }
        }
    }
}
