tableextension 52609 "ORB User Setup" extends "User Setup"
{
    fields
    {
        field(52600; "ORB PT on SO Not allowed"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Payment Terms on SO Not allowed';
        }
        field(52601; "ORB Restrict GL & UserSetup"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Restrict GL and User Setup Access';
        }
        field(52602; "ORB GenPost. Setup Not Allowed"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'General Posting Setup Not Allowed';
        }
    }

}