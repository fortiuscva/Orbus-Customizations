page 53410 "LIFT Dimension Value"
{
    APIGroup = 'Orbus';
    APIPublisher = 'Orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'liftDimensionValue';
    DelayedInsert = true;
    EntityName = 'LIFTDimensionValue';
    EntitySetName = 'LIFTDimensionValue';
    PageType = API;
    SourceTable = "Dimension Value";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(dimensionCode; Rec."Dimension Code")
                {
                    Caption = 'Dimension Code';
                }
                field("code"; Rec."Code")
                {
                    Caption = 'Code';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(dimensionValueType; Rec."Dimension Value Type")
                {
                    Caption = 'Dimension Value Type';
                }
                field(totaling; Rec.Totaling)
                {
                    Caption = 'Totaling';
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                }
                field(consolidationCode; Rec."Consolidation Code")
                {
                    Caption = 'Consolidation Code';
                }
                field(indentation; Rec.Indentation)
                {
                    Caption = 'Indentation';
                }
                field(globalDimensionNo; Rec."Global Dimension No.")
                {
                    Caption = 'Global Dimension No.';
                }
                field(mapToICDimensionCode; Rec."Map-to IC Dimension Code")
                {
                    Caption = 'Map-to IC Dimension Code';
                }
                field(mapToICDimensionValueCode; Rec."Map-to IC Dimension Value Code")
                {
                    Caption = 'Map-to IC Dimension Value Code';
                }
                field(dimensionValueID; Rec."Dimension Value ID")
                {
                    Caption = 'Dimension Value ID';
                }
                field(lastModifiedDateTime; Rec."Last Modified Date Time")
                {
                    Caption = 'Last Modified Date Time';
                }
                field(dimensionId; Rec."Dimension Id")
                {
                    Caption = 'Dimension Id';
                }
            }
        }
    }
}
