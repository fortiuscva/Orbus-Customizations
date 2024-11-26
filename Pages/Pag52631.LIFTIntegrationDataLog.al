page 52631 "ORB LIFT Integration Data Log"
{
    ApplicationArea = All;
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
                field("Transaction ID"; Rec."Transaction ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Transaction ID field.', Comment = '%';
                }
            }
        }
    }
}
