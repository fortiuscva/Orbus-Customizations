page 52657 "LIFT Post Inv Transactions Log"
{
    ApplicationArea = All;
    Caption = 'LIFT Post Inv Transactions Log';
    PageType = List;
    SourceTable = "LIFT Post Inv Transactions Log";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.', Comment = '%';
                }
                field("Process ID"; Rec."Process ID")
                {
                    ToolTip = 'Specifies the value of the Process ID field.', Comment = '%';
                }
                field("Process Description"; Rec."Process Description")
                {
                    ToolTip = 'Specifies the value of the Process Description field.', Comment = '%';
                }
                field("Start Date & Time"; Rec."Start Date & Time")
                {
                    ToolTip = 'Specifies the value of the Start Date & Time field.', Comment = '%';
                }
                field("Error Message"; Rec."Error Message")
                {
                    ToolTip = 'Specifies the value of the Error Message field.', Comment = '%';
                }
                field("End Date & Time"; Rec."End Date & Time")
                {
                    ToolTip = 'Specifies the value of the End Date & Time field.', Comment = '%';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.', Comment = '%';
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.', Comment = '%';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.', Comment = '%';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.', Comment = '%';
                }
            }
        }
    }
}
