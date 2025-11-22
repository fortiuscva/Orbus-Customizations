table 52617 "ORB LIFT ERP Setup"
{
    Caption = 'LIFT ERP Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Sales Orders API"; Text[1024])
        {
            Caption = 'Sales Orders API';
        }
        field(3; "Customers API"; Text[1024])
        {
            Caption = 'Customers API';
        }
        field(4; "Items API"; Text[1024])
        {
            Caption = 'Items API';
        }
        field(5; "Inventory Journal API"; Text[1024])
        {
            Caption = 'Inventory Journal API';
        }
        Field(6; "Lift ERP Integration Active"; Boolean)
        {
            Caption = 'Lift ERP Integration Active';
        }
        field(7; "JQ Error Notification Email"; Text[80])
        {
            Caption = 'JobQueue Error Notification Email';
        }

        field(15; "Inv. Pick Post. Jnl. Template"; Code[10])
        {
            Caption = 'Inv. Pick Posting Jnl. Template Name';
            TableRelation = "Item Journal Template".Name;
        }

        field(16; "Inv. Pick Post. Jnl. Batch"; Code[10])
        {
            Caption = 'Inv. Pick Posting Jnl. Batch Name';
            TableRelation = "Item Journal Batch".Name WHERE("Journal Template Name" = FIELD("Inv. Pick Post. Jnl. Template"));
        }
        field(17; "Inv. Pick Pst. Jnl. Batch(Ord)"; Code[10])
        {
            Caption = 'Inv. Pick Posting Jnl. Batch Name (Order)';
            TableRelation = "Item Journal Batch".Name WHERE("Journal Template Name" = FIELD("Inv. Pick Post. Jnl. Template"));
        }
        field(20; "SO Status API - QA"; Text[1024])
        {
            Caption = 'SO Status API - QA';
        }
        field(21; "SO Status API - Production"; Text[1024])
        {
            Caption = 'SO Status API - Production';
        }
        field(22; "API Username"; Text[1024])
        {
            Caption = 'API Username';
        }
        field(23; "API Password"; Text[1024])
        {
            Caption = 'API Password';
            ExtendedDatatype = Masked;
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
