tableextension 52611 "ORB DSHIP Setup" extends "DSHIP Setup"
{
    fields
    {
        field(52600; "ORB Override Source"; Enum "DSHIP Customer Contact Source")
        {
            Caption = 'Override Source';
            DataClassification = ToBeClassified;
        }
    }
}
