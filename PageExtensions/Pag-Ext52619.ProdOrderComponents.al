pageextension 52619 "ORB Prod. Order Components" extends "Prod. Order Components"
{
    layout
    {
        addlast(Control1)
        {
            field("ORB IN BIN Qty"; INBINQtyVarGbl)
            {
                ApplicationArea = all;
                Editable = false;
                DecimalPlaces = 0 : 5;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        INBINQtyVarGbl := ORBFunctionsCUGbl.CalcINBINQty(rec);
    end;

    var
        INBINQtyVarGbl: Decimal;
        ORBFunctionsCUGbl: Codeunit "ORB Functions";


}
