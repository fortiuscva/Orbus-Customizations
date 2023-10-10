pageextension 52617 "ORB General Posting Setup" extends "General Posting Setup"
{
    trigger OnOpenPage()
    var
        UserSetupRecLcl: Record "User Setup";
        AccessNotallowedlbl: Label '%1 does not have the permission to Access.';
    begin
        UserSetupRecLcl.get(UserId);
        if UserSetupRecLcl."ORB GenPost. Setup Not Allowed" then
            Error(AccessNotallowedlbl, UserId);
    end;
}
