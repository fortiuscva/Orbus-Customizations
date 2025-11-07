table 53411 "ORB LIFT Material"
{
    Caption = 'ORB LIFT Material';
    LookupPageId = "ORB LIFT Materials";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Material Id"; Integer)
        {
            Caption = 'Material Id';
            DataClassification = CustomerContent;
        }
        field(2; "Material Name"; Text[100])
        {
            Caption = 'Material Name';
            DataClassification = CustomerContent;
        }
        field(3; Description; Text[256])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(4; "MFG Profile Id"; Integer)
        {
            Caption = 'MFG Profile Id';
            DataClassification = CustomerContent;
        }
        field(5; "Material Type Id"; Integer)
        {
            Caption = 'Material Type Id';
            DataClassification = CustomerContent;
        }
        field(6; "Primary Vendor Id"; Integer)
        {
            Caption = 'Primary Vendor Id';
            DataClassification = CustomerContent;
        }
        field(7; Status; Text[1])
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
        field(8; Category; Integer)
        {
            Caption = 'Category';
            DataClassification = CustomerContent;
        }
        field(9; "Sub Category"; Integer)
        {
            Caption = 'Sub Category';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Material Id")
        {
            Clustered = true;
        }
        key(Key2; SystemModifiedAt)
        {
        }
    }
    fieldgroups
    {
        fieldgroup(LIFTMaterial; "Material Id", "Material Name")
        {

        }
    }
}
