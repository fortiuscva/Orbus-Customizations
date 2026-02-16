codeunit 53405 "ORB LIFT Contact Mgmt"
{
    Procedure PropagateOnContactInsert(var LIFTContact: Record "ORB LIFT Contact")
    begin
        if LIFTContact.Type = LIFTContact.Type::Company then
            exit;
        if not Contact.Get(LIFTContact."No.") then begin
            Contact.Init();
            Contact."No." := LIFTContact."No.";
            Contact.Insert(true);
        end;
        // if (LIFTContact.Type = LIFTContact.Type::Company) then begin
        //     if not ContactBusinessRelation.Get(LIFTContact."No.", 'CUST') then begin
        //         ContactBusinessRelation.Init();
        //         ContactBusinessRelation.Validate("Contact No.", LIFTContact."No.");
        //         ContactBusinessRelation.Validate("Business Relation Code", 'CUST');
        //         ContactBusinessRelation.Insert();
        //     end;
        // end;
        UpdateContact(Contact, LIFTContact);
        // if (LIFTContact.Type = LIFTContact.Type::Company) then
        //     UpdateContactBusinessRelation(ContactBusinessRelation, LIFTContact);
    end;

    Procedure PropagateOnContactModify(var LIFTContact: Record "ORB LIFT Contact")
    begin
        if LIFTContact.Type = LIFTContact.Type::Company then
            exit;
        if Contact.Get(LIFTContact."No.") then
            UpdateContact(Contact, LIFTContact);
    end;

    procedure UpdateContact(var Contact: Record Contact; var LIFTContact: Record "ORB LIFT Contact")
    begin
        ValidateContactFields(Contact, LIFTContact);
        Contact.Modify(true);
    end;

    procedure ValidateContactFields(var Contact: Record Contact; var LIFTContact: Record "ORB LIFT Contact")
    var
        ContactBusinessRelationRecLcl: Record "Contact Business Relation";
    begin
        // Clear(ContactName);
        // ContactName := LIFTContact."First Name" + LIFTContact."Last Name";
        Contact.Validate(Name, LIFTContact.Name);
        Contact.Validate("Phone No.", LIFTContact."Phone No.");
        Contact.Validate("Mobile Phone No.", LIFTContact."Mobile Phone No.");
        Contact.Validate("E-Mail", LIFTContact."E-Mail");
        Contact.Validate("First Name", LIFTContact."First Name");
        Contact.Validate(Surname, LIFTContact."Last Name");
        Contact.Validate(Type, LIFTContact.Type);

        // if LIFTContact.Active = 'I' then
        //     Contact."ORB Active Status" := Contact."ORB Active Status"::InActive
        // else if LIFTContact.Active = 'A' then
        //     Contact."ORB Active Status" := Contact."ORB Active Status"::Active;

        // Contact.Validate("Company Name", LIFTContact."Customer Name");
        // Contact.Validate("Contact Business Relation", Contact."Contact Business Relation"::Customer);
        if LIFTContact.Type = LIFTContact.Type::Person then begin
            ContactBusinessRelationRecLcl.Reset();
            ContactBusinessRelationRecLcl.SetRange("Link to Table", ContactBusinessRelationRecLcl."Link to Table"::Customer);
            ContactBusinessRelationRecLcl.SetRange("No.", LIFTContact."Customer No.");
            if ContactBusinessRelationRecLcl.FindLast() then begin
                //Error('Contact Business Relation Found %1 %2');
                Contact."Company No." := ContactBusinessRelationRecLcl."Contact No.";
                ContactBusinessRelationRecLcl.CalcFields("Contact Name");
                Contact."Company Name" := ContactBusinessRelationRecLcl."Contact Name";
                Contact."Lookup Contact No." := ContactBusinessRelationRecLcl."Contact No.";
                Contact.Validate("Contact Business Relation", Contact."Contact Business Relation"::Customer);
            end;
            // else if (LIFTContact.Type = LIFTContact.Type::Company) then
            //     Contact."Company No." := LiftContact."No.";
        end;
    end;

    // procedure UpdateContactBusinessRelation(var ContactBusinessRelation: Record "Contact Business Relation"; var LIFTContact: Record "LIFT Contact")
    // begin
    //     ValidateContactBusinessRelationFields(ContactBusinessRelation, LIFTContact);
    //     ContactBusinessRelation.Modify();
    // end;

    // procedure ValidateContactBusinessRelationFields(var ContactBusinessRelation: Record "Contact Business Relation"; var LIFTContact: Record "LIFT Contact")
    // begin
    //     ContactBusinessRelation.Validate("Link to Table", ContactBusinessRelation."Link to Table"::Customer);
    //     ContactBusinessRelation.Validate("No.", LIFTContact."Customer No.");
    //     ContactBusinessRelation.CalcFields("Contact Name");
    // end;



    var
        //ContactBusinessRelation: Record "Contact Business Relation";
        Contact: Record Contact;
    //ContactName: Text[100];
}
