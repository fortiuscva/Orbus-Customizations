codeunit 53405 "ORB LIFT Contact Mgmt"
{
    Procedure PropagateOnContactInsert(var LIFTContact: Record "LIFT Contact")
    begin
        if not Contact.Get(LIFTContact."No.") then begin
            Contact.Init();
            Contact.Validate("No.", LIFTContact."No.");
            Contact.Insert();
        end;
        if (LIFTContact.Type = LIFTContact.Type::Company) then begin
            if not ContactBusinessRelation.Get(LIFTContact."No.", 'CUST') then begin
                ContactBusinessRelation.Init();
                ContactBusinessRelation.Validate("Contact No.", LIFTContact."No.");
                ContactBusinessRelation.Validate("Business Relation Code", 'CUST');
                ContactBusinessRelation.Insert();
            end;
        end;
        UpdateContact(Contact, LIFTContact);
        if (LIFTContact.Type = LIFTContact.Type::Company) then
            UpdateContactBusinessRelation(ContactBusinessRelation, LIFTContact);
    end;

    Procedure PropagateOnContactModify(var LIFTContact: Record "LIFT Contact")
    begin
        if Contact.Get(LIFTContact."No.") then
            UpdateContact(Contact, LIFTContact);
    end;

    procedure UpdateContact(var Contact: Record Contact; var LIFTContact: Record "LIFT Contact")
    begin
        ValidateContactFields(Contact, LIFTContact);
        Contact.Modify();
    end;

    procedure ValidateContactFields(var Contact: Record Contact; var LIFTContact: Record "LIFT Contact")
    begin
        Clear(ContactName);
        ContactName := LIFTContact."First Name" + LIFTContact."Last Name";
        Contact.Validate(Name, ContactName);
        Contact.Validate("Phone No.", LIFTContact."Phone No.");
        Contact.Validate("E-Mail", LIFTContact."E-Mail");
        Contact.Validate("First Name", LIFTContact."First Name");
        Contact.Validate(Surname, LIFTContact."Last Name");
        Contact.Validate(Type, LIFTContact.Type);
        if (LIFTContact.Type = LIFTContact.Type::Person) then begin
            Contact.Validate("Company Name", LIFTContact."Customer Name");
        end else if LIFTContact.Type = LIFTContact.Type::Company then begin
            Contact."Company No." := LiftContact."No.";
        end;

    end;

    procedure UpdateContactBusinessRelation(var ContactBusinessRelation: Record "Contact Business Relation"; var LIFTContact: Record "LIFT Contact")
    begin
        ValidateContactBusinessRelationFields(ContactBusinessRelation, LIFTContact);
        ContactBusinessRelation.Modify();
    end;

    procedure ValidateContactBusinessRelationFields(var ContactBusinessRelation: Record "Contact Business Relation"; var LIFTContact: Record "LIFT Contact")
    begin
        ContactBusinessRelation.Validate("Link to Table", ContactBusinessRelation."Link to Table"::Customer);
        ContactBusinessRelation.Validate("No.", LIFTContact."Customer No.");
        ContactBusinessRelation.CalcFields("Contact Name");
    end;

    var
        ContactBusinessRelation: Record "Contact Business Relation";
        Contact: Record Contact;
        ContactName: Text[100];
}
