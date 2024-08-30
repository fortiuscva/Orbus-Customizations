tableextension 52622 "ORB IWX LP Header" extends "IWX LP Header"
{
    fields
    {
        field(52600; "ORB Payment Type"; Option)
        {
            Caption = 'Payment Type';
            DataClassification = CustomerContent;
            OptionCaption = 'None,Sender,Third Party,Receiver,Collect';
            OptionMembers = "None","Sender","Third Party","Receiver","Collect";
        }
        field(52601; "ORB Posted Sales Inv. Number"; Code[20])
        {
            Caption = 'Posted Sales Invoice Number';
            DataClassification = CustomerContent;
        }
    }
}
