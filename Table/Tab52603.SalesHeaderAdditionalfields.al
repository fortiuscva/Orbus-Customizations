table 52603 "Sales Header Additional Fields"
{
    Caption = 'Sales Header Additional Fields';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Enum "Sales Document Type")
        {
            Caption = 'Document Type';
        }
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
        field(52602; "ORB Payment Type"; Option)
        {
            OptionMembers = " ",Sender,THIRD_PARTY,RECEIVER,COLLECT;
            Caption = 'Payment Type';
        }
        field(52603; "ORB Payment Account No."; Text[100])
        {
            Caption = 'Payment Account No.';
        }
        field(52604; "ORB Payment Province"; Code[50])
        {
            Caption = 'Payment State';
        }
        field(52605; "ORB Payment Postal Code"; Code[50])
        {
            Caption = 'Payment Zip';
        }
        field(52606; "ORB Payment Country Code"; Code[50])
        {
            Caption = 'Payment Country';
        }
    }
    keys
    {
        key(PK; "Document Type", "No.")
        {
            Clustered = true;
        }
    }
}
