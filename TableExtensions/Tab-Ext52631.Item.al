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
            Caption = 'Material ID';
            TableRelation = "ORB LIFT Material";
            DataClassification = ToBeClassified;
            ValidateTableRelation = false;
            trigger OnValidate()
            begin
                CalcFields("ORB Material Name");
            end;
        }
        field(53401; "ORB Stroage Type Id"; Integer)
        {
            Caption = 'Storage Type ID';
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
        field(53403; "ORB Material Name"; Text[100])
        {
            Caption = 'Material Name';
            FieldClass = FlowField;
            CalcFormula = lookup("ORB LIFT Material"."Material Name" where("Material Id" = field("ORB Material Id")));
            Editable = false;
        }
        field(53404; "ORB Do Not Integrate"; Boolean)
        {
            Caption = 'Do Not Integrate';
            InitValue = true;
            DataClassification = CustomerContent;
        }
        field(53405; "ORB Has Active Variants"; Boolean)
        {
            Caption = 'Has Active Variants';
            FieldClass = FlowField;
            CalcFormula = exist("Item Variant" where("Item No." = field("No."), Blocked = const(false)));
            Editable = false;
        }
        modify("Department Dimension")
        {
            trigger OnAfterValidate()
            begin
                if "Department Dimension" <> xRec."Department Dimension" then begin
                    if "Department Dimension" = '01' then
                        Rec.Validate("ORB Stroage Type Id", 35884)
                    else
                        Rec.Validate("ORB Stroage Type Id", 0)
                end;
            end;
        }
    }

    trigger OnInsert()
    begin
        "ORB Do Not Integrate" := true;
    end;

}