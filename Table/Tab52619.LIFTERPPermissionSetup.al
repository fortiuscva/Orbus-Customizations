table 52619 "ORB LIFT ERP Permission Setup"
{
    Caption = 'LIFT ERP Permission Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = ToBeClassified;
            NotBlank = true;
            TableRelation = User."User Name";
            ValidateTableRelation = false;

            trigger OnValidate()
            var
                UserSelection: Codeunit "User Selection";
            begin
                UserSelection.ValidateUserName("User ID");
            end;
        }
        field(2; "Get Customers"; Boolean)
        {
            Caption = 'Get Customers';
            DataClassification = ToBeClassified;
        }
        field(3; "Get Sales Orders"; Boolean)
        {
            Caption = 'Get Sales Orders';
            DataClassification = ToBeClassified;
        }
        field(4; "Get Whse. Journal"; Boolean)
        {
            Caption = 'Get Whse. Journal';
            DataClassification = ToBeClassified;
        }
        field(5; "Roll Up Cost on Item Journals"; Boolean)
        {
            Caption = 'Roll Up Cost on Item Journals';
            DataClassification = ToBeClassified;
        }
        field(6; "Calc. LIFT Whse. Adjustment"; Boolean)
        {
            Caption = 'Calculate LIFT Warehouse Adjustments';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "User ID")
        {
            Clustered = true;
        }
    }
}
