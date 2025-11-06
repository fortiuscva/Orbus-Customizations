tableextension 52631 "ORB Item" extends Item
{
    fields
    {
        field(52600; "ORB Master Qty. Count"; Integer)
        {
            Caption = 'Master Quantity Count';
            DataClassification = ToBeClassified;
        }
        field(52601; "ORB Bagging Quantity"; Integer)
        {
            Caption = 'Bagging Quantity Count';
            DataClassification = ToBeClassified;
        }
        field(53400; "ORB Material Id"; Integer)
        {
            Caption = 'Material Id';
            DataClassification = ToBeClassified;
        }
        field(53401; "ORB Stroage Type Id"; Integer)
        {
            Caption = 'Storage Type Id';
            TableRelation = "ORB LIFT Storage Type";
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                CalcFields("ORB Storage Type Name");
            end;
        }
        field(53402; "ORB Storage Type Name"; Text[80])
        {
            Caption = 'Storage Type Name';
            FieldClass = FlowField;
            CalcFormula = lookup("ORB LIFT Storage Type".Name where("Storage Type Id" = field("ORB Stroage Type Id")));
            Editable = false;
        }
    }

}