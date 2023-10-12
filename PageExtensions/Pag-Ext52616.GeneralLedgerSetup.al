pageextension 52616 "ORB General Ledger Setup" extends "General Ledger Setup"
{
    trigger OnOpenPage()
    var
        UserSetupRecLcl: Record "User Setup";
        AccessNotallowedlbl: Label '%1 does not have the permission to Change';
    begin
        if UserSetupRecLcl.get(UserId) then begin
            if UserSetupRecLcl."ORB Restrict GL & UserSetup" then
                Error(AccessNotallowedlbl, UserId);
        end;
    end;
}