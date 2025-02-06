pageextension 52643 "ORB Sales Return Order List" extends "Sales Return Order List"
{
    layout
    {
        addlast(Control1)
        {
            /* field("ORB Your Reference"; Rec."Your Reference")
            {
                ApplicationArea = ALL;
                ToolTip = 'Specifies the reference for the returns';
            } */

            field("ORB Your Reference(CS)"; Rec."ORB Your Reference(CS)")
            {
                ApplicationArea = ALL;
                ToolTip = 'Specifies the reference for the returns';
            }

        }
    }
    actions
    {
        addafter("&Print")
        {
            action("ORB Send Return Order Email")
            {
                ApplicationArea = all;
                Caption = 'Send Return Order Email';
                Ellipsis = true;
                Image = Email;
                ToolTip = 'Send a Sales Return Order by email. The attachment is sent as a .pdf.';

                trigger OnAction()
                begin
                    DocPrint.EmailSalesHeader(Rec);
                end;
            }
        }
        addafter("&Print_Promoted")
        {
            actionref("Send Return Order Email_Promoted"; "ORB Send Return Order Email")
            {
            }
        }
    }
    var
        DocPrint: Codeunit "Document-Print";
}