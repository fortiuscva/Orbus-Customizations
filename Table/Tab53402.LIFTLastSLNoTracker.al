table 53402 "ORB LIFT Last SL No Tracker"
{
    DataClassification = SystemMetadata;

    fields
    {
        field(1; "Document Type"; Enum "Sales Document Type") { }
        field(2; "Document No."; Code[20]) { }
        field(3; "Last Line No."; Integer) { }
    }

    keys
    {
        key(PK; "Document Type", "Document No.") { Clustered = true; }
    }
}