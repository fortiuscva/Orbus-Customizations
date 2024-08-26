tableextension 52624 "ORB DSHIP Carrier Rate Buffer" extends "DSHIP Carrier Rate Buffer"
{
    fields
    {
        field(52600; "ORB Handling"; Decimal)
        {
            Caption = 'Handling';
            DataClassification = ToBeClassified;
        }
        field(52601; "ORB Freight Quote"; Decimal)
        {
            Caption = 'Freight Quote';
            DataClassification = ToBeClassified;
        }
    }
}
