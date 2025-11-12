tableextension 52622 "ORB Prod. Order Line" extends "Prod. Order Line"
{
    fields
    {
        field(52600; "ORB Sales Order No."; Code[20])
        {
            Caption = 'Sales Order No.';
            DataClassification = ToBeClassified;
        }
        field(52601; "ORB Sales Order Line No."; Integer)
        {
            Caption = 'Sales Order Line No.';
            DataClassification = ToBeClassified;
        }
        field(53400; "ORB Fast Solutions"; Boolean)
        {
            Caption = 'Fast Solutions';
            FieldClass = FlowField;
            CalcFormula = exist("Prod. Order Routing Line" where(Status = field(Status), "Prod. Order No." = field("Prod. Order No."), "Routing Reference No." = field("Line No."), "ORB Fast Solutions" = const(True)));
            Editable = false;
        }
    }
}
