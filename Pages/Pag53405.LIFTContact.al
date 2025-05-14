page 53405 "ORB LIFT Contact"
{
    APIGroup = 'Orbus';
    APIPublisher = 'Orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'liftContact';
    DelayedInsert = true;
    EntityName = 'LIFTContact';
    EntitySetName = 'LIFTContact';
    PageType = API;
    SourceTable = Contact;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(searchName; Rec."Search Name")
                {
                    Caption = 'Search Name';
                }
                field(name2; Rec."Name 2")
                {
                    Caption = 'Name 2';
                }
                field(address; Rec.Address)
                {
                    Caption = 'Address';
                }
                field(address2; Rec."Address 2")
                {
                    Caption = 'Address 2';
                }
                field(city; Rec.City)
                {
                    Caption = 'City';
                }
                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                }
                field(telexNo; Rec."Telex No.")
                {
                    Caption = 'Telex No.';
                }
                field(type; Rec."Type")
                {
                    Caption = 'Type';
                }
                field(eMail; Rec."E-Mail")
                {
                    Caption = 'Email';
                }
                field(eMail2; Rec."E-Mail 2")
                {
                    Caption = 'Email 2';
                }
                field(territoryCode; Rec."Territory Code")
                {
                    Caption = 'Territory Code';
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                }
                field(languageCode; Rec."Language Code")
                {
                    Caption = 'Language Code';
                }
                field(registrationNumber; Rec."Registration Number")
                {
                    Caption = 'Registration No.';
                }
                field(salespersonCode; Rec."Salesperson Code")
                {
                    Caption = 'Salesperson Code';
                }
                field(countryRegionCode; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                }
                field(comment; Rec.Comment)
                {
                    Caption = 'Comment';
                }
                field(formatRegion; Rec."Format Region")
                {
                    Caption = 'Format Region';
                }
                field(lastDateModified; Rec."Last Date Modified")
                {
                    Caption = 'Last Date Modified';
                }
                field(faxNo; Rec."Fax No.")
                {
                    Caption = 'Fax No.';
                }
                field(telexAnswerBack; Rec."Telex Answer Back")
                {
                    Caption = 'Telex Answer Back';
                }
                field(vatRegistrationNo; Rec."VAT Registration No.")
                {
                    Caption = 'VAT Registration No.';
                }
                field(postCode; Rec."Post Code")
                {
                    Caption = 'Post Code';
                }
                field(county; Rec.County)
                {
                    Caption = 'County';
                }
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                }
                field(privacyBlocked; Rec."Privacy Blocked")
                {
                    Caption = 'Privacy Blocked';
                }
                field(minor; Rec.Minor)
                {
                    Caption = 'Minor';
                }
                field(parentalConsentReceived; Rec."Parental Consent Received")
                {
                    Caption = 'Parental Consent Received';
                }
                field(coupledToDataverse; Rec."Coupled to Dataverse")
                {
                    Caption = 'Coupled to Dataverse';
                }
                field(companyNo; Rec."Company No.")
                {
                    Caption = 'Company No.';
                }
                field(companyName; Rec."Company Name")
                {
                    Caption = 'Company Name';
                }
                field(lookupContactNo; Rec."Lookup Contact No.")
                {
                    Caption = 'Lookup Contact No.';
                }
                field(firstName; Rec."First Name")
                {
                    Caption = 'First Name';
                }
                field(middleName; Rec."Middle Name")
                {
                    Caption = 'Middle Name';
                }
                field(surname; Rec.Surname)
                {
                    Caption = 'Surname';
                }
                field(jobTitle; Rec."Job Title")
                {
                    Caption = 'Job Title';
                }
                field(initials; Rec.Initials)
                {
                    Caption = 'Initials';
                }
                field(extensionNo; Rec."Extension No.")
                {
                    Caption = 'Extension No.';
                }
                field(mobilePhoneNo; Rec."Mobile Phone No.")
                {
                    Caption = 'Mobile Phone No.';
                }
                field(pager; Rec.Pager)
                {
                    Caption = 'Pager';
                }
                field(organizationalLevelCode; Rec."Organizational Level Code")
                {
                    Caption = 'Organizational Level Code';
                }
                field(excludeFromSegment; Rec."Exclude from Segment")
                {
                    Caption = 'Exclude from Segment';
                }
                field(nextTaskDate; Rec."Next Task Date")
                {
                    Caption = 'Next Task Date';
                }
                field(lastDateAttempted; Rec."Last Date Attempted")
                {
                    Caption = 'Last Date Attempted';
                }
                field(dateOfLastInteraction; Rec."Date of Last Interaction")
                {
                    Caption = 'Date of Last Interaction';
                }
                field(noOfJobResponsibilities; Rec."No. of Job Responsibilities")
                {
                    Caption = 'No. of Job Responsibilities';
                }
                field(noOfIndustryGroups; Rec."No. of Industry Groups")
                {
                    Caption = 'No. of Industry Groups';
                }
                field(noOfBusinessRelations; Rec."No. of Business Relations")
                {
                    Caption = 'No. of Business Relations';
                }
                field(noOfMailingGroups; Rec."No. of Mailing Groups")
                {
                    Caption = 'No. of Mailing Groups';
                }
                field(externalID; Rec."External ID")
                {
                    Caption = 'External ID';
                }
                field(noOfInteractions; Rec."No. of Interactions")
                {
                    Caption = 'No. of Interactions';
                }
                field(contactBusinessRelation; Rec."Contact Business Relation")
                {
                    Caption = 'Contact Business Relation';
                }
                field(estimatedValueLCY; Rec."Estimated Value (LCY)")
                {
                    Caption = 'Estimated Value (LCY)';
                }
                field(calcdCurrentValueLCY; Rec."Calcd. Current Value (LCY)")
                {
                    Caption = 'Calcd. Current Value (LCY)';
                }
                field(opportunityEntryExists; Rec."Opportunity Entry Exists")
                {
                    Caption = 'Opportunity Entry Exists';
                }
                field(taskEntryExists; Rec."Task Entry Exists")
                {
                    Caption = 'Task Entry Exists';
                }
                field(correspondenceType; Rec."Correspondence Type")
                {
                    Caption = 'Correspondence Type';
                }
                field(salutationCode; Rec."Salutation Code")
                {
                    Caption = 'Salutation Code';
                }
                field(searchEMail; Rec."Search E-Mail")
                {
                    Caption = 'Search Email';
                }
                field(lastTimeModified; Rec."Last Time Modified")
                {
                    Caption = 'Last Time Modified';
                }
                field(csatMonthlySurvey; Rec."CSAT Monthly Survey")
                {
                    Caption = 'CSAT Monthly Survey';
                }
                field(costLCY; Rec."Cost (LCY)")
                {
                    Caption = 'Cost (LCY)';
                }
                field(durationMin; Rec."Duration (Min.)")
                {
                    Caption = 'Duration (Min.)';
                }
                field(loyaltyTierAwardedOnCL; Rec."Loyalty Tier Awarded On -CL-")
                {
                    Caption = 'Loyalty Tier Awarded On';
                }
                field(loyaltyTierCodeCL; Rec."Loyalty Tier Code -CL-")
                {
                    Caption = 'Loyalty Tier Code';
                }
                field(loyaltyTierExpiresOnCL; Rec."Loyalty Tier Expires On -CL-")
                {
                    Caption = 'Loyalty Tier Expires On';
                }
                field(noOfOpportunities; Rec."No. of Opportunities")
                {
                    Caption = 'No. of Opportunities';
                }
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'SystemCreatedAt';
                }
                field(systemCreatedBy; Rec.SystemCreatedBy)
                {
                    Caption = 'SystemCreatedBy';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(systemModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'SystemModifiedAt';
                }
                field(systemModifiedBy; Rec.SystemModifiedBy)
                {
                    Caption = 'SystemModifiedBy';
                }
                field(xrmId; Rec."Xrm Id")
                {
                    Caption = 'Xrm Id';
                }
                field(actionTakenFilter; Rec."Action Taken Filter")
                {
                    Caption = 'Action Taken Filter';
                }
                field(calcdCurrentValueFilter; Rec."Calcd. Current Value Filter")
                {
                    Caption = 'Calcd. Current Value Filter';
                }
                field(campaignFilter; Rec."Campaign Filter")
                {
                    Caption = 'Campaign Filter';
                }
                field(chancesOfSuccessFilter; Rec."Chances of Success % Filter")
                {
                    Caption = 'Chances of Success % Filter';
                }
                field(closeOpportunityFilter; Rec."Close Opportunity Filter")
                {
                    Caption = 'Close Opportunity Filter';
                }
                field(completedFilter; Rec."Completed % Filter")
                {
                    Caption = 'Completed % Filter';
                }
                field(dateFilter; Rec."Date Filter")
                {
                    Caption = 'Date Filter';
                }
                field(estimatedValueFilter; Rec."Estimated Value Filter")
                {
                    Caption = 'Estimated Value Filter';
                }
                field(jobResponsibilityFilter; Rec."Job Responsibility Filter")
                {
                    Caption = 'Job Responsibility Filter';
                }
                field(priorityFilter; Rec."Priority Filter")
                {
                    Caption = 'Priority Filter';
                }
                field(probabilityFilter; Rec."Probability % Filter")
                {
                    Caption = 'Probability % Filter';
                }
                field(salesCycleFilter; Rec."Sales Cycle Filter")
                {
                    Caption = 'Sales Cycle Filter';
                }
                field(salesCycleStageFilter; Rec."Sales Cycle Stage Filter")
                {
                    Caption = 'Sales Cycle Stage Filter';
                }
                field(salespersonFilter; Rec."Salesperson Filter")
                {
                    Caption = 'Salesperson Filter';
                }
                field(taskClosedFilter; Rec."Task Closed Filter")
                {
                    Caption = 'Task Closed Filter';
                }
                field(taskStatusFilter; Rec."Task Status Filter")
                {
                    Caption = 'Task Status Filter';
                }
                field(teamFilter; Rec."Team Filter")
                {
                    Caption = 'Team Filter';
                }
            }
        }
    }
}
