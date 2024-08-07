table 52614 "ORB Escalation Reasons"
{
    Caption = 'Escalation Reasons';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }
    trigger OnDelete()
    var
        DeleteconfirmFlag: Boolean;
    begin
        DeleteconfirmFlag := Dialog.Confirm('Are you sure you want delete?');
    end;


}