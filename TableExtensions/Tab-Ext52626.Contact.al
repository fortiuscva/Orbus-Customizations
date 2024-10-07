tableextension 52626 "ORB Contact" extends Contact
{
    fields
    {
        modify("E-Mail")
        {
            trigger OnAfterValidate()
            begin
                if GuiAllowed then
                    CheckDuplicateEmailContact();
            end;
        }
    }
    local procedure CheckDuplicateEmailContact()
    var
        Contact: Record Contact;
    begin
        Contact.Reset();
        Contact.SetRange(Type, Contact.Type::Person);
        Contact.SetRange("E-Mail", Rec."E-Mail");
        if Contact.FindFirst() then
            Error(DuplicateEmailErr, Contact."No.");
    end;

    var
        DuplicateEmailErr: Label 'The email address is registered with contact %1. You cannot assign same email address to multiple contacts';
}
