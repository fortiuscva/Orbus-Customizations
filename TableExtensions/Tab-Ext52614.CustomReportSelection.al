tableextension 52614 "ORB Custom Report Selection" extends "Custom Report Selection"
{
    trigger OnModify()
    var
        CannotChangesDocumentLayoutLbl: Label 'You cannot change when Send email is enabled';
    begin
        if not ORBSingleInstance.GetModifyByCustomerV2API() then begin
            if rec."Source Type" = Database::Customer then begin
                if CustomerRecGbl.get(rec."Source No.") then
                    if CustomerRecGbl."ORB Auto Send Email" then
                        Error(CannotChangesDocumentLayoutLbl);
            end;
        end;
    end;

    trigger OnDelete()
    var
        CannotDeleteDocumentLayoutLbl: Label 'You cannot delete when Send email is enabled';
    begin
        if rec."Source Type" = Database::Customer then begin
            if CustomerRecGbl.get(rec."Source No.") then
                if CustomerRecGbl."ORB Auto Send Email" then
                    Error(CannotDeleteDocumentLayoutLbl);
        end;
    end;


    var
        CustomerRecGbl: Record Customer;
        ORBSingleInstance: Codeunit "ORB Orbus Single Instance";
}
