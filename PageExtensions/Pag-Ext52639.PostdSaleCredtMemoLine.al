pageextension 52639 "ORB Postd Sale Credt Memo Line" extends "Posted Sales Credit Memo Lines"
{
    layout
    {
        addlast(Control1)
        {
            field("ORB Posting Date"; Rec."Posting Date")
            {
                ApplicationArea = all;
                ToolTip = 'Posting Date';

            }
        }
    }
}