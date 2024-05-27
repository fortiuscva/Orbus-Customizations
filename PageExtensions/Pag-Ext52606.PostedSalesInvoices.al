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