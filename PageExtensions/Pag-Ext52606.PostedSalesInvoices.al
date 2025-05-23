pageextension 52606 "ORB Posted Sales Invoices" extends "Posted Sales Invoices"
{

    layout
    {
        addafter("No.")
        {
            field("ORB Magento Order #"; Rec."ORB Magento Order #")
            {
                ApplicationArea = all;
                ToolTip = 'Magento Order #';
            }
        }
        addlast(Control1)
        {
            field("ORB Email Sent by JQ"; Rec."ORB Email Sent by JQ")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Email Sent by JQ for the invoice';
            }
            field("ORB Email Sent Datetime"; Rec."ORB Last Email Sent DT")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Last Email Sent Date&Time for the invoice';
            }
            field("ORB Original Promised Ship Dt."; Rec."ORB Original Promised Ship Dt.")
            {
                ApplicationArea = ALL;
                ToolTip = 'Specifies the fist warehouse release date for the order';
                Editable = false;
            }
            field("ORB Delayed Ship Reason Code"; Rec."ORB Delayed Ship Reason Code")
            {
                ApplicationArea = ALL;
                ToolTip = 'Specifies the reason for shipment delay';
                Editable = false;
            }
            field("ORB Delayed Ship Sub-Reason"; Rec."ORB Delayed Ship Sub-Reason")
            {
                ApplicationArea = ALL;
                ToolTip = 'Specifies the sub-reason for shipment delay';
                Editable = false;
            }
            field("ORB Your Reference(CS)"; Rec."ORB Your Reference(CS)")
            {
                ApplicationArea = ALL;
                ToolTip = 'Specifies Your Reference';
                Editable = false;
            }
            field("ORB Customer Support"; Rec."ORB Customer Support")
            {
                Caption = 'Customer Support';
                ApplicationArea = All;
                Editable = false;
            }
            field("ORB Business Development"; Rec."ORB Business Development")
            {
                Caption = 'Business Development';
                ApplicationArea = All;
                Editable = false;
            }
        }
        modify("Your Reference")
        {
            Caption = 'Versapay ID';
        }

    }
    actions
    {

        addafter(Print)
        {
            action("ORB AutoSend")
            {
                ApplicationArea = all;
                Caption = 'AutoSend';
                Visible = false;
                ToolTip = 'Only for Developer use';
                trigger OnAction()
                var
                    AutoSendInvoice: Codeunit "ORB Auto Send Sales Invoices";
                    SalesInvHdr: Record "Sales Invoice Header";
                begin
                    AutoSendInvoice.Run();
                end;
            }
        }
    }

    var
        myInt: Integer;
}