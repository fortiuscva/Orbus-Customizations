pageextension 52615 "ORB Sales Order" extends "Sales Order"
{
    layout
    {
        modify("Payment Terms Code")
        {
            trigger OnBeforeValidate()
            var
                UserSetupRecLcl: Record "User Setup";
                AccessNotallowedlbl: Label '%1 does not have the permission to access';
            begin
                UserSetupRecLcl.get(UserId);
                if UserSetupRecLcl."ORB PT on SO Not allowed" then
                    Error(AccessNotallowedlbl, UserId);
            end;
        }
    }
}