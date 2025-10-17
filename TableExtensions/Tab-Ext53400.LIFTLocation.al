tableextension 53400 "ORB LIFT Location" extends Location
{
    fields
    {
        field(52600; "ORB Pick Report Printer"; Text[250])
        {
            Caption = 'Pick Report Printer';
            DataClassification = CustomerContent;
            TableRelation = "Printer Selection"."Printer Name";
        }
        field(53400; "ORB Location Id"; Integer)
        {
            Caption = 'Location Id';
            DataClassification = ToBeClassified;
        }
    }
}
