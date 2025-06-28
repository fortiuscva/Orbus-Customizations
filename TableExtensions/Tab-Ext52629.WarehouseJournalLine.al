tableextension 52629 "ORB Warehouse Journal Line" extends "Warehouse Journal Line"
{
    fields
    {
        field(52600; "ORB LIFT Inv. Transaction ID"; Integer)
        {
            Caption = 'LIFT Inv. Transaction ID';
            DataClassification = ToBeClassified;
        }
        field(52601; "ORB LIFT Order Line ID"; Integer)
        {
            Caption = 'LIFT Order Line ID';
            DataClassification = ToBeClassified;
        }
        field(52602; "ORB LIFT Material"; Text[100])
        {
            Caption = 'LIFT Material';
            DataClassification = ToBeClassified;
        }
        field(52603; "ORB LIFT Storage Type"; Text[100])
        {
            Caption = 'LIFT Storage Type';
            DataClassification = ToBeClassified;
        }
        field(52604; "ORB LIFT Material SKU"; Text[100])
        {
            Caption = 'LIFT Material SKU';
            DataClassification = ToBeClassified;
        }
        field(52605; "ORB LIFT Transaction Type"; Code[10])
        {
            Caption = 'LIFT Transaction Type';
            DataClassification = ToBeClassified;
        }
        field(52606; "ORB LIFT Unit Cost"; Decimal)
        {
            Caption = 'LIFT Unit Cost';
            DataClassification = ToBeClassified;
        }
        field(52607; "ORB LIFT Posting Date"; Date)
        {
            Caption = 'LIFT Posting Date';
            DataClassification = ToBeClassified;
        }
        field(52608; "ORB Shortcut Dimension 1 Code"; Code[10])
        {
            Caption = 'LIFT Shortcut Dimension 1 Code';
            DataClassification = ToBeClassified;
        }
        field(52609; "ORB Shortcut Dimension 2 Code"; Code[10])
        {
            Caption = 'LIFT Shortcut Dimension 2 Code';
            DataClassification = ToBeClassified;
        }
        field(52610; "ORB LIFT Line No."; Decimal)
        {
            Caption = 'LIFT Line No.';
            DataClassification = ToBeClassified;
        }
    }
}
