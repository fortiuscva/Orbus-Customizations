page 52607 "ORB Posted Sales Invoices WS"
{
    ApplicationArea = All;
    Caption = 'Posted Sales Invoices WS';
    PageType = List;
    SourceTable = "Sales Invoice Header";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the record.';
                    ApplicationArea = all;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ToolTip = 'Specifies the number of the customer the invoice concerns.';
                    ApplicationArea = All;
                }
                field("Order No."; Rec."Order No.")
                {
                    ToolTip = 'Specifies the number of the sales order that this invoice was posted from.';
                    ApplicationArea = All;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ToolTip = 'Specifies the external document number that is entered on the sales header that this line was posted from.';
                    ApplicationArea = All;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies when the posted sales invoice was created.';
                    ApplicationArea = All;
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ToolTip = 'Specifies the customer''s name.';
                    ApplicationArea = All;
                }
                field("Sell-to E-Mail"; Rec."Sell-to E-Mail")
                {
                    ToolTip = 'Specifies the value of the Email field.';
                    ApplicationArea = All;
                }
                field("Sell-to Contact"; Rec."Sell-to Contact")
                {
                    ToolTip = 'Specifies the name of the contact person at the customer the invoice was sent to.';
                    ApplicationArea = All;
                }
                field(Custom; Rec.Custom)
                {
                    ToolTip = 'Specifies the Custom field.';
                    ApplicationArea = all;
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the Amount for the Invoice excluding Tax';
                    ApplicationArea = all;
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ToolTip = 'Specifies which salesperson is associated with the invoice.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
