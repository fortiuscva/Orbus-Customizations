tableextension 52631 "ORB Item" extends Item
{
    fields
    {
        field(52600; "ORB Master Qty. Count"; Integer)
        {
            Caption = 'Master Quantity Count';
            DataClassification = ToBeClassified;
        }
        field(52601; "ORB Bagging Quantity"; Integer)
        {
            Caption = 'Bagging Quantity Count';
            DataClassification = ToBeClassified;
        }
        field(53400; "ORB Material Id"; Integer)
        {
            Caption = 'Material Id';
            DataClassification = ToBeClassified;
        }
        field(53401; "ORB Stroage Type Id"; Integer)
        {
            Caption = 'Stroage Type Id';
            DataClassification = ToBeClassified;
        }
    }

}