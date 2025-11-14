tableextension 53401 "ORB Item Variant" extends "Item Variant"
{
    fields
    {
        field(53400; "ORB Material Id"; Integer)
        {
            Caption = 'ORB Material Id';
            // TableRelation = "ORB LIFT Material";
            FieldClass = FlowField;
            CalcFormula = lookup(Item."ORB Material Id" where("No." = field("Item No.")));
            Editable = false;
            // DataClassification = CustomerContent;
            // trigger OnValidate()
            // begin
            //     CalcFields("ORB Material Name");
            // end;
        }
        field(53401; "ORB Storage Type Id"; Integer)
        {
            Caption = 'ORB Storage Type Id';
            TableRelation = "ORB LIFT Storage Type";
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                CalcFields("ORB Storage Type Name");
            end;
        }
        field(53402; "ORB Storage Type Name"; Text[80])
        {
            Caption = 'Storage Type Name';
            FieldClass = FlowField;
            CalcFormula = lookup("ORB LIFT Storage Type".Name where("Storage Type Id" = field("ORB Storage Type Id")));
            Editable = false;
        }
        /*
        field(53403; "ORB Material Name"; Text[100])
        {
            Caption = 'Material Name';
            FieldClass = FlowField;
            CalcFormula = lookup("ORB LIFT Material"."Material Name" where("Material Id" = field("ORB Material Id")));
            Editable = false;
        }
        */
        field(53404; "ORB Do Not Integrate"; Boolean)
        {
            Caption = 'Do Not Integrate';
            InitValue = true;
            DataClassification = CustomerContent;
        }
        field(53405; "ORB Department Dimension"; Text[20])
        {
            Caption = 'Department Dimension';
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Department Dimension" where("No." = field("Item No.")));
            Editable = false;
        }
    }
    trigger OnInsert()
    var
        LIFTStorageType: Record "ORB LIFT Storage Type";
    begin
        LIFTStorageType.Reset();
        LIFTStorageType.SetRange(Name, Rec.Code);
        if LIFTStorageType.FindFirst() then begin
            Rec.Validate("ORB Storage Type Id", LIFTStorageType."Storage Type ID");
            Rec.Modify(true);
        end;
    end;

    trigger OnRename()
    var
        LIFTStorageType: Record "ORB LIFT Storage Type";
    begin
        LIFTStorageType.Reset();
        LIFTStorageType.SetRange(Name, Rec.Code);
        if LIFTStorageType.FindFirst() then begin
            Rec.Validate("ORB Storage Type Id", LIFTStorageType."Storage Type ID");
            Rec.Modify(true);
        end;
    end;
}
