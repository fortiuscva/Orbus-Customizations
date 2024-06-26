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
        SalesHeaderAdditionalFields: Record "ORB Sales Header Add. Fields";
    begin
        if SalesHeaderAdditionalFields.Get(Rec."Document Type", Rec."No.") then
            SalesHeaderAdditionalFields.Delete(true);
    end;

    trigger OnAfterInsert()
    var
        contactRecLcl: Record Contact;
    begin
        if GuiAllowed then
            exit;
        if "ORB Magento Location Code" <> '' then
            Rec.Validate("Location Code", "ORB Magento Location Code");
        if "Sell-To Contact No. (Custom)" <> '' then begin
            contactRecLcl.SetRange("No.", "Sell-To Contact No. (Custom)");
            if contactRecLcl.FindFirst() then begin
                Rec."Sell-To Contact No. (Custom)" := contactRecLcl."No.";
                Rec."Sell-to Contact No." := contactRecLcl."No.";
                Rec."Sell-To Email (Custom)" := contactRecLcl."E-Mail";
                Rec."Sell-to E-Mail" := contactRecLcl."E-Mail";
                Rec."Sell-To Phone No. (Custom)" := contactRecLcl."Phone No.";
                Rec."Sell-to Phone No." := contactRecLcl."Phone No.";
                Rec."Sell-To Contact Name (Custom)" := contactRecLcl.Name;
                Rec."Sell-to Contact" := contactRecLcl.Name;
                Rec."Bill-to Contact No." := contactRecLcl."No.";
                Rec."Bill-to Contact" := contactRecLcl.Name;
                Rec."Ship-to Contact" := contactRecLcl.Name;
            end;
        end;
        Rec.Modify();
    end;
}
