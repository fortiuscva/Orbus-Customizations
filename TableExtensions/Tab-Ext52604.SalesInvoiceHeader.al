tableextension 52604 "ORB Sales Invoice Header" extends "Sales Invoice Header"
{
    fields
    {
        field(52600; "ORB Email Sent by JQ"; Boolean)
        {
            Caption = 'Email Sent by JQ';
            DataClassification = CustomerContent;
        }
        field(52601; "ORB Last Email Sent DT"; DateTime)
        {
            Caption = 'Last JQ Email Sent Date & Time';
            DataClassification = CustomerContent;
        }
    }


}