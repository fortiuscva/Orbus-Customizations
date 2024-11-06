page 52637 "LIFT Sales Header Add. Fields"
{
    APIGroup = 'Orbus';
    APIPublisher = 'Orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'liftSalesHeaderAddFields';
    DelayedInsert = true;
    EntityName = 'LISTSalesHeaderAddFields';
    EntitySetName = 'LISTSalesHeaderAddFields';
    PageType = API;
    SourceTable = "ORB Sales Header Add. Fields";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(documentType; Rec."Document Type")
                {
                    Caption = 'Document Type';
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(directToShowLabel; Rec."Direct to show Label")
                {
                    Caption = 'Direct to show Label';
                }
                field(productionTimeline; Rec."Production timeline")
                {
                    Caption = 'Production timeline';
                }
                field(paymentType; Rec."Payment Type")
                {
                    Caption = 'Payment Type';
                }
                field(paymentAccountNo; Rec."Payment Account No.")
                {
                    Caption = 'Payment Account No.';
                }
                field(paymentProvince; Rec."Payment Province")
                {
                    Caption = 'Payment State';
                }
                field(paymentPostalCode; Rec."Payment Postal Code")
                {
                    Caption = 'Payment Zip';
                }
                field(paymentCountryCode; Rec."Payment Country Code")
                {
                    Caption = 'Payment Country';
                }
                field(jobURL; Rec."Job URL")
                {
                    Caption = 'Job URL';
                }
                field(polaraidURL; Rec."Polaraid URL")
                {
                    Caption = 'Polaraid URL';
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
            }
        }
    }
}
