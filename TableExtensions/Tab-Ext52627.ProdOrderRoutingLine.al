tableextension 52627 "ORB Prod. Order Routing Line" extends "Prod. Order Routing Line"
{
    fields
    {
        modify("No.")
        {
            trigger OnAfterValidate()
            var
                WorkCenterGroupRecLcl: Record "Work Center Group";
            begin
                if rec.Type = rec.Type::"Work Center" then
                    if WorkCenterGroupRecLcl.get(rec."Work Center Group Code") then
                        rec."ORB Fast Solutions" := WorkCenterGroupRecLcl."ORB Fast Solutions";
            end;
        }

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
        field(53400; "ORB Fast Solutions"; Boolean)
        {
            Caption = 'Fast Solutions';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(53401; "ORB Finished Quantity"; Decimal)
        {
            Caption = 'Fast Solutions';
            FieldClass = FlowField;
            CalcFormula = sum("Capacity Ledger Entry".Quantity where("Order No." = field("Prod. Order No."), "Order Line No." = field("Routing Reference No."), "Routing No." = field("Routing No."), "Operation No." = field("Operation No.")));
            Editable = false;
        }
    }
}
