tableextension 52620 "ORB Sales Cr.Memo Line" extends "Sales Cr.Memo Line"
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
