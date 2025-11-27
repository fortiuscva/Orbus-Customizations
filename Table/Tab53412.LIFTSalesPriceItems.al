table 53412 "ORB LIFT Sales Price Items"
{
    Caption = 'LIFT Sales Price Items';
    DataClassification = CustomerContent;
    DrillDownPageId = "ORB LIFT SP Items";
    LookupPageId = "ORB LIFT SP Items";

    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.';
        }
        field(10; Processed; Boolean)
        {
            Caption = 'Processed';
        }
        field(15; "Price Lines"; Integer)
        {
            Caption = 'Price Lines';
            FieldClass = FlowField;
            CalcFormula = count("ORB LIFT Sales Price" where("Item No." = field("Item No.")));
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Item No.")
        {
            Clustered = true;
        }
        key(Key2; Processed)
        {
            Clustered = false;
        }
    }
}
