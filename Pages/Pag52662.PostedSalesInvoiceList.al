page 52662 "ORB Posted Sales Invoice List"
{
    ApplicationArea = All;
    Caption = 'ORB Posted Sales Invoices';
    PageType = List;
    SourceTable = "Sales Invoice Header";
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(SystemId; Rec.SystemId)
                {
                    Caption = 'Id';
                    ToolTip = 'Specifies the value of the SystemId field.', Comment = '%';
                }
                field("No."; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the number of the record.';
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    Caption = 'Customer No.';
                    ToolTip = 'Specifies the number of the customer the invoice concerns.';
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    Caption = 'Customer Name';
                    ToolTip = 'Specifies the customer''s name.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    Caption = 'Invoice Date';
                    ToolTip = 'Specifies when the posted sales invoice was created.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    Caption = 'Due Date';
                    ToolTip = 'Specifies when the sales invoices must be paid.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
                    ToolTip = 'Specifies the external document number that is entered on the sales header that this line was posted from.';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified DateTime';
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.', Comment = '%';
                }
            }
        }
    }
}
