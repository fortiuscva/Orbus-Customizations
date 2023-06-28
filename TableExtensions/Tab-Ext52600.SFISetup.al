tableextension 52600 "ORB SFI Setup" extends "SFI Setup"
{
    fields
    {
        field(52600; "ORB IWX Auto Post Output"; Option)
        {
            Caption = 'Auto-Post Output Journals';
            DataClassification = CustomerContent;
            OptionMembers = "Yes - Auto-Post Output Journal","No - Do not auto-post output journal";// ordered this way so that everything is 
        }
        field(52601; "ORB IWX Auto Post Consumption"; Option)
        {
            Caption = 'Auto-Post Consupmption Journals';
            DataClassification = CustomerContent;
            OptionMembers = "Yes - Auto-Post Consumption Journal","No - Do not auto-post consumption journal";// ordered this way so that everything is 
        }
    }
}