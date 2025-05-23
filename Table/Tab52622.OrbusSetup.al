table 52622 "ORB Orbus Setup"
{
    Caption = 'Orbus Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Enable User Pick Zone"; Boolean)
        {
            Caption = 'Enable User Pick Zone';
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
