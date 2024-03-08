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
            field("Magento Order #"; Rec."Magento Order #")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Magento Order # of Sales';
            }
            field("ORB Magento Artwork Job ID"; Rec."ORB Magento Artwork Job ID")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Magento Artwork Job ID of Sales';
            }
            field("ORB Magento CC 4 Digits"; Rec."ORB Magento CC 4 Digits")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Magento CC 4 Digits of Sales';
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
    }

    var
        OrbusFunctions: Codeunit "ORB Functions";
}