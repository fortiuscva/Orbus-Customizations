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
        field(53400; "ORB Active Status"; Enum "LIFT Contact & ShipTo Status")
        {
            Caption = 'Active Status';
            DataClassification = ToBeClassified;
        }
    }
    local procedure CheckDuplicateEmailContact()
    var
        Contact: Record Contact;
    begin
        if rec.Type = Rec.Type::Company then
            exit;

        if (Rec."E-Mail" <> '') then begin
            Contact.Reset();
            Contact.SetFilter("No.", '<>%1', Rec."No.");
            Contact.SetRange(Type, Contact.Type::Person);
            Contact.SetRange("E-Mail", Rec."E-Mail");
            if Contact.FindFirst() then
                Error(DuplicateEmailErr, Contact."No.");
        end;
    end;

    var
        DuplicateEmailErr: Label 'The email address is registered with contact %1. You cannot assign same email address to multiple contacts';
}
