tableextension 52618 "ORB Sales Shipment Line" extends "Sales Shipment Line"
{
    fields
    {
        //52600 Occupied in Sales Line Archive table
        //52601 Occupied in Sales Line Archive table
        //52119 Occupied in Sales Line table
        //52121 Occupied in Sales Line table
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
            CalcFormula = lookup("Sales Shipment Header"."Ship-to County" where("No." = field("Document No.")));
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
            Editable = false;
            DataClassification = CustomerContent;
        }
    }
}
