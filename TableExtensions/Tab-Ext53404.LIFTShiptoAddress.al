tableextension 53404 "ORB LIFT Ship-to Address" extends "Ship-to Address"
{
    fields
    {
        field(53400; "ORB Active Status"; Enum "LIFT Contact & ShipTo Status")
        {
            Caption = 'Active Status';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
}
