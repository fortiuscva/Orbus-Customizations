page 53406 "ORB LIFT Sales Price"
{
    APIGroup = 'Orbus';
    APIPublisher = 'Orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'liftSalesPrice';
    DelayedInsert = true;
    EntityName = 'LIFTSalesPrice';
    EntitySetName = 'LIFTSalesPrice';
    PageType = API;
    SourceTable = "Sales Price";
    SourceTableView = sorting("Starting Date", "Ending Date") order(ascending) where("Sales Type" = filter("Customer Price Group"));

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(salesType; Rec."Sales Type")
                {
                    Caption = 'Sales Type';
                }
                field(salesCode; Rec."Sales Code")
                {
                    Caption = 'Sales Code';
                }
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                }
                field(minimumQuantity; Rec."Minimum Quantity")
                {
                    Caption = 'Minimum Quantity';
                }
                field(unitPrice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                }
                field(startingDate; Rec."Starting Date")
                {
                    Caption = 'Starting Date';
                }
                field(endingDate; Rec."Ending Date")
                {
                    Caption = 'Ending Date';
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                }
                field(variantCode; Rec."Variant Code")
                {
                    Caption = 'Variant Code';
                }
                field(priceIncludesVAT; Rec."Price Includes VAT")
                {
                    Caption = 'Price Includes VAT';
                }
                field(allowLineDisc; Rec."Allow Line Disc.")
                {
                    Caption = 'Allow Line Disc.';
                }
                field(allowInvoiceDisc; Rec."Allow Invoice Disc.")
                {
                    Caption = 'Allow Invoice Disc.';
                }
                field(vatBusPostingGrPrice; Rec."VAT Bus. Posting Gr. (Price)")
                {
                    Caption = 'VAT Bus. Posting Gr. (Price)';
                }
                field(toBeExported; Rec."ORB To Be Exported")
                {
                    Caption = 'To Be Exported';
                }
                field(liftStatus; ORBLIFTStatus)
                {
                    Caption = 'Status';
                }
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'SystemCreatedAt';
                }
                field(systemModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'SystemModifiedAt';
                }

            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        if (Rec."Starting Date" < Today) and (Rec."Ending Date" > Today) then
            ORBLIFTStatus := 'A'
        else
            ORBLIFTStatus := 'I';
    end;

    var
        ORBLIFTStatus: Code[1];
}
