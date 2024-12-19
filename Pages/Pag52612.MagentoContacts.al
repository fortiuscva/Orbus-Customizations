page 52612 "ORB MagentoContacts"
{
    APIGroup = 'orbus';
    APIPublisher = 'orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'MagentoContacts';
    DelayedInsert = true;
    PageType = API;
    EntityName = 'MagentoContactsAPI';
    EntitySetName = 'MagentoContactsAPI';
    SourceTable = Contact;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(ContactType; Rec."Type")
                {
                    ToolTip = 'Specifies the type of contact, either company or person.';
                }
                field(No; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the contact, click to navigate to the contact card.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the name of the contact.';
                }
                field(Name2; Rec."Name 2")
                {
                    ToolTip = 'Specifies an additional part of the name.';
                }
                field(Address; Rec.Address)
                {
                    ToolTip = 'Specifies the contact''s address.';
                }
                field(Address2; Rec."Address 2")
                {
                    ToolTip = 'Specifies additional address information.';
                }
                field(City; Rec.City)
                {
                    ToolTip = 'Specifies the city where the contact is located.';
                }
                field(CompanyNo; Rec."Company No.")
                {
                    ToolTip = 'Specifies the number of the customer, click to navigate to the customer card.';
                }
                field(CompanyName; Rec."Company Name")
                {
                    ToolTip = 'Specifies the name of the name of the customer.';
                }
                field(Comment; Rec.Comment)
                {
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field(ContactBusinessRelation; Rec."Contact Business Relation")
                {
                    ToolTip = 'Specifies the type of the existing business relation.';
                }
                field(CorrespondenceType; Rec."Correspondence Type")
                {
                    ToolTip = 'Specifies the preferred type of correspondence for the interaction.';
                }
                field(ExternalID; Rec."External ID")
                {
                    ToolTip = 'Specifies the value of the External ID field.';
                }
                field(FirstName; Rec."First Name")
                {
                    ToolTip = 'Specifies the contact''s first name and is valid for contact persons only.';
                }
                field(FaxNo; Rec."Fax No.")
                {
                    ToolTip = 'Specifies the contact''s fax number.';
                }
                field(HomePage; Rec."Home Page")
                {
                    ToolTip = 'Specifies the contact''s web site.';
                }
                field(JobTitle; Rec."Job Title")
                {
                    ToolTip = 'Specifies the contact''s job title.';
                }
                field(Initials; Rec.Initials)
                {
                    ToolTip = 'Specifies the contact''s initials, when the contact is a person.';
                }
                field(EMail; Rec."E-Mail")
                {
                    ToolTip = 'Specifies the duplicate e-mail.';
                }
                field(EMail2; Rec."E-Mail 2")
                {
                    ToolTip = 'Specifies the value of the Email 2 field.';
                }

                field(PhoneNo; Rec."Phone No.")
                {
                    ToolTip = 'Specifies the contact''s phone number.';
                }
                field(PostCode; Rec."Post Code")
                {
                    ToolTip = 'Specifies the postal code.';
                }
                field(MobilePhoneNo; Rec."Mobile Phone No.")
                {
                    ToolTip = 'Specifies the contact''s mobile telephone number.';
                }
                field(MiddleName; Rec."Middle Name")
                {
                    ToolTip = 'Specifies the contact''s middle name and is valid for contact persons only.';
                }
                field(CountryRegionCode; Rec."Country/Region Code")
                {
                    ToolTip = 'Specifies the country/region of the address.';
                }
                field(County; Rec.County)
                {
                    ToolTip = 'Specifies the state as a part of the address.';
                }
                field(LanguageCode; Rec."Language Code")
                {
                    ToolTip = 'Specifies the language that is used when translating specified text on documents to foreign business partner, such as an item description on an order confirmation.';
                }
                field(SalespersonCode; Rec."Salesperson Code")
                {
                    ToolTip = 'Specifies the code of the salesperson who normally handles this contact.';
                }
                field(RegistrationNumber; Rec."Registration Number")
                {
                    ToolTip = 'Specifies the registration number of the contact. You can enter a maximum of 20 characters, both numbers and letters.';
                }
                field(SearchEMail; Rec."Search E-Mail")
                {
                    ToolTip = 'Specifies the value of the Search Email field.';
                }
                field(SearchName; Rec."Search Name")
                {
                    ToolTip = 'Specifies an alternate name that you can use to search for the record in question when you cannot remember the value in the Name field.';
                }
                field(Surname; Rec.Surname)
                {
                    ToolTip = 'Specifies the contact''s surname and is valid for contact persons only.';
                }
                field(TelexNo; Rec."Telex No.")
                {
                    ToolTip = 'Specifies the value of the Telex No. field.';
                }
                field(VATRegistrationNo; Rec."VAT Registration No.")
                {
                    ToolTip = 'Specifies the contact''s VAT registration number. This field is valid for companies only.';
                }
                field(TerritoryCode; Rec."Territory Code")
                {
                    ToolTip = 'Specifies the territory code for the contact.';
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        if Rec."No." = '' then begin
            Rec.Insert(true);
        end;
        Rec.TestField(Rec."E-Mail");
        CheckDuplicateEmailContact();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Insert(true);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        CheckDuplicateEmailContact();
    end;

    local procedure CheckDuplicateEmailContact()
    var
        Contact: Record Contact;
    begin
        if Rec.Type = Rec.Type::Company then
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
        DuplicateEmailErr: Label 'Duplicate contact found with the same email for %1.';
}
