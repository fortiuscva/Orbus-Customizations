tableextension 52633 "ORB Posted Invt. Pick Header" extends "Posted Invt. Pick Header"
{
    fields
    {
        field(52600; "ORB Sales Order No."; Code[20])
        {
            Caption = 'Sales Order No.';
            FieldClass = FlowField;
            CalcFormula = lookup("Posted Invt. Pick Line"."Source No." where("No." = field("No."), "Source Document" = const("Sales Order")));
            Editable = false;
        }
        field(52601; "ORB Order No."; Code[20])
        {
            Caption = 'Order No.';
        }
    }
}
