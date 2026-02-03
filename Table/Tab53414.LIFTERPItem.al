table 53414 "ORB LIFT ERP Item"
{
    Caption = 'LIFT ERP Item';
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
        field(15; "Catalog Id"; Integer)
        {
            Caption = 'Catalog Id';
        }
        field(20; "Prod Line Dim Id"; Integer)
        {
            Caption = 'Prod Line Dim Id';
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
            Caption = 'Status';
        }
        field(40; "Material Id"; Integer)
        {
            Caption = 'Material Id';
        }
        field(45; "Storage Type Id"; Integer)
        {
            Caption = 'Storage Type Id';
        }
        field(50; "Print Format"; Integer)
        {
            Caption = 'Print Format';
        }
        field(55; "Do Not Integrate Material"; Boolean)
        {
            Caption = 'Do Not Integate (Material)';
        }
        field(60; "Do Not Integrate Sellable"; Boolean)
        {
            Caption = 'Do Not Integate (Sellable)';
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
