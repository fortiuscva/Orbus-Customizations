page 53426 "ORB Price List Lines"
{
    APIGroup = 'Orbus';
    APIPublisher = 'Orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'orbPriceListLines';
    DelayedInsert = true;
    EntityName = 'LIFTPriceListLines';
    EntitySetName = 'LIFTPriceListLines';
    PageType = API;
    SourceTable = "Price List Line";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(priceListCode; Rec."Price List Code")
                {
                    Caption = 'Price List Code';
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
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
                    Caption = 'Assign-to Parent No. (custom)';
                }
                field(sourceID; Rec."Source ID")
                {
                    Caption = 'Assign-to ID';
                }
                field(assetType; Rec."Asset Type")
                {
                    Caption = 'Product Type';
                }
                field(assetNo; Rec."Asset No.")
                {
                    Caption = 'Product No. (custom)';
                }
                field(variantCode; Rec."Variant Code")
                {
                    Caption = 'Variant Code (custom)';
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                }
                field(workTypeCode; Rec."Work Type Code")
                {
                    Caption = 'Work Type Code';
                }
                field(startingDate; Rec."Starting Date")
                {
                    Caption = 'Starting Date';
                }
                field(endingDate; Rec."Ending Date")
                {
                    Caption = 'Ending Date';
                }
                field(minimumQuantity; Rec."Minimum Quantity")
                {
                    Caption = 'Minimum Quantity';
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code (custom)';
                }
                field(amountType; Rec."Amount Type")
                {
                    Caption = 'Defines';
                }
                field(unitPrice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                }
                field(costFactor; Rec."Cost Factor")
                {
                    Caption = 'Cost Factor';
                }
                field(unitCost; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                }
                field(lineDiscount; Rec."Line Discount %")
                {
                    Caption = 'Line Discount %';
                }
                field(allowLineDisc; Rec."Allow Line Disc.")
                {
                    Caption = 'Allow Line Disc.';
                }
                field(allowInvoiceDisc; Rec."Allow Invoice Disc.")
                {
                    Caption = 'Allow Invoice Disc.';
                }
                field(priceIncludesVAT; Rec."Price Includes VAT")
                {
                    Caption = 'Price Includes VAT';
                }
                field(vatBusPostingGrPrice; Rec."VAT Bus. Posting Gr. (Price)")
                {
                    Caption = 'VAT Bus. Posting Gr. (Price)';
                }
                field(vatProdPostingGroup; Rec."VAT Prod. Posting Group")
                {
                    Caption = 'VAT Prod. Posting Group';
                }
                field(assetID; Rec."Asset ID")
                {
                    Caption = 'Asset ID';
                }
                field(lineAmount; Rec."Line Amount")
                {
                    Caption = 'Line Amount';
                }
                field(priceType; Rec."Price Type")
                {
                    Caption = 'Price Type';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Price Status';
                }
                field(directUnitCost; Rec."Direct Unit Cost")
                {
                    Caption = 'Direct Unit Cost';
                }
                field(sourceGroup; Rec."Source Group")
                {
                    Caption = 'Source Group';
                }
                field(productNo; Rec."Product No.")
                {
                    Caption = 'Product No.';
                }
                field(assignToNo; Rec."Assign-to No.")
                {
                    Caption = 'Assign-to No.';
                }
                field(assignToParentNo; Rec."Assign-to Parent No.")
                {
                    Caption = 'Assign-to Parent No.';
                }
                field(variantCodeLookup; Rec."Variant Code Lookup")
                {
                    Caption = 'Variant Code';
                }
                field(unitOfMeasureCodeLookup; Rec."Unit of Measure Code Lookup")
                {
                    Caption = 'Unit of Measure Code';
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
}
