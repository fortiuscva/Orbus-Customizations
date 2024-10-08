table 52604 "ORB Sales Hdr. Arch. Add. Flds"
{
    Caption = 'Sales Header Arch. Additional Fields';
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
        field(5047; "Version No."; Integer)
        {
            Caption = 'Version No.';
        }
        field(5048; "Doc. No. Occurrence"; Integer)
        {
            Caption = 'Doc. No. Occurrence';
        }

        field(52600; "Direct to show Label"; Text[200])
        {
            Caption = 'Direct to show Label';
        }
        field(52601; "Production timeline"; Text[200])
        {
            Caption = 'Production timeline';
        }
        field(52602; "Payment Type"; Option)
        {
            OptionMembers = " ",Sender,THIRD_PARTY,RECEIVER,COLLECT;
            Caption = 'Payment Type';
        }
        field(52603; "Payment Account No."; Text[100])
        {
            Caption = 'Payment Account No.';
        }
        field(52604; "Payment Province"; Code[50])
        {
            Caption = 'Payment State';
        }
        field(52605; "Payment Postal Code"; Code[50])
        {
            Caption = 'Payment Zip';
        }
        field(52606; "Payment Country Code"; Code[50])
        {
            Caption = 'Payment Country';
        }
        field(52607; "Job URL"; text[200])
        {
            Caption = 'Job URL';
        }
        field(52610; "Polaraid URL"; Text[500])
        {
            Caption = 'Polaraid URL';
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
