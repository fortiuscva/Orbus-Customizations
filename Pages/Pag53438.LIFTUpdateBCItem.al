page 53438 "ORB LIFT Update BC Item"
{
    APIGroup = 'orbus';
    APIPublisher = 'orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'orbLIFTUpdateBCItem';
    DelayedInsert = true;
    EntityName = 'UpdateBCItem';
    EntitySetName = 'UpdateBCItem';
    PageType = API;
    SourceTable = Item;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(orbMaterialId; Rec."ORB Material Id")
                {
                    Caption = 'Material ID';
                }
                field(orbStroageTypeId; Rec."ORB Stroage Type Id")
                {
                    Caption = 'Storage Type ID';
                }
                field(orbProductId; Rec."ORB Product Id")
                {
                    Caption = 'Product ID';
                }
            }
        }
    }
}
