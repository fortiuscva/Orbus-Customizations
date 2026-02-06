tableextension 53409 "ORB Item Templ." extends "Item Templ."
{

    fields
    {
        field(53408; "ORB Family Dimension"; Text[20])
        {
            Caption = 'Family Dimension';
            DataClassification = CustomerContent;
            TableRelation = "Dimension Value".Code where("Dimension Code" = filter('PRDFAM'));
            ValidateTableRelation = true;
        }
        // field(55102; "ORB Department Dimension"; Text[20])
        // {
        //     CAption = 'Department Dimension';
        //     DataClassification = CustomerContent;
        // }
    }
}