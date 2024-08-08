table 52614 "ORB Escalation Reasons"
{
    Caption = 'Escalation Reasons';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No';
            AutoIncrement = true;

        }

        field(2; "Escalation Reason"; Text[1024])
        {
            Caption = 'Escalation Reason';

        }
    }
    keys
    {
        key(Key1; "Entry No", "Escalation Reason")
        {
            Clustered = true;
        }
    }


}