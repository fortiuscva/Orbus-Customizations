page 53444 "ORB LIFT Product Line Values"
{
    ApplicationArea = All;
    Caption = 'ORB LIFT Product Line Values';
    PageType = List;
    SourceTable = "ORB LIFT Product Line Values";
    DataCaptionFields = VALUE_ID, VALUE;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(VALUE_ID; Rec.VALUE_ID)
                {
                    ToolTip = 'Specifies the value of the VALUE_ID field.', Comment = '%';
                }
                field(VALUE; Rec."VALUE")
                {
                    ToolTip = 'Specifies the value of the VALUE field.', Comment = '%';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.', Comment = '%';
                }
            }
        }
    }
}
