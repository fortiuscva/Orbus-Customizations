
tableextension 52608 "ORB IWX Invt. Buffer" extends "IWX Invt. Buffer"
{
    fields
    {
        field(52600; "ORB Zone Code"; Code[10])
        {
            Caption = 'Zone Code';
            TableRelation = zone.Code;
            DataClassification = CustomerContent;
        }
    }
}