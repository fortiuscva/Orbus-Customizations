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
            ValidateTableRelation = false;
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
            Caption = 'Do Not Integrate (Material)';
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
        field(53408; "ORB Family Dimension"; Text[20])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = filter('PRDFAM'));
            ValidateTableRelation = true;
            trigger OnValidate()
            var
                DefaultDimension: Record "Default Dimension";
            begin
                DefaultDimension.Reset();
                DefaultDimension.SetRange("No.", Rec."No.");
                DefaultDimension.SetFilter("Dimension Code", 'PRDFAM');
                if DefaultDimension.FindFirst() then begin
                    DefaultDimension."Dimension Value Code" := Rec."ORB Family Dimension";
                    DefaultDimension.Modify();
                end else begin
                    DefaultDimension.Init();
                    DefaultDimension."Dimension Code" := 'PRDFAM';
                    DefaultDimension."Table ID" := 27;
                    DefaultDimension."No." := Rec."No.";
                    DefaultDimension."Parent Type" := DefaultDimension."Parent Type"::Item;
                    DefaultDimension."Dimension Value Code" := Rec."ORB Family Dimension";
                    DefaultDimension.Insert();
                end;
            end;
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
        field(53406; "ORB Parent Item No."; Code[20])
        {
            Caption = 'Parent Item No.';
            FieldClass = FlowField;
            CalcFormula = lookup("BOM Component"."Parent Item No." where("No." = field("No.")));
            Editable = false;
        }
        field(53407; "ORB Product Id"; Integer)
        {
            Caption = 'Product ID';
            DataClassification = CustomerContent;
        }
        field(53409; "ORB Do Not Integrate (Sell)"; Boolean)
        {
            Caption = 'Do Not Integrate (Sellable)';
            DataClassification = CustomerContent;
        }
        field(53411; "ORB Ship From Warehouse"; Code[10])
        {
            Caption = 'Ship From Warehouse';
            TableRelation = Location;
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                LocationRec: Record Location;
            begin
                if "ORB Ship From Warehouse" <> xRec."ORB Ship From Warehouse" then begin
                    if "ORB Ship From Warehouse" <> '' then begin
                        LocationRec.Get("ORB Ship From Warehouse");
                        Validate("ORB Warehouse Location Id", LocationRec."ORB Warehouse Location Id");
                    end else
                        Validate("ORB Warehouse Location Id", 0);
                end;
            end;
        }
        field(53412; "ORB Warehouse Location Id"; Integer)
        {
            Caption = 'Warehouse Location Id';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(53415; "ORB Product Line Dimension Id"; Integer)
        {
            Caption = 'Product Line Dimension Id';
            TableRelation = "ORB LIFT Product Line Values";
            DataClassification = CustomerContent;
        }
        field(53418; "ORB Product Type"; Text[10])
        {
            Caption = 'Product Type';
            DataClassification = CustomerContent;
        }
        field(53420; "ORB Status"; Text[1])
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
        modify("Sales Blocked")
        {
            trigger OnAfterValidate()
            begin
                if "Sales Blocked" then
                    "ORB Status" := 'I'
                else
                    "ORB Status" := 'A';
            end;
        }
        field(53421; "ORB Print Format"; Integer)
        {
            Caption = 'Print Format';
            DataClassification = CustomerContent;
        }
    }

    trigger OnInsert()
    begin
        "ORB Do Not Integrate" := true;
        "ORB Do Not Integrate (Sell)" := true;
    end;

}