tableextension 52607 "ORB IWX Count Sheet Line" extends "IWX Count Sheet Line"
{
    fields
    {
        field(52600; "ORB Zone Code"; Code[10])
        {
            Caption = 'Zone Code';
            TableRelation = zone.Code;
            DataClassification = CustomerContent;
        }
        field(52601; "ORB Quantity on Pick"; Decimal)
        {
            Caption = 'Quantity on Pick';
            DataClassification = CustomerContent;
        }
    }
}