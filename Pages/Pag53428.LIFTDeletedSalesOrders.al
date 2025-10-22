page 53428 "ORB LIFT Deleted Sales Orders"
{
    ApplicationArea = All;
    Caption = 'ORB LIFT Deleted Sales Orders';
    PageType = List;
    SourceTable = "ORB LIFT Deleted Sales Orders";
    UsageCategory = Lists;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field.', Comment = '%';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = '%';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.', Comment = '%';
                }
                field("LIFT Line No."; Rec."LIFT Line No.")
                {

                }
                field("Exported to LIFT"; Rec."Exported to LIFT")
                {
                    ToolTip = 'Specifies the value of the Exported to LIFT field.', Comment = '%';
                }
                field("API Result"; Rec."API Result")
                {

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Send to LIFT")
            {
                ApplicationArea = all;
                trigger OnAction()
                var
                    LIFTUpdateSOCU: Codeunit "ORB LIFT Update SO Status";
                begin
                    LIFTUpdateSOCU.IntegrateSOShipAndInvoiceStatus();
                end;
            }
        }
    }
}
