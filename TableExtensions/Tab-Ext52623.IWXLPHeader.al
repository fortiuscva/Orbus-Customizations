tableextension 52623 "ORB IWX LP Header" extends "IWX LP Header"
{
    fields
    {
        field(52600; "ORB DS Payment Type"; Option)
        {
            Caption = 'DS Payment Type';
            FieldClass = FlowField;
            CalcFormula = lookup("DSHIP Package Options"."Payment Type" where("License Plate No." = field("No.")));
            OptionMembers = " ",SENDER,THIRD_PARTY,RECEIVER,COLLECT;
            OptionCaption = 'None,Sender,Third Party,Receiver,Collect';
            Editable = false;
        }
        field(52601; "ORB Posted Sales Invoice No."; Code[20])
        {
            Caption = 'Posted Sales Invoice No.';
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Invoice Header"."No." where("Order No." = field("Shipped Source No."), "Order No." = filter(<> '')));
            Editable = false;
        }
    }
}
