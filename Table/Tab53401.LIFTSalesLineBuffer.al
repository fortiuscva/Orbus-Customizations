table 53401 "ORB LIFT Sales Line Buffer"
{
    Caption = 'LIFT Sales Line Buffer';
    ReplicateData = false;
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Enum "Sales Document Type")
        {
            Caption = 'Document Type';
        }
        field(2; "Sell-to Customer No."; Code[20])
        {
            Caption = 'Sell-to Customer No.';
            Editable = false;
            TableRelation = Customer;
        }
        field(3; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            TableRelation = "ORB LIFT Sales Order Buffer"."No." where("Document Type" = field("Document Type"));
        }
        field(4; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(5; Type; Enum "ORB LIFT Sales Line Type")
        {
            Caption = 'Type';
        }
        field(6; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(7; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location;
        }
        field(10; "Shipment Date"; Date)
        {
            Caption = 'Shipment Date';
        }
        field(15; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
        field(22; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
        }
        field(23; "Original Unit Price"; Decimal)
        {
            Caption = 'Original Unit Price';
        }
        field(27; "Line Discount %"; Decimal)
        {
            Caption = 'Line Discount %';
        }
        field(28; "Line Discount Amount"; Decimal)
        {
            Caption = 'Line Discount Amount';
        }
        field(29; "Unit Discount Amount"; Decimal)
        {
            Caption = 'Unit Discount Amount';
        }
        field(40; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        field(41; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        field(5402; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = if (Type = const(Item), "Document Type" = filter(<> "Credit Memo" & <> "Return Order")) "Item Variant".Code where("Item No." = field("No."), Blocked = const(false), "Sales Blocked" = const(false))
            else
            if (Type = const(Item), "Document Type" = filter("Credit Memo" | "Return Order")) "Item Variant".Code where("Item No." = field("No."), Blocked = const(false));
        }
        field(5407; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
        }
        field(5790; "Requested Delivery Date"; Date)
        {
            Caption = 'Requested Delivery Date';
        }
        field(5791; "Promised Delivery Date"; Date)
        {
            Caption = 'Promised Delivery Date';
        }
        field(5794; "Planned Delivery Date"; Date)
        {
            Caption = 'Planned Delivery Date';
        }
        field(5795; "Planned Shipment Date"; Date)
        {
            Caption = 'Planned Shipment Date';
        }
        field(50120; Width; Decimal)
        {
            Caption = 'Width';
        }
        field(50121; Height; Decimal)
        {
            Caption = 'Height';
        }
        field(53402; "ORB LIFT Step No."; Code[10])
        {
            Caption = 'LIFT Step No.';
            TableRelation = "ORB LIFT Subway Map Steps";
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(60100; "Hardware Price"; Decimal)
        {
            Caption = 'Hardware Price';
        }
        field(60101; "Graphics Price"; Decimal)
        {
            Caption = 'Graphics Price';
        }
        field(60102; "LIFT Line ID"; Decimal)
        {
            Caption = 'LIFT Line ID';
            DecimalPlaces = 0 : 2;
            DataClassification = CustomerContent;
        }
        field(60103; "ORB LIFT Status"; Integer)
        {
            Caption = 'LIFT Status';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Document Type", "Document No.", "LIFT Line ID")
        {
            Clustered = true;
        }
    }
}
