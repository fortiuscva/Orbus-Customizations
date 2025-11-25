tableextension 53407 "ORB LIFT BOM Component" extends "BOM Component"
{
    fields
    {
        field(53400; "ORB Do Not Integrate (Sell)"; Boolean)
        {
            Caption = 'Do Not Integrate (Sellable)';
            FieldClass = FlowField;
            CalcFormula = lookup(Item."ORB Do Not Integrate (Sell)" where("No." = field("Parent Item No.")));
            Editable = false;
        }
        field(53401; "ORB LIFT Parent Product ID"; Integer)
        {
            Caption = 'Parent Product ID';
            FieldClass = FlowField;
            CalcFormula = lookup(Item."ORB Product Id" where("No." = field("Parent Item No.")));
            Editable = false;
        }
        field(53402; "ORB LIFT Product ID"; Integer)
        {
            Caption = 'Product ID';
            DataClassification = CustomerContent;
            // FieldClass = FlowField;
            // CalcFormula = lookup(Item."ORB Product Id" where("No." = field("No.")));
            // Editable = false;
        }
    }
}
