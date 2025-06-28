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
        field(6; "Item No."; Code[20])
        {
            Caption = 'Item No.';
        }
        field(10; "Transaction ID"; Integer)
        {
            Caption = 'Transaction ID';
        }
        field(11; "Entry Type"; Option)
        {
            Caption = 'Entry Type';
            OptionCaption = 'Negative Adjmt.,Positive Adjmt.,Movement';
            OptionMembers = "Negative Adjmt.","Positive Adjmt.",Movement;
        }
        field(12; Material; Text[100])
        {
            Caption = 'Material';
        }
        field(13; "Storage Type"; Text[100])
        {
            Caption = 'Storage Type';
        }
        field(14; "Transaction Type"; Code[10])
        {
            Caption = 'Transaction Type';
        }
        field(15; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
        field(16; "Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
        }
        field(17; "Unit Of Measure"; Code[10])
        {
            Caption = 'Unit Of Measure';
        }
        field(18; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(19; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
        }
        field(20; "Shortcut Dimension 1 Code"; Code[10])
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        field(21; "Shortcut Dimension 2 Code"; Code[10])
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        field(22; "LIFT Line No."; Decimal)
        {
            Caption = 'LIFT Line No.';
        }
        field(23; "Material SKU"; Text[100])
        {
            Caption = 'Material SKU';
            DataClassification = ToBeClassified;
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
        Key(Pk3; "Transaction ID")
        {

        }
    }
}
