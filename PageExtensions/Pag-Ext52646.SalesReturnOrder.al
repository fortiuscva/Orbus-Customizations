pageextension 52646 "ORB Sales Return Order" extends "Sales Return Order"
{
    layout
    {
        addafter("Posting Date")
        {
            field("ORB Your Reference(CS)"; Rec."ORB Your Reference(CS)")
            {
                Caption = 'Your Reference(CS)';
                ApplicationArea = All;
                ToolTip = 'Specifies Your Reference';

            }
        }
        modify("Your Reference")
        {
            Caption = 'Versapay ID';
            Editable = False;
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
        myInt: Integer;
        DocPrint: Codeunit "Document-Print";
}