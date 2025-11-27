page 53442 "ORB LIFT Sales Price List"
{
    ApplicationArea = All;
    Caption = 'LIFT Sales Price List';
    PageType = List;
    SourceTable = "ORB LIFT Sales Price";
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Sales Type"; Rec."Sales Type")
                {
                    ToolTip = 'Specifies the value of the Sales Type field.', Comment = '%';
                }
                field("Sales Code"; Rec."Sales Code")
                {
                    ToolTip = 'Specifies the value of the Sales Code field.', Comment = '%';
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.', Comment = '%';
                }
                field("Unit Of Measure Code"; Rec."Unit Of Measure Code")
                {
                    ToolTip = 'Specifies the value of the Unit Of Measure Code field.', Comment = '%';
                }
                field("Minimum Quantity"; Rec."Minimum Quantity")
                {
                    ToolTip = 'Specifies the value of the Minimum Quantity field.', Comment = '%';
                }
                field("Maximum Quantity"; Rec."ORB LIFT Maximum Quantity")
                {
                    ToolTip = 'Specifies the value of the Maximum Quantity field.', Comment = '%';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the value of the Unit Price field.', Comment = '%';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ToolTip = 'Specifies the value of the Starting Date field.', Comment = '%';
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ToolTip = 'Specifies the value of the Ending Date field.', Comment = '%';
                }
                field("ORB LIFT Status"; Rec."ORB LIFT Status")
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field("Sent to Celigo"; Rec."Sent to Celigo")
                {
                    ToolTip = 'Specifies the value of the Sent to Celigo field.', Comment = '%';
                }
                field("To Be Processed"; Rec."To Be Processed")
                {
                    ToolTip = 'This field will be used to process sales price sync. in batches', Comment = '%';
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
