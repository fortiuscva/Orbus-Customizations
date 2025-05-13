tableextension 52619 "ORB Sales Invoice Line" extends "Sales Invoice Line"
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
            CalcFormula = lookup("Sales Invoice Header"."Ship-to County" where("No." = field("Document No.")));
        }
        field(52119; "ORB ProductLine Dim"; Code[20])
        {
            Caption = 'ProductLine Dim';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Dimension Set Entry"."Dimension Value Code" where("Dimension Set ID" = field("Dimension Set ID"), "Dimension Code" = const('PRDLN')));
        }
        field(52120; "ORB Custom"; Boolean)
        {
            Caption = 'Custom';
            Editable = false;
            FieldClass = FlowField;
            calcformula = Lookup("Sales Invoice Header".Custom where("No." = field("Document No.")));
        }
        field(52121; "ORB Order Status"; Enum OrderStatus)
        {
            Caption = 'Order Status';
            Editable = false;
            FieldClass = FlowField;
            calcformula = Lookup("Sales Invoice Header"."ORB Order Status" where("No." = field("Document No.")));
        }

    }
}
