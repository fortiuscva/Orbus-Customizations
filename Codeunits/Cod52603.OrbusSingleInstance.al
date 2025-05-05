codeunit 52603 "ORB Orbus Single Instance"
{
    SingleInstance = true;
    trigger OnRun()
    begin

    end;

    procedure SetOnSendCustomerRecordsOnBeforeLookupProfile(ShowDialog: Boolean)
    begin
        ShowDialogLookupProfileVarGbl := ShowDialog;

    end;

    procedure GetOnSendCustomerRecordsOnBeforeLookupProfile(): Boolean
    begin
        exit(ShowDialogLookupProfileVarGbl);
    end;

    procedure SetOnBeforeSendEmailToCust(ShowDialog: Boolean)
    begin
        ShowDialogSendEmailToCustVarGbl := ShowDialog;

    end;

    procedure GetOnBeforeSendEmailToCust(): Boolean
    begin
        exit(ShowDialogSendEmailToCustVarGbl);
    end;

    procedure SetOnBeforeSendEmail(ShowDialog: Boolean)
    begin
        HideDialogOnBeforeSendEmailVarGbl := ShowDialog;

    end;

    procedure GetOnBeforeSendEmail(): Boolean
    begin
        exit(HideDialogOnBeforeSendEmailVarGbl);
    end;

    procedure SetOnBeforeCheckShowProfileSelectionMethodDialog(ProfileSelectionMethod: Integer; IsHandled: Boolean; Result: Boolean)
    begin
        ProfileSelectionMethodVarGbl := ProfileSelectionMethod;
        IsHandledVarGbl := IsHandled;
        ResultVarGbl := Result;
    end;

    procedure GetOnBeforeCheckShowProfileSelectionMethod(): Integer
    begin
        exit(ProfileSelectionMethodVarGbl);
    end;

    procedure GetOnBeforeCheckShowProfileSelectionMethodIshandled(): Boolean
    begin
        exit(IsHandledVarGbl);
    end;

    procedure GetOnBeforeCheckShowProfileSelectionMethodResult(): Boolean
    begin
        exit(ResultVarGbl);
    end;

    procedure SetEmailSendFromCustomerCardButton(SendEmail: Boolean)
    begin
        SendEmailVarGbl := SendEmail;
    end;

    procedure GetEmailSendFromCustomerCardButton(): Boolean
    begin
        exit(SendEmailVarGbl);
    end;

    procedure SetExplodeBOMConfirm(ExplodeConfirm: Boolean)
    begin
        ExplodeConfirmVarGbl := ExplodeConfirm;
    end;

    procedure GetExplodeBOMConfirm(): Boolean
    begin
        exit(ExplodeConfirmVarGbl);
    end;

    procedure SetHandlingPrice(Handling: Decimal)
    begin
        HandlingGbl := Handling;
    end;

    procedure GetHandlingPrice(): Decimal
    begin
        exit(HandlingGbl);
    end;

    procedure SetFrieghtPrice(FrieghtCost: Decimal)
    begin
        FrieghtCostGbl := FrieghtCost;
    end;

    procedure GetFrieghtPrice(): Decimal
    begin
        exit(FrieghtCostGbl);
    end;

    procedure GetMarkupAmountPrice(): Decimal
    begin
        exit(MarkupAmountGbl);
    end;

    procedure SetFreightQuote(FreightQuote: Decimal)
    begin
        FreightQuoteGbl := FreightQuote;
    end;

    procedure SetMarkupAmountPrice(MarkupAmount: Decimal)
    begin
        MarkupAmountGbl := MarkupAmount;
    end;

    procedure GetFreightQuote(): Decimal
    begin
        exit(FreightQuoteGbl);
    end;

    procedure SetLastCommandRan(LastCommand: Text)
    begin
        LastCommandRanGbl := LastCommand;
    end;

    procedure GetLastCommandRan(): Text
    begin
        exit(LastCommandRanGbl);
    end;

    procedure SetMarkupPercentage(MarkupPercentage: Decimal)
    begin
        MarkupPercentageGbl := MarkupPercentage
    end;

    procedure GetMarkupPercentage(): Decimal
    begin
        exit(MarkupPercentageGbl);
    end;

    procedure SetShippedNotInvoiced(ShippedNotInvoicedPar: Boolean)
    begin
        ShippedNotInvoicedGbl := ShippedNotInvoicedPar;
    end;

    procedure GetShippedNotInvoiced(): Boolean
    begin
        exit(ShippedNotInvoicedGbl);
    end;

    procedure Reset()
    begin
        ClearAll();
    end;

    procedure SetWarehouseActivity(FirstActivityNo: Code[20]; LastActivityNo: Code[20])
    begin
        FirstActivityNoGbl := FirstActivityNo;
        LastActivityNoGbl := LastActivityNo;
    end;

    procedure GetWarehouseActivity(var FirstActivityNo: Code[20]; var LastActivityNo: Code[20])
    begin
        FirstActivityNo := FirstActivityNoGbl;
        LastActivityNo := LastActivityNoGbl;
    end;

    procedure SetRunFromOrderConfirmation(SetRunFromOrderConfirmationPar: Boolean)
    begin
        SetRunFromOrderConfirmationGbl := SetRunFromOrderConfirmationPar;
    end;

    procedure GetRunFromOrderConfirmation(): Boolean
    begin
        exit(SetRunFromOrderConfirmationGbl);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterCopyToTempLines, '', false, false)]
    local procedure "Sales-Post_OnAfterCopyToTempLines"(var TempSalesLine: Record "Sales Line" temporary; SalesHeader: Record "Sales Header")
    var
        SalesCommentLine: Record "Sales Comment Line";
        HighestLineNo: Integer;
    begin
        if GetRunFromOrderConfirmation then begin
            if TempSalesLine.FindSet() then
                repeat
                    HighestLineNo := TempSalesLine."Line No.";

                    SalesCommentLine.Reset();
                    SalesCommentLine.SetRange("Document Type", TempSalesLine."Document Type");
                    SalesCommentLine.SetRange("No.", TempSalesLine."Document No.");
                    SalesCommentLine.SetRange("Document Line No.", TempSalesLine."Line No.");
                    if SalesCommentLine.FindSet() then
                        repeat
                            TempSalesLine.Init();
                            TempSalesLine."Document No." := SalesCommentLine."No.";
                            TempSalesLine."Line No." := HighestLineNo + 1;
                            HighestLineNo := TempSalesLine."Line No.";
                            TempSalesLine.Description := SalesCommentLine.Comment;
                            TempSalesLine.Insert();
                        until SalesCommentLine.Next() = 0;
                until TempSalesLine.Next() = 0;
        end;

    end;

    var
        ShowDialogLookupProfileVarGbl: Boolean;
        ShowDialogSendEmailToCustVarGbl: Boolean;
        HideDialogOnBeforeSendEmailVarGbl: Boolean;
        ProfileSelectionMethodVarGbl: Integer;
        IsHandledVarGbl: Boolean;
        ResultVarGbl: Boolean;
        SendEmailVarGbl: Boolean;
        ExplodeConfirmVarGbl: Boolean;
        ExplodeBOMExecutionVarGbl: Boolean;
        HandlingGbl: Decimal;
        FrieghtCostGbl: Decimal;
        FreightQuoteGbl: Decimal;
        LastCommandRanGbl: Text;
        MarkupPercentageGbl: Decimal;
        ShippedNotInvoicedGbl: Boolean;
        MarkupAmountGbl: Decimal;
        FirstActivityNoGbl: Code[20];
        LastActivityNoGbl: Code[20];
        SetRunFromOrderConfirmationGbl: Boolean;
}