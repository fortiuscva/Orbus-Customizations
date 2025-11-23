table 52622 "ORB Orbus Setup"
{
    Caption = 'Orbus Setup';
    DataClassification = CustomerContent;

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
        field(3; "Enable Auto Address Validation"; Boolean)
        {
            Caption = 'Enable Auto Address Validation On Sales Order Release';
            DataClassification = CustomerContent;
        }
        field(6; "Enable Auto Print Pick"; Boolean)
        {
            Caption = 'Enable Auto Print Pick';
        }
        field(4; "Last Sync DateTime"; DateTime)
        {
            Caption = 'Price Last Sync DateTime';
            DataClassification = CustomerContent;
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
