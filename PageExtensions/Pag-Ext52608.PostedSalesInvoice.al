pageextension 52608 "ORB Posted Sales Invoice" extends "Posted Sales Invoice"
{
    layout
    {
        addbefore("Work Description")
        {
            field("ORB Email Sent by JQ"; Rec."ORB Email Sent by JQ")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Email Sent by JQ for the invoice';
                Editable = false;
            }
            field("ORB Last Email Sent DT"; Rec."ORB Last Email Sent DT")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Last Email Sent Date&Time for the invoice';
                Editable = false;
            }
        }
    }
}
