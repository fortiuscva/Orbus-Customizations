pageextension 52624 "ORB Sales Order List" extends "Sales Order List"
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
            field("ORB Escalation Reason Code"; Rec."ORB Escalation Reason Code")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the issue that is stopping the order release';

            }
            field("ORB Resolved By"; Rec."ORB Resolved By")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the user who resolved the escalated reason';
            }
            field("ORB Total Payment Amount"; Rec."ORB Total Payment Amount")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Total Payment Amount Field value';
            }
            field("ORB Freight Line"; Rec."ORB Freight Line")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the field Freight Line value';
            }

        }
        addlast(Control1)
        {
            field("ORB DS Payment Account No."; Rec."ORB DS Payment Account No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Payment Account No. field.', Comment = '%';
            }

            field("ORB DS Payment Type"; Rec."ORB DS Payment Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Payment Type field.', Comment = '%';
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
        }
    }
    actions
    {
        addlast("O&rder")
        {
            action("ORB Sales Header Additional Fields")
            {
                Caption = 'Additional Fields';
                Image = RelatedInformation;
                ApplicationArea = all;
                RunObject = page "ORB Sales Header Add. Fields";
                RunPageLink = "Document Type" = field("Document Type"), "No." = field("No.");
            }

        }
        modify("Release & Pick")
        {

            trigger OnBeforeAction()
            var
                SalesHeaderRecLcl: Record "Sales Header";
            begin
                CurrPage.SetSelectionFilter(SalesHeaderRecLcl);
                SalesHeaderRecLcl.MarkedOnly(true);
                IF SalesHeaderRecLcl.FindSet() then
                    repeat
                        OrbusFunctions.RestrictZeroTransactionAmountforCreditCardPayment(SalesHeaderRecLcl);
                    Until SalesHeaderRecLcl.Next() = 0;

            end;
        }
    }
    var
        OrbusFunctions: Codeunit "ORB Functions";
}
