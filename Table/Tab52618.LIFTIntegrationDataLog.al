table 52618 "ORB LIFT Integration Data Log"
{
    Caption = 'LIFT Integration Data Log';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Source Type"; Integer)
        {
            Caption = 'Source Type';
        }
        field(3; "Source Subtype"; Option)
        {
            Caption = 'Source Subtype';
            OptionCaption = '0,1,2,3,4,5,6,7,8,9,10';
            OptionMembers = "0","1","2","3","4","5","6","7","8","9","10";
        }
        field(4; "Source No."; Code[20])
        {
            Caption = 'Source No.';
        }
        field(5; "Source Line No."; Integer)
        {
            Caption = 'Source Line No.';
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        Key(Pk2; "Source Type", "Source Subtype", "Source No.")
        {

        }
    }
}
