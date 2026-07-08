page 53450 "ORB Case API"
{
    APIGroup = 'orbus';
    APIPublisher = 'orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'orbCaseAPI';
    DelayedInsert = true;
    EntityName = 'ORBCaseAPI';
    EntitySetName = 'ORBCaseAPI';
    PageType = API;
    SourceTable = "ORB Case Buffer";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(entryNo; Rec."Entry No.")
                {
                    Caption = 'Entry No.';
                }
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                }
                field(caseNo; Rec."Case No.")
                {
                    Caption = 'Case No.';
                }
                field(entityType; Rec."Entity Type")
                {
                    Caption = 'Entity Type';
                }
                field(entityNo; Rec."Entity No.")
                {
                    Caption = 'Entity No.';
                }
                field(entityName; Rec."Entity Name")
                {
                    Caption = 'Entity Name';
                }
                field(contactName; Rec."Contact Name")
                {
                    Caption = 'Contact Name';
                }
                field(contactEmail; Rec."Contact Email")
                {
                    Caption = 'Contact Email';
                }
                field(contactPhone; Rec."Contact Phone")
                {
                    Caption = 'Contact Phone';
                }
                field(externalDocumentNo; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }
                field(salespersonCode; Rec."Salesperson Code")
                {
                    Caption = 'Salesperson Code';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }

                field(customerComplaint; Rec."Customer Complaint")
                {
                    Caption = 'Customer Complaint';
                }
                field(customerExpectation; Rec."Customer Expectation")
                {
                    Caption = 'Customer Expectation';
                }
                field(describeIssue; Rec."Describe Issue")
                {
                    Caption = 'Describe Issue';
                }
                field(link; Rec.Link)
                {
                    Caption = 'Link';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(mustArriveDate; Rec."Must Arrive Date")
                {
                    Caption = 'Must Arrive Date';
                }
                field(shipToName; Rec."Ship-to Name")
                {
                    Caption = 'Ship-to Name';
                }
                field(shipToContact; Rec."Ship-to Contact")
                {
                    Caption = 'Ship-to Contact';
                }
                field(shipToAddress; Rec."Ship-to Address")
                {
                    Caption = 'Ship-to Address';
                }
                field(shipToAddress2; Rec."Ship-to Address 2")
                {
                    Caption = 'Ship-to Address 2';
                }
                field(city; Rec.City)
                {
                    Caption = 'City';
                }
                field(state; Rec.State)
                {
                    Caption = 'State';
                }
                field(postCode; Rec."Post Code")
                {
                    Caption = 'Post Code';
                }
                field(magentoResultID; Rec."Magento Result ID")
                {
                    Caption = 'Magento Result ID';
                }
                field(notes; Rec.Notes)
                {
                    Caption = 'Notes';
                }
            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        CaseMgmt.PropagateOnCaseCardInsert(Rec);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        CaseMgmt.PropagateOnCaseCardModify(Rec);
    end;

    var
        CaseMgmt: Codeunit "ORB Case Management";
}
