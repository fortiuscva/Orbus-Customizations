page 52631 "ORB LIFT Integration Data Log"
{
    Caption = 'LIFT Integration Data Log';
    PageType = List;
    SourceTable = "ORB LIFT Integration Data Log";
    UsageCategory = Lists;
    // Editable = false;

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
                field("Source Type"; Rec."Source Type")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Source Type field.', Comment = '%';
                }
                field("Source Subtype"; Rec."Source Subtype")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Source Subtype field.', Comment = '%';
                }
                field("Source No."; Rec."Source No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Source No. field.', Comment = '%';
                }
                field("Source Line No."; Rec."Source Line No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Source Line No. field.', Comment = '%';
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Entry Type field.', Comment = '%';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Item No. field.', Comment = '%';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Quantity field.', Comment = '%';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Unit Cost field.', Comment = '%';
                }
                field("Unit Of Measure"; Rec."Unit Of Measure")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Unit Of Measure field.', Comment = '%';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Posting Date field.', Comment = '%';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Location Code field.', Comment = '%';
                }
                field("Transaction ID"; Rec."Transaction ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Transaction ID field.', Comment = '%';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.', Comment = '%';
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

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        if UserId <> 'BCADMIN' then
            Error('Unauthorized access');
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if UserId <> 'BCADMIN' then
            Error('Unauthorized access');
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        if UserId <> 'BCADMIN' then
            Error('Unauthorized access');
    end;
}
