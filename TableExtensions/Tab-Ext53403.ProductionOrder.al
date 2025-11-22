tableextension 53403 "ORB Production Order" extends "Production Order"
{
    fields
    {
        field(53400; "ORB Fast Solutions"; Boolean)
        {
            Caption = 'Fast Solutions';
            FieldClass = FlowField;
            CalcFormula = exist("Prod. Order Routing Line" where(Status = field(Status), "Prod. Order No." = field("No."), "ORB Fast Solutions" = const(True)));
            Editable = false;
        }
    }
}
