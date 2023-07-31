pageextension 52610 "ORB Sales & Receivables Setup" extends "Sales & Receivables Setup"
{
    layout
    {
        addlast(General)
        {
            field("ORB Send Email Inv. Start Date"; Rec."ORB Send Email Inv. Start Date")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies from when the email should be send for Posted Sales Invoices';
            }
        }
    }
}