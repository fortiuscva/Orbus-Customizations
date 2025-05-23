table 52621 "ORB User Pick Zone"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "User ID"; Code[50])
        {
            DataClassification = SystemMetadata;
            TableRelation = "User Setup"."User ID";
        }

        field(2; "Location Code"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = Location;
        }

        field(3; "Zone Code"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = Zone.Code where("Location Code" = field("Location Code"));
        }
    }

    keys
    {
        key(PK; "User ID", "Location Code", "Zone Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "User ID", "Location Code", "Zone Code") { }
    }
}
