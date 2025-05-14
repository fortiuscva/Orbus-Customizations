page 53407 "LIFT Price List Header"
{
    APIGroup = 'Orbus';
    APIPublisher = 'Orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'liftPriceListHeader';
    DelayedInsert = true;
    EntityName = 'LIFTPriceListHeader';
    EntitySetName = 'LIFTPriceListHeader';
    PageType = API;
    SourceTable = "Price List Header";

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
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(sourceGroup; Rec."Source Group")
                {
                    Caption = 'Assign-to Group';
                }
                field(sourceType; Rec."Source Type")
                {
                    Caption = 'Assign-to Type';
                }
                field(sourceNo; Rec."Source No.")
                {
                    Caption = 'Assign-to No. (custom)';
                }
                field(parentSourceNo; Rec."Parent Source No.")
                {
                    Caption = 'Assign-to Parent No. (projects)';
                }
                field(sourceID; Rec."Source ID")
                {
                    Caption = 'Assign-to ID';
                }
                field(priceType; Rec."Price Type")
                {
                    Caption = 'Price Type';
                }
                field(amountType; Rec."Amount Type")
                {
                    Caption = 'Defines';
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                }
                field(startingDate; Rec."Starting Date")
                {
                    Caption = 'Starting Date';
                }
                field(endingDate; Rec."Ending Date")
                {
                    Caption = 'Ending Date';
                }
                field(priceIncludesVAT; Rec."Price Includes VAT")
                {
                    Caption = 'Price Includes VAT';
                }
                field(vatBusPostingGrPrice; Rec."VAT Bus. Posting Gr. (Price)")
                {
                    Caption = 'VAT Bus. Posting Gr. (Price)';
                }
                field(allowLineDisc; Rec."Allow Line Disc.")
                {
                    Caption = 'Allow Line Disc.';
                }
                field(allowInvoiceDisc; Rec."Allow Invoice Disc.")
                {
                    Caption = 'Allow Invoice Disc.';
                }
                field(noSeries; Rec."No. Series")
                {
                    Caption = 'No. Series';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }
                field(filterSourceNo; Rec."Filter Source No.")
                {
                    Caption = 'Filter Source No.';
                }
                field(allowUpdatingDefaults; Rec."Allow Updating Defaults")
                {
                    Caption = 'Allow Updating Defaults';
                }
                field(assignToNo; Rec."Assign-to No.")
                {
                    Caption = 'Assign-to No.';
                }
                field(assignToParentNo; Rec."Assign-to Parent No.")
                {
                    Caption = 'Assign-to Parent No.';
                }
            }
        }
    }
}
