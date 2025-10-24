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

    procedure SetRunFromOrderConfirmation(RunFromOrderConfirmationPar: Boolean)
    begin
        RunFromOrderConfirmationGbl := RunFromOrderConfirmationPar;
    end;

    procedure GetRunFromOrderConfirmation(): Boolean
    begin
        exit(RunFromOrderConfirmationGbl);
    end;

    procedure SetWarehousePickLocationCode(pLocationCode: Code[20])
    begin
        LocationCode := pLocationCode;
    end;

    procedure GetWarehousePickLocationCode(): Code[20]
    begin
        exit(LocationCode);
    end;

    procedure SetSuppressWhseConfirm(Value: Boolean)
    begin
        SuppressWhseRegisterConfirm := Value;
    end;

    procedure GetSuppressWhseConfirm(): Boolean
    begin
        exit(SuppressWhseRegisterConfirm);
    end;

    procedure SetSuppressItemJnlConfirm(Value: Boolean)
    begin
        SuppressItemJnlConfirm := Value;
    end;

    procedure GetSuppressItemJnlConfirm(): Boolean
    begin
        exit(SuppressItemJnlConfirm);
    end;

    procedure SetStopOnError(Value: Boolean)
    begin
        StopOnError := Value;
    end;

    procedure GetStopOnError(): Boolean
    begin
        exit(StopOnError);
    end;

    procedure SetCampaignNo(CampaignNo: Code[20])
    begin
        CampaignNoGbl := CampaignNo;
    end;

    procedure GetCampaignNo(): Code[20]
    begin
        exit(CampaignNoGbl);
    end;

    procedure SetShipToAddressFields(ShipToNamePar: Text[100]; ShipToAddressPar: Text[100]; ShipToAddress2Par: Text[50]; ShipToCityPar: Text[30]; ShipToStatePar: Text[30]; ShipToCountryRegionPar: Code[10]; ShipToPostCodePar: Code[20]; ShipToContactPar: Text[100])
    begin
        ShipToNameGbl := ShipToNamePar;
        ShipToAddressGbl := ShipToAddressPar;
        ShipToAddress2Gbl := ShipToAddress2Par;
        ShipToCityGbl := ShipToCityPar;
        ShipToStateGbl := ShipToStatePar;
        ShipToCountryRegionCodeGbl := ShipToCountryRegionPar;
        ShipToPostCodeGbl := ShipToPostCodePar;
        ShipToContactGbl := ShipToContactPar;
    end;

    procedure GetShipToName(): Text[100]
    begin
        exit(ShipToNameGbl);
    end;

    procedure GetShipToAddress(): Text[100]
    begin
        exit(ShipToAddressGbl);
    end;

    procedure GetShipToAddress2(): Text[50]
    begin
        exit(ShipToAddress2Gbl);
    end;

    procedure GetShipToCity(): Text[30]
    begin
        exit(ShipToCityGbl);
    end;

    procedure GetShipToState(): Text[30]
    begin
        exit(ShipToStateGbl);
    end;

    procedure GetShipToCountryRegionCode(): Code[10]
    begin
        exit(ShipToCountryRegionCodeGbl);
    end;

    procedure GetShipToPostCode(): Code[20]
    begin
        exit(ShipToPostCodeGbl);
    end;

    procedure GetShipToContact(): Text[100]
    begin
        exit(ShipToContactGbl);
    end;

    procedure SetBinContentExistBefore(ExistBeforeFilterPar: Boolean)
    begin
        ExistBeforeFilter := ExistBeforeFilterPar;
    end;

    procedure GetBinContentExistBefore(): Boolean
    begin
        exit(ExistBeforeFilter);
    end;

    procedure SetBinContentExistAfter(ExistAfterFilterPar: Boolean)
    begin
        ExistAfterFilter := ExistAfterFilterPar;
    end;

    procedure GetBinContentExistAfter(): Boolean
    begin
        exit(ExistAfterFilter);
    end;

    procedure SetModifyByCustomerV2API(CanModifyCRS: Boolean)
    begin
        ModifyCRS := CanModifyCRS;
    end;

    procedure GetModifyByCustomerV2API(): Boolean
    begin
        exit(ModifyCRS);
    end;

    procedure SetAutoPickPrint(AutoPickPrintpar: Boolean)
    begin
        AutoPickPrint := AutoPickPrintpar;
    end;

    procedure GetAutoPickPrint(): Boolean
    begin
        exit(AutoPickPrint);
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
        RunFromOrderConfirmationGbl: Boolean;
        LocationCode: Code[20];
        SuppressWhseRegisterConfirm: Boolean;
        SuppressItemJnlConfirm: Boolean;
        StopOnError: Boolean;
        CampaignNoGbl: Code[20];
        ShipToNameGbl: Text[100];
        ShipToAddressGbl: Text[100];
        ShipToAddress2Gbl: Text[50];
        ShipToCityGbl: Text[30];
        ShipToStateGbl: Text[30];
        ShipToCountryRegionCodeGbl: Code[10];
        ShipToPostCodeGbl: Code[20];
        ShipToContactGbl: Text[100];
        ExistBeforeFilter: Boolean;
        ExistAfterFilter: Boolean;
        ModifyCRS: Boolean;
        AutoPickPrint: Boolean;

}