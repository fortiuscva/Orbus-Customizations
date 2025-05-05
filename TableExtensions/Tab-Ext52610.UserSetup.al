tableextension 52610 "ORB User Setup" extends "User Setup"
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
        field(52603; "ORB Tax Liable Edit Allowed"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Tax Liable Edit on the Customer is Allowed';
        }
        field(52604; "ORB Cust.Support Edit Allowed"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Customer Support Edit Allowed';
        }
        field(52605; "ORB Buss. Devlop Edit Allowed"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Business Development Edit Allowed';
        }

        field(52607; "ORB Regional Sales Executive"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Regional Sales Executive Edit Allowed';
        }
        field(52606; "ORB Versapay ID Edit Allowed"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Versapay ID Edit Allowed';
        }
        field(52608; "ORB Key Account Manager"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Key Account Edit Allowed';
        }
        field(52609; "ORB Sales Return Del Allowed"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Sales Return Delete Allowed';
        }

    }

}