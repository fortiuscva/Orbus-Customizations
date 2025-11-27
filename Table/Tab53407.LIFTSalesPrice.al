table 53407 "ORB LIFT Sales Price"
{
    Caption = 'ORB LIFT Sales Price';
    LookupPageId = "ORB LIFT Sales Price List";
    DrillDownPageId = "ORB LIFT Sales Price List";
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            NotBlank = true;
            TableRelation = Item;
        }
        field(2; "Sales Code"; Code[20])
        {
            Caption = 'Sales Code';
            TableRelation = if ("Sales Type" = const("Customer Price Group")) "Customer Price Group"
            else
            if ("Sales Type" = const(Customer)) Customer
            else
            if ("Sales Type" = const(Campaign)) Campaign;
        }
        field(3; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(4; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(5; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            MinValue = 0;
        }
        field(7; "Price Includes VAT"; Boolean)
        {
            Caption = 'Price Includes VAT';
        }
        field(10; "Allow Invoice Disc."; Boolean)
        {
            Caption = 'Allow Invoice Disc.';
        }
        field(11; "VAT Bus. Posting Gr. (Price)"; Code[20])
        {
            Caption = 'VAT Bus. Posting Gr. (Price)';
            TableRelation = "VAT Business Posting Group";
        }
        field(13; "Sales Type"; Enum "Sales Price Type")
        {
            Caption = 'Sales Type';
        }
        field(14; "Minimum Quantity"; Decimal)
        {
            Caption = 'Minimum Quantity';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(15; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
        }
        field(5400; "Unit Of Measure Code"; Code[10])
        {
            Caption = 'Unit Of Measure Code';
            TableRelation = "Item Unit of Measure".Code where("Item No." = field("Item No."));
        }
        field(5700; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            TableRelation = "Item Variant".Code where("Item No." = field("Item No."));
        }
        field(7001; "Allow Line Disc."; Boolean)
        {
            Caption = 'Allow Line Disc.';
        }
        field(53400; "ORB LIFT Status"; Code[1])
        {
            Caption = 'Status';
        }
        field(53401; "ORB LIFT Maximum Quantity"; Decimal)
        {
            Caption = 'Maximum Quantity';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(53402; "To Be Processed"; Boolean)
        {
            Caption = 'To Be Processed';
            Description = 'This field had can used if we have to process entries in batches.';
            DataClassification = CustomerContent;
        }
        field(53403; "Sent to Celigo"; Boolean)
        {
            Caption = 'Sent to Celigo';
            Description = 'This field will be used to identify if the record is picked from Celigo';
            DataClassification = CustomerContent;
        }

    }
    keys
    {
        key(Key1; "Item No.", "Sales Type", "Sales Code", "Starting Date", "Currency Code", "Variant Code", "Unit of Measure Code", "Minimum Quantity")
        {
            Clustered = true;
        }
        key(Key2; "Sales Type", "Sales Code", "Item No.", "Starting Date", "Currency Code", "Variant Code", "Unit of Measure Code", "Minimum Quantity")
        {
        }
        key(Key3; SystemModifiedAt)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(Brick; "Sales Type", "Sales Code", "Item No.", "Starting Date", "Unit Price", "Ending Date")
        {
        }
    }
}
