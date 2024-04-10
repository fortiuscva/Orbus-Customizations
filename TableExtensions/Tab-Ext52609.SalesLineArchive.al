tableextension 52609 "ORB Sales Line Archive" extends "Sales Line Archive"
{
    fields
    {
        field(52600; "ORB Date Archived"; Date)
        {
            Caption = 'Date Archived';
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Header Archive"."Date Archived" where("Document Type" = FIELD("Document Type"),
                                                            "No." = FIELD("Document No."),
                                                            "Doc. No. Occurrence" = FIELD("Doc. No. Occurrence"),
                                                            "Version No." = field("Version No.")));
            Editable = false;

        }
        field(52601; "ORB Time Archived"; Time)
        {
            Caption = 'Time Archived';
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Header Archive"."Time Archived" where("Document Type" = FIELD("Document Type"),
                                                            "No." = FIELD("Document No."),
                                                            "Doc. No. Occurrence" = FIELD("Doc. No. Occurrence"),
                                                            "Version No." = field("Version No.")));
            Editable = false;
        }
        field(52605; "ORB Magento Artwork Job ID"; Text[20])
        {
            Caption = 'Magento Artwork Job ID';
            DataClassification = ToBeClassified;
        }
    }
}
