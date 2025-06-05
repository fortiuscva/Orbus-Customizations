table 53402 "ORB LIFT Customer Buffer"
{
    Caption = 'LIFT Customer Buffer';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(5; Address; Text[100])
        {
            Caption = 'Address';
            DataClassification = CustomerContent;
        }
        field(7; City; Text[30])
        {
            Caption = 'City';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(8; Contact; Text[100])
        {
            Caption = 'Contact';
            DataClassification = CustomerContent;
        }
        field(9; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            DataClassification = CustomerContent;
        }
        field(12; "Ship-to Code"; Code[10])
        {
            Caption = 'Ship-to Code';
            TableRelation = "Ship-to Address".Code where("Customer No." = field("No."));
            DataClassification = CustomerContent;
        }
        field(20; "Credit Limit (LCY)"; Decimal)
        {
            Caption = 'Credit Limit (LCY)';
            DataClassification = CustomerContent;
        }
        field(21; "Customer Posting Group"; Code[20])
        {
            Caption = 'Customer Posting Group';
            TableRelation = "Customer Posting Group";
            DataClassification = CustomerContent;
        }
        field(22; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;

            trigger OnValidate()
            begin
                UpdateCurrencyId();
            end;
        }
        field(23; "Customer Price Group"; Code[10])
        {
            Caption = 'Customer Price Group';
            DataClassification = CustomerContent;
            TableRelation = "Customer Price Group";
        }
        field(27; "Payment Terms Code"; Code[10])
        {
            Caption = 'Payment Terms Code';
            TableRelation = "Payment Terms";
            DataClassification = CustomerContent;
        }
        field(29; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser" where(Blocked = const(false));
            DataClassification = CustomerContent;
        }
        field(35; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
            DataClassification = CustomerContent;
        }
        field(39; Blocked; Enum "Customer Blocked")
        {
            Caption = 'Blocked';
            DataClassification = CustomerContent;
        }
        field(47; "Payment Method Code"; Code[10])
        {
            Caption = 'Payment Method Code';
            TableRelation = "Payment Method";
            DataClassification = CustomerContent;
        }
        field(54; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            DataClassification = CustomerContent;
        }
        field(91; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code"
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code" where("Country/Region Code" = field("Country/Region Code"));
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(92; County; Text[30])
        {
            Caption = 'County';
            DataClassification = CustomerContent;
        }
        field(102; "E-Mail"; Text[80])
        {
            Caption = 'E-Mail';
            DataClassification = CustomerContent;
        }
        field(109; "Tax Liable"; Boolean)
        {
            Caption = 'Tax Liable';
            DataClassification = CustomerContent;
        }
        field(8001; "Currency Id"; Guid)
        {
            Caption = 'Currency Id';
            TableRelation = Currency.SystemId;
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                UpdateCurrencyCode();
            end;
        }
        field(9005; "Contact ID"; Guid)
        {
            Caption = 'Contact ID';
            DataClassification = CustomerContent;
        }
        field(50124; Needs_Approval; Enum "ORBAPP Cust Needs Approval")
        {
            Caption = 'Needs_Approval';
            DataClassification = CustomerContent;
        }
        field(50127; "Magento ID"; Code[20])
        {
            Caption = 'Magento ID';
            DataClassification = CustomerContent;
        }
        field(50128; ORBAPPAssociationsName; Text[250])
        {
            Caption = 'ORBAPPAssociationsName';
            TableRelation = "ORBAPP Associations";
            DataClassification = CustomerContent;
        }
        field(52602; "ORB Regional Sales Executive"; Code[20])
        {
            Caption = 'ORB Regional Sales Executive';
            TableRelation = "Salesperson/Purchaser" where(Blocked = const(false));
            DataClassification = CustomerContent;
        }
        field(52603; "ORB Customer Support"; Code[20])
        {
            Caption = 'ORB Customer Support';
            TableRelation = "Salesperson/Purchaser" where(Blocked = const(false));
            DataClassification = CustomerContent;
        }
        field(52604; "ORB Business Development"; Code[20])
        {
            Caption = 'ORB Business Development';
            TableRelation = "Salesperson/Purchaser" where(Blocked = const(false));
            DataClassification = CustomerContent;
        }
        field(52610; "ORB LIFT Customer"; Boolean)
        {
            Caption = 'ORB LIFT Customer';
            DataClassification = CustomerContent;
        }
        field(52622; "ORB Customer Approval Status"; Option)
        {
            Caption = 'Approval Status';
            OptionMembers = PENDING,APPROVED;
            DataClassification = CustomerContent;
        }
        field(54100; "First Invoice Date"; Date)
        {
            Caption = 'First Invoice Date';
            DataClassification = CustomerContent;
        }
        field(55101; "Magento Contact No."; Text[100])
        {
            Caption = 'Magento Contact No.';
            DataClassification = CustomerContent;
        }
        field(55102; "Magento Contact Name"; Text[100])
        {
            Caption = 'Magento Contact Name';
            DataClassification = CustomerContent;
        }
        field(55103; "Magento Contact Email"; Text[100])
        {
            Caption = 'Magento Contact Email';
            DataClassification = CustomerContent;
        }
        field(55104; "Last Invoice Date"; Date)
        {
            Caption = 'Last Invoice Date';
            DataClassification = CustomerContent;
        }
        field(60306; "Needs Magento ID"; Boolean)
        {
            Caption = 'Needs Magento ID';
            DataClassification = CustomerContent;
        }
        field(60307; "Last Visit Date"; Date)
        {
            Caption = 'Last Visit Date';
            DataClassification = CustomerContent;
        }
        field(60309; International; Enum TrueFalse2)
        {
            Caption = 'International';
            DataClassification = CustomerContent;
        }
        field(60310; Channel; Code[20])
        {
            Caption = 'Channel';
            DataClassification = CustomerContent;
        }
        field(60311; Industry; Code[20])
        {
            Caption = 'Industry';
            DataClassification = CustomerContent;
        }
        field(60312; CustomerType; Text[50])
        {
            Caption = 'CustomerType';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    procedure UpdateCurrencyId()
    var
        Currency: Record Currency;
    begin
        if "Currency Code" = '' then begin
            Clear("Currency Id");
            exit;
        end;

        if not Currency.Get("Currency Code") then
            exit;

        "Currency Id" := Currency.SystemId;
    end;

    local procedure UpdateCurrencyCode()
    var
        Currency: Record Currency;
    begin
        if not IsNullGuid("Currency Id") then
            Currency.GetBySystemId("Currency Id");

        Validate("Currency Code", Currency.Code);
    end;
}
