table 52614 "ORB Escalation Reason Codes"
{
    Caption = 'Escalation Reason Codes';
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
    begin
        if not Confirm(DeleteConfirmMsgLbl, false) then
            error(ProcessInterruptedMsgLbl);
    end;

    var
        DeleteConfirmMsgLbl: Label 'Do you want to delete?';
        ProcessInterruptedMsgLbl: Label 'Process interrupted to respect the warning';


}