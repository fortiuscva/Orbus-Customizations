tableextension 53402 "ORB LIFT Sales Price" extends "Sales Price"
{
    fields
    {
        field(53400; "ORB To Be Exported"; Boolean)
        {
            Caption = 'To Be Exported';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(Key4; "Starting Date", "Ending Date")
        {
        }
    }
}
