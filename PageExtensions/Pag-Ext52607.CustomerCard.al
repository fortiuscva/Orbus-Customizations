pageextension 52607 "ORB Customer Card" extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
        {
            field("ORB Auto Send Email"; Rec."ORB Auto Send Email")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies Auto Send Email from JQ for the customer';
            }
        }
    }
    actions
    {
        addlast(processing)
        {
            action("ORB Send Email")
            {
                Image = Email;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = all;
                Caption = 'Send Invoices Email';

                trigger OnAction()
                var
                    CustomerRecLcl: Record Customer;
                begin
                    CustomerRecLcl.Reset();
                    CustomerRecLcl.SetRange("No.", Rec."No.");
                    if CustomerRecLcl.FindFirst() then
                        report.RunModal(52602, true, false, CustomerRecLcl);

                end;
            }
            action("ORB Export Invoice Email Setup Issues")
            {
                Image = Email;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = all;
                Caption = 'Export Invoice Email Setup Issues';
                RunObject = report "Exp. Inv. Email Setup Issues";
            }
        }
    }
}