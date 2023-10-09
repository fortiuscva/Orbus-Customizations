pageextension 52614 "ORB Sales Order" extends "Sales Order"
{
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

                    if EFTTransactionRecLcl."Transaction Amount" < 0 then
                        Error(NoValidCreditCardErrorLbl);
                end;

            end;
        }
    }
}
