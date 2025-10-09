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
    SourceTable = "ORB LIFT Sales Price";
    SourceTableView = sorting("Item No.", "Sales Type", "Sales Code", "Minimum Quantity", "Starting Date") order(ascending) where("Sales Type" = filter("Customer Price Group"));

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
                field(unitOfMeasureCode; Rec."Unit Of Measure Code")
                {
                    Caption = 'Unit Of Measure Code';
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
                field(orbLIFTStatus; Rec."ORB LIFT Status")
                {
                    Caption = 'Status';
                }
            }
        }
    }
}
