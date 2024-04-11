tableextension 52619 "ORB Sales Invoice Line" extends "Sales Invoice Line"
{
    fields
    {
        field(52605; "ORB Magento Artwork Job ID"; Text[20])
        {
            Caption = 'Magento Artwork Job ID';
            DataClassification = ToBeClassified;
        }
    }
}
