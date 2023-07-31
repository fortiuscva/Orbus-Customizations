tableextension 52605 "ORB Sales & Receivables Setup" extends "Sales & Receivables Setup"
{
    fields
    {
        field(52600; "ORB Send Email Inv. Start Date"; Date)
        {
            Caption = 'Send Email Invoices Start Date';
            DataClassification = CustomerContent;
        }
    }

}