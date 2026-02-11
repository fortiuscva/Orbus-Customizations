table 53414 "ORB LIFT ERP Item"
{
    Caption = 'LIFT ERP Item';
    LookupPageId = "ORB Lift ERP Items";
    DrillDownPageId = "ORB Lift ERP Items";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }
        field(2; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = "Item Variant";
        }
        field(5; "Product Name"; Text[128])
        {
            Caption = 'Product Name';
        }
        field(10; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(12; "Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(15; "Catalog Id"; Integer)
        {
            Caption = 'Catalog Id';
        }
        field(16; "Material Type Id"; Integer)
        {
            Caption = 'Material Type Id';
            DataClassification = CustomerContent;
        }
        field(17; "Primary Vendor Id"; Integer)
        {
            Caption = 'Primary Vendor Id';
            DataClassification = CustomerContent;
        }
        field(18; "Material Category Id"; Integer)
        {
            Caption = 'Material Category Id';
            DataClassification = CustomerContent;
        }
        field(19; "Material Subcategory Id"; Integer)
        {
            Caption = 'Material Subcategory Id';
            DataClassification = CustomerContent;
        }
        field(20; "Prod Line Dim Id"; Integer)
        {
            Caption = 'Prod Line Dim Id';
            TableRelation = "ORB LIFT Product Line Values";
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(25; "Product Type"; Text[10])
        {
            Caption = 'Product Type';
        }
        field(30; "Ship From Whse Loc Id"; Integer)
        {
            Caption = 'Ship From Whse Loc Id';
        }
        field(35; Status; Text[10])
        {
            Caption = 'Product Status';
        }
        field(40; "Material Id"; Integer)
        {
            Caption = 'Material Id';
            TableRelation = "ORB LIFT Material";
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                LiftItemLcl: Record "ORB LIFT ERP Item";
            begin
                if Rec."Variant Code" = '' then begin
                    LiftItemLcl.Reset();
                    LiftItemLcl.SetRange("Item No.", Rec."Item No.");
                    LiftItemLcl.SetFilter("Variant Code", '<>%1', '');
                    if LiftItemLcl.FindSet() then begin
                        repeat
                            LiftItemLcl.Validate("Material Id", Rec."Material Id");
                            LiftItemLcl.Modify();
                        until LiftItemLcl.Next() = 0;
                    end;
                end;
            end;
        }
        field(41; "Product Material Id"; Integer)
        {
            Caption = 'Product Material Id';
            DataClassification = CustomerContent;
        }
        field(45; "Storage Type Id"; Integer)
        {
            Caption = 'Storage Type Id';
            TableRelation = "ORB LIFT Storage Type";
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(48; "Product Id"; Integer)
        {
            Caption = 'Product Id';
            DataClassification = CustomerContent;
        }
        field(50; "Print Format"; Integer)
        {
            Caption = 'Print Format';
        }
        field(52; "Has Variants"; Boolean)
        {
            Caption = 'Has Variants';
            DataClassification = CustomerContent;
        }
        field(55; "Do Not Integrate (Material)"; Boolean)
        {
            Caption = 'Do Not Integrate (Material)';
            Editable = false;
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                LIFTMaterial: Record "ORB LIFT Material";
            begin
                Validate("Material Type Id", 121821);
                Validate("Primary Vendor Id", 57643);
                LIFTMaterial.Reset();
                LIFTMaterial.SetRange("Material Name", Rec."Item No.");
                if LIFTMaterial.FindFirst() then begin
                    Validate("Material Id", LIFTMaterial."Material Id");
                    Validate("Material Type Id", LIFTMaterial."Material Type Id");
                    Validate("Primary Vendor Id", LIFTMaterial."Primary Vendor Id");
                    Validate("Material Category Id", LIFTMaterial.Category);
                    Validate("Material Subcategory Id", LIFTMaterial."Sub Category");
                end;
            end;
        }
        field(60; "Do Not Integrate (Sellable)"; Boolean)
        {
            Caption = 'Do Not Integrate (Sellable)';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(65; "To Be Synchronized"; Boolean)
        {
            Caption = 'To Be Synchronized';
        }
    }
    keys
    {
        key(PK; "Item No.", "Variant Code")
        {
            Clustered = true;
        }
    }
}
