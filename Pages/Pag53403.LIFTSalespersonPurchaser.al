page 53403 "ORB LIFT SalespersonPurchaser"
{
    APIGroup = 'Orbus';
    APIPublisher = 'Orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'liftSalespersonPurchaser';
    DelayedInsert = true;
    EntityName = 'LIFTSalespersonPurchaser';
    EntitySetName = 'LIFTSalespersonPurchaser';
    PageType = API;
    SourceTable = "Salesperson/Purchaser";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("code"; Rec."Code")
                {
                    Caption = 'Code';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(commission; Rec."Commission %")
                {
                    Caption = 'Commission %';
                }
                field(privacyBlocked; Rec."Privacy Blocked")
                {
                    Caption = 'Privacy Blocked';
                }
                field(coupledToDataverse; Rec."Coupled to Dataverse")
                {
                    Caption = 'Coupled to Dataverse';
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                }
                field(eMail; Rec."E-Mail")
                {
                    Caption = 'Email';
                }
                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                }
                field(nextTaskDate; Rec."Next Task Date")
                {
                    Caption = 'Next Task Date';
                }
                field(noOfOpportunities; Rec."No. of Opportunities")
                {
                    Caption = 'No. of Opportunities';
                }
                field(estimatedValueLCY; Rec."Estimated Value (LCY)")
                {
                    Caption = 'Estimated Value (LCY)';
                }
                field(calcdCurrentValueLCY; Rec."Calcd. Current Value (LCY)")
                {
                    Caption = 'Calcd. Current Value (LCY)';
                }
                field(noOfInteractions; Rec."No. of Interactions")
                {
                    Caption = 'No. of Interactions';
                }
                field(costLCY; Rec."Cost (LCY)")
                {
                    Caption = 'Cost (LCY)';
                }
                field(durationMin; Rec."Duration (Min.)")
                {
                    Caption = 'Duration (Min.)';
                }
                field(jobTitle; Rec."Job Title")
                {
                    Caption = 'Job Title';
                }
                field(avgEstimatedValueLCY; Rec."Avg. Estimated Value (LCY)")
                {
                    Caption = 'Avg. Estimated Value (LCY)';
                }
                field(avgCalcdCurrentValueLCY; Rec."Avg.Calcd. Current Value (LCY)")
                {
                    Caption = 'Avg.Calcd. Current Value (LCY)';
                }
                field(opportunityEntryExists; Rec."Opportunity Entry Exists")
                {
                    Caption = 'Opportunity Entry Exists';
                }
                field(taskEntryExists; Rec."Task Entry Exists")
                {
                    Caption = 'Task Entry Exists';
                }
                field(searchEMail; Rec."Search E-Mail")
                {
                    Caption = 'Search Email';
                }
                field(eMail2; Rec."E-Mail 2")
                {
                    Caption = 'Email 2';
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                }
                field(loginExpirationDateCL; Rec."Login Expiration Date -CL-")
                {
                    Caption = 'Login Expiration Date';
                }
                field(posPermissionSetCL; Rec."POS Permission Set -CL-")
                {
                    Caption = 'POS Permission Set';
                }
                field(passwordChangeRequiredCL; Rec."Password Change Required -CL-")
                {
                    Caption = 'Password Change Required';
                }
                field(passwordHashCL; Rec."Password Hash -CL-")
                {
                    Caption = 'Password Hash';
                }
                field(passwordLastResetDateCL; Rec."Password Last Reset Date -CL-")
                {
                    Caption = 'Password Last Reset Date';
                }
                field(passwordSaltCL; Rec."Password Salt -CL-")
                {
                    Caption = 'Password Salt';
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
                field(closedTaskFilter; Rec."Closed Task Filter")
                {
                    Caption = 'Closed Task Filter';
                }
                field(completedFilter; Rec."Completed % Filter")
                {
                    Caption = 'Completed % Filter';
                }
                field(contactCompanyFilter; Rec."Contact Company Filter")
                {
                    Caption = 'Contact Company Filter';
                }
                field(contactFilter; Rec."Contact Filter")
                {
                    Caption = 'Contact Filter';
                }
                field(dateFilter; Rec."Date Filter")
                {
                    Caption = 'Date Filter';
                }
                field(estimatedValueFilter; Rec."Estimated Value Filter")
                {
                    Caption = 'Estimated Value Filter';
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
