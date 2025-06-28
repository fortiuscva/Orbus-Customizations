tableextension 52609 "ORB Sales Line Archive" extends "Sales Line Archive"
{
    fields
    {
        //52119 Occupied in Sales Line table
        //52121 Occupied in Sales Line table
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
        field(52118; "ORB Ship-to State_fl"; Text[50])
        {
            Caption = 'State';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Header Archive"."Ship-to County" where("Document Type" = field("Document Type"), "No." = field("Document No."), "Version No." = field("Version No.")));
        }
        field(52122; "ORB ProductLine Dim"; Code[20])
        {
            Caption = 'ProductLine Dim';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Dimension Set Entry"."Dimension Value Code" where("Dimension Set ID" = field("Dimension Set ID"), "Dimension Code" = const('PRDLN')));
        }
        field(53401; "ORB LIFT Discount Amount"; Decimal)
        {
            Caption = 'LIFT Discount Amount';
            DataClassification = CustomerContent;
        }
    }
}
