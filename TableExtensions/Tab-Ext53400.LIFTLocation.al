tableextension 53400 "ORB LIFT Location" extends Location
{
    fields
    {
        field(52600; "ORB Pick Report Printer"; Text[250])
        {
            Caption = 'Pick Report Printer';
            DataClassification = CustomerContent;
            TableRelation = Printer.ID;
        }
        field(53400; "ORB Location Id"; Integer)
        {
            Caption = 'Location Id';
            DataClassification = ToBeClassified;
        }
        field(53401; "ORB Warehouse Location Id"; Integer)
        {
            Caption = 'Warehouse Location Id';
            DataClassification = CustomerContent;
        }
    }
}
