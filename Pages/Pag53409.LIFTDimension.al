page 53409 "ORB LIFT Dimension"
{
    APIGroup = 'Orbus';
    APIPublisher = 'Orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'liftDimension';
    DelayedInsert = true;
    EntityName = 'LIFTDimension';
    EntitySetName = 'LIFTDimension';
    PageType = API;
    SourceTable = Dimension;

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
                field(codeCaption; Rec."Code Caption")
                {
                    Caption = 'Code Caption';
                }
                field(filterCaption; Rec."Filter Caption")
                {
                    Caption = 'Filter Caption';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                }
                field(consolidationCode; Rec."Consolidation Code")
                {
                    Caption = 'Consolidation Code';
                }
                field(mapToICDimensionCode; Rec."Map-to IC Dimension Code")
                {
                    Caption = 'Map-to IC Dimension Code';
                }
                field(lastModifiedDateTime; Rec."Last Modified Date Time")
                {
                    Caption = 'Last Modified Date Time';
                }
            }
        }
    }
}
