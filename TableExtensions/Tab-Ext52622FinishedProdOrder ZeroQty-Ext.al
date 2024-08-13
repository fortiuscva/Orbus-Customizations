tableextension 52622 "Finished ProdOrder ZeroQty-Ext" extends "ORB Finished ProdOrder ZeroQty"
{
    fields
    {
        field(50000; "Prod Line Modified By"; Text[1000])
        {
            Caption = 'Prod Line Modified By';
            DataClassification = ToBeClassified;
        }

        field(50001; "Prod Line Modified DT"; DateTime)
        {
            Caption = 'Production Line Modified on';
            DataClassification = ToBeClassified;
        }
    }


}