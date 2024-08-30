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
    }
}
