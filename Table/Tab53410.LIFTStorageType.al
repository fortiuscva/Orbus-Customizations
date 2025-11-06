table 53410 "ORB LIFT Storage Type"
{
    Caption = 'LIFT Storage Types';
    LookupPageId = "ORB LIFT Storage Type List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Storage Type ID"; Integer)
        {
            Caption = 'Storage Type ID';
        }
        field(2; Name; Text[80])
        {
            Caption = 'Name';
        }
        field(3; Type; Text[80])
        {
            Caption = 'Type';
        }
        field(4; Length; Decimal)
        {
            Caption = 'Length';
        }
        field(5; Width; Decimal)
        {
            Caption = 'Width';
        }
        field(6; "Unit Of Measure"; Text[10])
        {
            Caption = 'Unit Of Measure';
        }
        field(7; Status; Text[10])
        {
            Caption = 'Status';
        }
    }
    keys
    {
        key(PK; "Storage Type ID")
        {
            Clustered = true;
        }
        key(Key2; SystemModifiedAt)
        {
        }
    }
    fieldgroups
    {
        fieldgroup(LIFTStorageType; "Storage Type ID", Name)
        {

        }
    }
}
