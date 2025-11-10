tableextension 53405 "ORB LIFT Bin Content" extends "Bin Content"
{
    fields
    {
        field(53400; "ORB Location Id"; Integer)
        {
            CalcFormula = lookup(Location."ORB Location Id" where(Code = field("Location Code")));
            FieldClass = FlowField;
        }
    }
}
