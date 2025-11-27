page 53440 "ORB LIFT Sales Price Items"
{
    APIGroup = 'orbus';
    APIPublisher = 'orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'LIFTSalesPriceItems';
    DelayedInsert = true;
    EntityName = 'LIFTSalesPriceItems';
    EntitySetName = 'LIFTSalesPriceItems';
    PageType = API;
    SourceTable = "ORB LIFT Sales Price Items";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                }
                field(processed; Rec."To Be Processed")
                {
                    Caption = 'Processed';
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
