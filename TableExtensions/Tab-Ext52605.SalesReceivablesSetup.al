tableextension 52605 "ORB Sales & Receivables Setup" extends "Sales & Receivables Setup"
{
    fields
    {
        field(52600; "ORB Send Email Inv. Start Date"; Date)
        {
            Caption = 'Send Email Invoices Start Date';
            DataClassification = CustomerContent;
        }
        field(52601; "ORB Default Resource for DSHIP"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Default Resource for DSHIP';
            TableRelation = Resource;
        }
    }

}