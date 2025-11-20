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
        field(53401; "ORB Fast Solutions Status Sent"; Boolean)
        {
            Caption = 'Fast Solutions Status Sent';
            Editable = false;
        }

        field(53402; "ORB LIFT Sales Order"; Boolean)
        {
            Caption = 'LIFT Sales Order';
            FieldClass = FlowField;
            CalcFormula = Exist("Sales Header" WHERE("ORB Lift Order" = CONST(true), "No." = FIELD("Source No.")));
            Editable = false;
        }
    }
}
