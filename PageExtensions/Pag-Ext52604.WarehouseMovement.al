pageextension 52604 "ORB Warehouse Movement" extends "Warehouse Movement"
{
    layout
    {
        modify("Assigned User ID")
        {
            trigger OnLookup(var Text: Text): Boolean
            var
                ORBAPPAssignedUserID: Record "Warehouse Employee" temporary;
                warehouseEmployee: Record "Warehouse Employee";
                IWXUsers: Record "IWX User";
                ORBAPPAssignedUserIDLookupPage: Page "ORBAPP Assigned User ID Lookup";
            begin
                ORBAPPAssignedUserID.Init();
                warehouseEmployee.SetRange("User ID");
                if warehouseEmployee.FindSet() then
                    repeat
                        ORBAPPAssignedUserID.SetRange("User ID", warehouseEmployee."User ID");
                        if not ORBAPPAssignedUserID.FindSet() then begin
                            ORBAPPAssignedUserID."User ID" := warehouseEmployee."User ID";
                            ORBAPPAssignedUserID."Location Code" := warehouseEmployee."Location Code";
                            ORBAPPAssignedUserID.Insert();
                        end;
                        ORBAPPAssignedUserID.Reset();
                    until warehouseEmployee.next = 0;


                IWXUsers.SetRange("User ID");
                if IWXUsers.FindSet() then
                    repeat
                        ORBAPPAssignedUserID.SetRange("User ID", IWXUsers."User ID");
                        if not ORBAPPAssignedUserID.FindSet() then begin
                            ORBAPPAssignedUserID."User ID" := IWXUsers."User ID";
                            ORBAPPAssignedUserID."Location Code" := IWXUsers."Default Location"; // SAR 02.02.23 - Need to have a Location Code for any Assigned User.
                            ORBAPPAssignedUserID.Insert();
                        end;
                        ORBAPPAssignedUserID.Reset();
                    until IWXUsers.next = 0;

                if Page.RunModal(Page::"ORBAPP Assigned User ID Lookup", ORBAPPAssignedUserID) = Action::LookupOK then
                    Rec."Assigned User ID" := ORBAPPAssignedUserID."User ID";

            end;
        }
    }
}
