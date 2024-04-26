tableextension 52621 "ORB Sales Line" extends "Sales Line"
{
    fields
    {
        field(52605; "ORB Magento Artwork Job ID"; Text[20])
        {
            Caption = 'Magento Artwork Job ID';
            DataClassification = ToBeClassified;
        }

        field(50118; "ORB Ship-to State_fl"; Text[50])
        {
            Caption = 'State';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Header"."Ship-to County" where("No." = field("Document No.")));
        }
    }
}
