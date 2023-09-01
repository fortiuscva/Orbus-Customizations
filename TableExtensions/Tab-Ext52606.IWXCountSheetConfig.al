tableextension 52606 "ORB IWX Count Sheet Config." extends "IWX Count Sheet Configuration"
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