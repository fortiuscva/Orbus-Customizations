pageextension 52614 "ORB User Setup" extends "User Setup"
{
    layout
    {
        addlast(Control1)
        {
            field("ORB PT on SO Not allowed"; Rec."ORB PT on SO Not allowed")
            {
                ApplicationArea = all;
                ToolTip = 'To restrict user from changing Payment Terms';
            }
            field("ORB Restrict GL & UserSetup"; Rec."ORB Restrict GL & UserSetup")
            {
                Caption = 'Restrict General Ledger Setup';
                ApplicationArea = all;
                ToolTip = 'To restrict user from GL & User Setup Access';
            }
            field("ORB GenPost. Setup Not Allowed"; Rec."ORB GenPost. Setup Not Allowed")
            {
                ApplicationArea = all;
                ToolTip = 'To restrict user from General Posting Setup Access';
            }
            field("ORB Tax Liable Edit Allowed"; Rec."ORB Tax Liable Edit Allowed")
            {
                ApplicationArea = all;
                ToolTip = 'To Allow Tax Liable Edit on the Customer';
            }
           
            field("ORB Versapay ID Edit Allowed"; Rec."ORB Versapay ID Edit Allowed")
            {
                ApplicationArea = all;
                ToolTip = 'To Allow User Edit Versapay ID';
            }
             field("ORB Cust.Support Edit Allowed"; Rec."ORB Cust.Support Edit Allowed")
            {
                Caption = 'Edit Customer Support';
                ApplicationArea = all;
                ToolTip = 'To Allow Customer Support Edit on the Customer Card';
            }
            field("ORB Buss. Devlop Edit Allowed"; Rec."ORB Buss. Devlop Edit Allowed")
            {
                Caption = 'Edit Business Development';
                ApplicationArea = all;
                ToolTip = 'To Allow Business Development Edit on the Customer Card';
            }
            field("ORB Regional Sales Executive"; Rec."ORB Regional Sales Executive")
            {
                Caption = 'Edit Regional Sales Executive';
                ApplicationArea = all;
                ToolTip = 'To Allow Regional Sales Executive Edit on the Customer Card';
            }

        }
    }

    trigger OnOpenPage()
    var
        UserSetupRecLcl: Record "User Setup";
        AccessNotallowedlbl: Label '%1 does not have the permission to access';
    begin
        /*
        UserSetupRecLcl.get(UserId);
        if UserSetupRecLcl."ORB Restrict GL & UserSetup" then
            Error(AccessNotallowedlbl, UserId);
        */
    end;
}