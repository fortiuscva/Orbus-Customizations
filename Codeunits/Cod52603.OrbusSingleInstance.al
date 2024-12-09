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
        ShippedNotInvoicedGbl: Boolean;
        MarkupAmountGbl: Decimal;
        FirstActivityNoGbl: Code[20];
        LastActivityNoGbl: Code[20];
}