tableextension 52629 "ORB Warehouse Journal Line" extends "Warehouse Journal Line"
{
    fields
    {
        field(52600; "ORB LIFT Inv. Transaction ID"; Integer)
        {
            Caption = 'LIFT Inv. Transaction ID';
            DataClassification = ToBeClassified;
        }
        field(52601; "ORB LIFT Order Line ID"; Integer)
        {
            Caption = 'LIFT Order Line ID';
            DataClassification = ToBeClassified;
        }
    }
}
