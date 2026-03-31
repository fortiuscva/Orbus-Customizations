table 53413 "ORB LIFT Product Line Values"
{
    Caption = 'ORB LIFT Product Line Values';
    DataCaptionFields = VALUE_ID, VALUE;
    DrillDownPageId = "ORB LIFT Product Line Values";
    LookupPageId = "ORB LIFT Product Line Values";
    DataClassification = CustomerContent;


    fields
    {
        field(1; VALUE_ID; Integer)
        {
            Caption = 'VALUE_ID';
            DataClassification = CustomerContent;
        }
        field(2; VALUE; Text[250])
        {
            Caption = 'VALUE';
            DataClassification = CustomerContent;
        }
        field(3; "Product Line Dimension"; Text[20])
        {
            Caption = 'Product Line Dimension';
            DataClassification = CustomerContent;
        }
        field(4; "Category Id"; Integer)
        {
            Caption = 'Material Category Id';
            DataClassification = CustomerContent;
        }
        field(5; "Subcategory Id"; Integer)
        {
            Caption = 'Material Subcategory Id';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; VALUE_ID)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; VALUE_ID, VALUE)
        {
        }
    }
}
