tableextension 52627 "ORB Prod. Order Routing Line" extends "Prod. Order Routing Line"
{
    fields
    {
        field(52600; "ORB Product Line"; Text[50])
        {
            Caption = 'PrdLn Dimension';
            DataClassification = ToBeClassified;
            // TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3),
            //                                               Blocked = const(false));
        }
        field(52601; "ORB Material"; Text[50])
        {
            Caption = 'Material Dimension';
            DataClassification = ToBeClassified;
            // TableRelation = "Dimension Value".Code where("Global Dimension No." = const(7),
            //                                               Blocked = const(false));
        }
    }
}
