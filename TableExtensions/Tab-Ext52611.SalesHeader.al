tableextension 52611 "ORB Sales Header" extends "Sales Header"
{
    fields
    {
        field(52610; "ORB Tax ID"; Code[20])
        {
            Caption = 'Tax ID';
            DataClassification = ToBeClassified;
        }
        field(52611; "ORB Declared Value"; Text[60])
        {
            Caption = 'Declared Value';
            DataClassification = ToBeClassified;
        }
        field(52612; "ORB International Contact"; Text[50])
        {
            Caption = 'International Contact';
            DataClassification = ToBeClassified;
        }
        field(52620; "ORB Magento Order #"; Text[20])
        {
            Caption = 'Magento Order #';
            DataClassification = ToBeClassified;
        }
        // field(52621; "ORB Magento Artwork Job ID"; Text[20])
        // {
        //     Caption = 'Magento Artwork Job ID';
        //     DataClassification = ToBeClassified;
        // }
        field(52622; "ORB Magento CC 4 Digits"; Code[4])
        {
            Caption = 'Magento CC 4 Digits';
            DataClassification = ToBeClassified;
        }
        field(52623; "ORB Magento Location Code"; Code[10])
        {
            Caption = 'Magento Location Code';
            TableRelation = Location;
            DataClassification = ToBeClassified;
        }
        field(52624; "ORB Require Review"; Boolean)
        {
            Caption = 'Require Review';
            DataClassification = ToBeClassified;
        }
    }

    trigger OnDelete()
    var
        SalesHeaderAdditionalFields: Record "Sales Header Additional Fields";
    begin
        if SalesHeaderAdditionalFields.Get(Rec."Document Type", Rec."No.") then
            SalesHeaderAdditionalFields.Delete(true);
    end;

    trigger OnAfterInsert()
    begin
        Rec.Validate("Location Code", "ORB Magento Location Code");
        Rec.Modify();
    end;
}
