tableextension 52620 "ORB Sales Cr.Memo Line" extends "Sales Cr.Memo Line"
{
    fields
    {
        //52600 Occupied in Sales Line Archive table
        //52601 Occupied in Sales Line Archive table

        field(52605; "ORB Magento Artwork Job ID"; Text[20])
        {
            Caption = 'Magento Artwork Job ID';
            DataClassification = ToBeClassified;
        }
        field(52118; "ORB Ship-to State_fl"; Text[50])
        {
            Caption = 'State';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Cr.Memo Header"."Ship-to County" where("No." = field("Document No.")));
        }

    }
}
