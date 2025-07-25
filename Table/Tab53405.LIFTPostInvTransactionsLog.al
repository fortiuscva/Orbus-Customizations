table 53405 "LIFT Post Inv Transactions Log"
{
    Caption = 'LIFT Post Inv Transactions Log';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
        }
        field(2; "Process ID"; Integer)
        {
            Caption = 'Process ID';
            DataClassification = CustomerContent;
        }
        field(3; "Process Description"; Text[100])
        {
            Caption = 'Process Description';
            DataClassification = CustomerContent;
        }
        field(4; "Start Date & Time"; DateTime)
        {
            Caption = 'Start Date & Time';
            DataClassification = CustomerContent;
        }
        field(5; "Error Message"; Text[250])
        {
            Caption = 'Error Message';
            DataClassification = CustomerContent;
        }
        field(6; "End Date & Time"; DateTime)
        {
            Caption = 'End Date & Time';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
