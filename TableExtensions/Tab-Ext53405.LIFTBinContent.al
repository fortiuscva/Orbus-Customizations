tableextension 53405 "ORB LIFT Bin Content" extends "Bin Content"
{
    fields
    {
        field(53400; "ORB Location Id"; Integer)
        {
            CalcFormula = lookup(Location."ORB Location Id" where(Code = field("Location Code")));
            FieldClass = FlowField;
            Caption = 'Location Id';
            Editable = false;
        }
        field(53401; "ORB Bin Location Id"; Integer)
        {
            CalcFormula = lookup(Bin."ORB Bin Location Id" where(Code = field("Bin Code")));
            FieldClass = FlowField;
            Caption = 'Bin Location Id';
            Editable = false;
        }
        field(53402; "ORB Item Material Id"; Integer)
        {
            Caption = 'Item Material Id';
            CalcFormula = lookup(Item."ORB Material Id" where("No." = field("Item No.")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(53403; "ORB Item Storage Type Id"; Integer)
        {
            Caption = 'Item Storage Type Id';
            CalcFormula = lookup(Item."ORB Stroage Type Id" where("No." = field("Item No.")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(53405; "ORB Item Var. Storage Type Id"; Integer)
        {
            Caption = 'Item Variant Storage Type Id';
            CalcFormula = lookup("Item Variant"."ORB Storage Type Id" where("Item No." = field("Item No."), Code = field("Variant Code")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(53406; "ORB Qty Conversion"; Decimal)
        {
            Caption = 'Qty Conversion';
            CalcFormula = lookup("Item Unit of Measure"."Qty. per Unit of Measure" where("Item No." = field("Item No."), Code = const('YD')));
            FieldClass = FlowField;
            Editable = false;
        }
    }
}
