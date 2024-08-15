pageextension 52615 "ORB Sales Order" extends "Sales Order"
{
    layout
    {
        addlast(General)
        {
            field("ORB Tax ID"; Rec."ORB Tax ID")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Tax ID of Sales';
            }
            field("ORB Declared Value"; Rec."ORB Declared Value")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Declared Value of Sales';
            }
            field("ORB International Contact"; Rec."ORB International Contact")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the International Contact of Sales';
            }
            field("Magento Order #"; Rec."ORB Magento Order #")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Magento Order # of Sales';
            }
            // field("ORB Magento Artwork Job ID"; Rec."ORB Magento Artwork Job ID")
            // {
            //     ApplicationArea = all;
            //     ToolTip = 'Specifies the Magento Artwork Job ID of Sales';
            // }
            field("ORB Magento CC 4 Digits"; Rec."ORB Magento CC 4 Digits")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Magento CC 4 Digits of Sales';
            }
            field("ORB On Hold"; Rec."On Hold")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies if the document was put on hold when it was posted, for example because payment of the resulting customer ledger entries is overdue.';
            }
            field("ORB Require Review"; Rec."ORB Require Review")
            {
                ApplicationArea = All;
            }
            field("ORB Magento Location Code"; Rec."ORB Magento Location Code")
            {
                ApplicationArea = All;
                Editable = false;
                Visible = false;
            }
            field("ORB RUSH"; Rec."ORB RUSH")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the value of the RUSH field.';
            }
            field("ORB Escalation Reason"; Rec."ORB Escalation Reason Code")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the reasons for escalation';
            }
            field("ORB Resolved By"; Rec."ORB Resolved By")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the user who resolved escalated issue';
            }
            field("ORB Original Promised Ship Dt."; Rec."ORB Original Promised Ship Dt.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies Original Ship. Date';
                Editable = false;
            }

            field("ORB Delayed Ship Reason Code"; Rec."ORB Delayed Ship Reason Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies reasons for delayed shipment';

            }
            field("ORB Delayed Ship Sub-Reason"; Rec."ORB Delayed Ship Sub-Reason")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the sub-reason code for Shipment Delay';
            }
        }
        modify("Payment Terms Code")
        {
            trigger OnBeforeValidate()
            var
                UserSetupRecLcl: Record "User Setup";
                AccessNotallowedlbl: Label '%1 does not have the permission to access';
            begin
                if UserSetupRecLcl.get(UserId) then begin
                    if UserSetupRecLcl."ORB PT on SO Not allowed" then
                        Error(AccessNotallowedlbl, UserId);
                end;
            end;
        }
        modify("Order Status")
        {
            trigger OnAfterValidate()
            begin
                CurrPage.Update(true);
            end;
        }


    }
    actions
    {
        modify(Release)
        {
            trigger OnBeforeAction()
            var
                EFTTransactionRecLcl: Record "EFT Transaction -CL-";
                PaymentMethodLbl: label 'CREDITCARD';
                NoValidCreditCardErrorLbl: Label 'No Valid Credit Card Authorization Charged, Please Authorize Valid Credit Card to Release Sales Order.';
            begin
                rec.CalcFields("Amount Including VAT");
                if rec."Amount Including VAT" > 0 then
                    if rec."Payment Method Code" = PaymentMethodLbl then begin
                        EFTTransactionRecLcl.Reset();
                        EFTTransactionRecLcl.SetRange("Document Type", rec."Document Type");
                        EFTTransactionRecLcl.SetRange("Document No.", rec."No.");
                        //Charge|Settle|Capture|Refund|Credit|Return Settle|Authorize|Return Authorize|Voice Authorize

                        EFTTransactionRecLcl.SetFilter("Method Type", '%1|%2|%3|%4|%5|%6|%7|%8|%9', EFTTransactionRecLcl."Method Type"::Charge, EFTTransactionRecLcl."Method Type"::Settle,
                        EFTTransactionRecLcl."Method Type"::Capture, EFTTransactionRecLcl."Method Type"::Refund, EFTTransactionRecLcl."Method Type"::Credit, EFTTransactionRecLcl."Method Type"::"Return Settle",
                        EFTTransactionRecLcl."Method Type"::Authorize, EFTTransactionRecLcl."Method Type"::"Return Authorize", EFTTransactionRecLcl."Method Type"::"Voice Authorize");

                        EFTTransactionRecLcl.Setfilter("Transaction Status", '%1|%2|%3', EFTTransactionRecLcl."Transaction Status"::Queued, EFTTransactionRecLcl."Transaction Status"::Batched,
                        EFTTransactionRecLcl."Transaction Status"::Approved);
                        EFTTransactionRecLcl.SetFilter("Expiration Filter", '<%1', WorkDate());
                        EFTTransactionRecLcl.CalcSums("Transaction Amount");

                        if EFTTransactionRecLcl."Transaction Amount" <= 0 then
                            Error(NoValidCreditCardErrorLbl);
                    end;

            end;
        }
        modify("Release & Pick")
        {
            trigger OnBeforeAction()
            var
                EFTTransactionRecLcl: Record "EFT Transaction -CL-";
                PaymentMethodLbl: label 'CREDITCARD';
                NoValidCreditCardErrorLbl: Label 'No Valid Credit Card Authorization Charged, Please Authorize Valid Credit Card to Release Sales Order.';
            begin
                rec.CalcFields("Amount Including VAT");
                if rec."Amount Including VAT" > 0 then
                    if rec."Payment Method Code" = PaymentMethodLbl then begin
                        EFTTransactionRecLcl.Reset();
                        EFTTransactionRecLcl.SetRange("Document Type", rec."Document Type");
                        EFTTransactionRecLcl.SetRange("Document No.", rec."No.");
                        //Charge|Settle|Capture|Refund|Credit|Return Settle|Authorize|Return Authorize|Voice Authorize

                        EFTTransactionRecLcl.SetFilter("Method Type", '%1|%2|%3|%4|%5|%6|%7|%8|%9', EFTTransactionRecLcl."Method Type"::Charge, EFTTransactionRecLcl."Method Type"::Settle,
                        EFTTransactionRecLcl."Method Type"::Capture, EFTTransactionRecLcl."Method Type"::Refund, EFTTransactionRecLcl."Method Type"::Credit, EFTTransactionRecLcl."Method Type"::"Return Settle",
                        EFTTransactionRecLcl."Method Type"::Authorize, EFTTransactionRecLcl."Method Type"::"Return Authorize", EFTTransactionRecLcl."Method Type"::"Voice Authorize");

                        EFTTransactionRecLcl.Setfilter("Transaction Status", '%1|%2|%3', EFTTransactionRecLcl."Transaction Status"::Queued, EFTTransactionRecLcl."Transaction Status"::Batched,
                        EFTTransactionRecLcl."Transaction Status"::Approved);
                        EFTTransactionRecLcl.SetFilter("Expiration Filter", '<%1', WorkDate());
                        EFTTransactionRecLcl.CalcSums("Transaction Amount");

                        if EFTTransactionRecLcl."Transaction Amount" <= 0 then
                            Error(NoValidCreditCardErrorLbl);
                    end;

            end;
        }
        modify("Create &Warehouse Shipment")
        {
            trigger OnBeforeAction()
            var
                OrbusEventSubscribers: Codeunit "ORB Orbus Event & Subscribers";
            begin
                OrbusFunctions.RestrictZeroTransactionAmountforCreditCardPayment(rec);
            end;
        }
        modify("Create Inventor&y Put-away/Pick")
        {
            trigger OnBeforeAction()
            var
                OrbusEventSubscribers: Codeunit "ORB Orbus Event & Subscribers";
            begin
                OrbusFunctions.RestrictZeroTransactionAmountforCreditCardPayment(rec);
            end;
        }
        addafter("S&hipments")
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
    }

    var
        OrbusFunctions: Codeunit "ORB Functions";
}