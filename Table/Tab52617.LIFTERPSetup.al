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
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
