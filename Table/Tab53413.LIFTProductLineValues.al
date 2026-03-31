table 53413 "ORB LIFT Product Line Values"
{
    Caption = 'ORB LIFT Product Line Values';
    DataCaptionFields = VALUE_ID, VALUE;
    LookupPageId = "ORB LIFT Product Line Values";
    DrillDownPageId = "ORB LIFT Product Line Values";
    DataClassification = ToBeClassified;


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
        fieldgroup(ProdLineVal; VALUE_ID, VALUE)
        {
        }
    }
}
