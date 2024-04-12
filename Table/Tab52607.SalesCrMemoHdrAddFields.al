table 52607 "Sales Cr.Memo Hdr Add. Fields"
{
    Caption = 'Sales Cr.Memo Hdr Add. Fields';
    DataClassification = CustomerContent;

    fields
    {
        field(3; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(52600; "Direct to show Label"; Text[200])
        {
            Caption = 'Direct to show Label';
        }
        field(52601; "Production timeline"; Text[200])
        {
            Caption = 'Production timeline';
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
