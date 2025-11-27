page 53441 "ORB LIFT SP Items"
{
    ApplicationArea = All;
    PageType = List;
    Caption = 'LIFT Sales Price Items';
    DelayedInsert = true;
    SourceTable = "ORB LIFT Sales Price Items";
    UsageCategory = Lists;

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
                field(processed; Rec."Processed")
                {
                    Caption = 'Processed';
                }
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'SystemCreatedAt';
                    Visible = false;
                }
                field(systemModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'SystemModifiedAt';
                    Visible = false;
                }
            }
        }
    }
}
