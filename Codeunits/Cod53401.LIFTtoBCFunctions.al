codeunit 53401 "ORB LIFTtoBC Functions"
{
    procedure IsValidValue(TargetDatatype: enum "ORB LIFT BC Datatypes"; TargetValue: Text): Boolean
    var
        CodeLcl: Code[20];
        TextLcl: Text;
        IntegerLcl: Integer;
        DecimalLcl: Decimal;
        DateLcl: Date;
        BooleanLcl: Boolean;
    begin
        if (TargetValue = '') or (TargetValue = 'null') then
            exit(false);
        case TargetDatatype of
            BCDatatypes::Code:
                exit(Evaluate(CodeLcl, TargetValue));
            BCDatatypes::Text:
                exit(Evaluate(TextLcl, TargetValue));
            BCDatatypes::Integer:
                exit(Evaluate(IntegerLcl, TargetValue));
            BCDatatypes::Decimal:
                exit(Evaluate(DecimalLcl, TargetValue));
            BCDatatypes::Date:
                exit(Evaluate(DateLcl, TargetValue));
            BCDatatypes::Boolean:
                exit(Evaluate(BooleanLcl, TargetValue));
        end;
    end;

    procedure PostLIFTInventoryTransactions(SalesHeaderRec: Record "Sales Header")
    var
        SalesHeaderLcl: Record "Sales Header";
    begin
        SalesHeaderLcl.SetRange("Document Type", SalesHeaderRec."Document Type");
        SalesHeaderLcl.SetRange("No.", SalesHeaderRec."No.");
        if SalesHeaderLcl.FindFirst() then
            Report.RunModal(Report::"ORB Post LIFT Transactions", true, false, SalesHeaderLcl);
    end;

    procedure OpenWhseTransactions(SalesHeaderRecLcl: Record "Sales Header")
    var
        WhseTransaByIdQry: Query "ORB LIFT Whse. Trans. By Id";
        TransactionIDvar: Text;
        WarehouseEntryRec: Record "Warehouse Entry";
    begin
        WhseTransaByIdQry.SetRange(SourceNo, SalesHeaderRecLcl."No.");
        WhseTransaByIdQry.Open();
        while WhseTransaByIdQry.Read() do begin
            if TransactionIDvar = '' then
                TransactionIDvar := Format(WhseTransaByIdQry.TransactionID)
            else
                TransactionIDvar += '|' + Format(WhseTransaByIdQry.TransactionID);
        end;

        if TransactionIDvar = '' then
            TransactionIDvar := '-1';

        WarehouseEntryRec.Reset();
        WarehouseEntryRec.SetFilter("ORB LIFT Inv. Transaction ID", TransactionIDvar);
        Page.RunModal(Page::"Warehouse Entries", WarehouseEntryRec);
    end;

    procedure OpenILETransactions(SalesHeaderRecLcl: Record "Sales Header")
    var
        ItemLedgerEntryRecLcl: Record "Item Ledger Entry";
    begin
        ItemLedgerEntryRecLcl.Reset();
        ItemLedgerEntryRecLcl.SetRange("Document No.", SalesHeaderRecLcl."No.");
        Page.RunModal(Page::"Item Ledger Entries", ItemLedgerEntryRecLcl);
    end;

    procedure OpenInventoryTransactionLog(SalesOrderNumber: Code[20])
    var
        LiftIntegrationDataLogLcl: Record "ORB LIFT Integration Data Log";
    begin
        LiftIntegrationDataLogLcl.Reset();
        LiftIntegrationDataLogLcl.SetRange("Source Type", 7311);
        LiftIntegrationDataLogLcl.SetRange("Source No.", SalesOrderNumber);
        Page.RunModal(Page::"ORB LIFT Inv. Transactions Log", LiftIntegrationDataLogLcl);
    end;

    procedure GetWhseCount(SalesHeaderRec: Record "Sales Header"): Integer
    var
        WhseTransQry: Query "ORB LIFT Whse. Trans. By Id";
        TransactionIDvar: Text;
        WarehouseEntryRec: Record "Warehouse Entry";
    begin
        WhseTransQry.SetRange(SourceNo, SalesHeaderRec."No.");
        WhseTransQry.Open();
        while WhseTransQry.Read() do begin
            if TransactionIDvar = '' then
                TransactionIDvar := Format(WhseTransQry.TransactionID)
            else
                TransactionIDvar += '|' + Format(WhseTransQry.TransactionID);
        end;
        WhseTransQry.Close();

        if TransactionIDvar = '' then
            TransactionIDvar := '-1';

        WarehouseEntryRec.SetFilter("ORB LIFT Inv. Transaction ID", TransactionIDvar);
        exit(WarehouseEntryRec.Count());
    end;

    procedure GetILECount(SalesHeaderRec: Record "Sales Header"): Integer
    var
        ILE: Record "Item Ledger Entry";
    begin
        ILE.SetRange("Document No.", SalesHeaderRec."No.");
        exit(ILE.Count());
    end;

    procedure GetIntegrationLogCount(SalesHeaderRec: Record "Sales Header"): Integer
    var
        IntegrationLog: Record "ORB LIFT Integration Data Log";
    begin
        IntegrationLog.SetRange("Source No.", SalesHeaderRec."No.");
        exit(IntegrationLog.Count());
    end;

    procedure ValidateRestrictedLineChanges(SalesLine: Record "Sales Line"; xSalesLine: Record "Sales Line")
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.Get(SalesLine."Document Type", SalesLine."Document No.");

        if not SalesHeader."ORB Lift Order" then
            exit;

        if (SalesLine."Unit Price" <> xSalesLine."Unit Price") or
           (SalesLine."Line Discount %" <> xSalesLine."Line Discount %") or
           (SalesLine."Line Discount Amount" <> xSalesLine."Line Discount Amount")
        then
            SalesHeader.TestField("ORB Lift Order", false);
    end;

    procedure NotifyErrorsWhilePostingLIFTInventoryTranscations(SalesHeader: Record "Sales Header"; WhichStep: Text; ErrorMessage: Text)
    var
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
        LIFTERPSetup: Record "ORB LIFT ERP Setup";
        EmailScenario: Enum "Email Scenario";
        EmailSubject: Text;
    begin
        LIFTERPSetup.Get();
        EmailSubject := 'Error Notification while Posting LIFT Inventory Transactions at ' + WhichStep + ' Step' + 'for Sales Order ' + SalesHeader."No.";
        EmailMessage.Create(LIFTERPSetup."JQ Error Notification Email", EmailSubject, ErrorMessage, true);
        Email.Send(EmailMessage, EmailScenario::Default);
    end;

    procedure StartJobQueueLogEntry(ProcessID: Integer; ProcessDescription: Text[100]): Integer
    var
        EntryNo: Integer;
    begin
        Clear(EntryNo);
        LIFTPostInvTransactionLog.Reset();
        if LIFTPostInvTransactionLog.FindLast() then
            EntryNo := LIFTPostInvTransactionLog."Entry No." + 1
        else
            EntryNo := 1;

        LIFTPostInvTransactionLog.Init();
        LIFTPostInvTransactionLog.Validate("Entry No.", EntryNo);
        LIFTPostInvTransactionLog.Insert();
        LIFTPostInvTransactionLog.Validate("Process ID", ProcessID);
        LIFTPostInvTransactionLog.Validate("Process Description", ProcessDescription);
        LIFTPostInvTransactionLog.Validate("Start Date & Time", CurrentDateTime);
        LIFTPostInvTransactionLog.Modify();
        exit(EntryNo);
    end;

    procedure EndJobQueueLogEntry(EntryNo: Integer; ErrorMsg: Text[250])
    begin
        LIFTPostInvTransactionLog.Reset();
        if LIFTPostInvTransactionLog.Get(EntryNo) then begin
            LIFTPostInvTransactionLog.Validate("Error Message", ErrorMsg);
            LIFTPostInvTransactionLog.Validate("End Date & Time", CurrentDateTime);
            LIFTPostInvTransactionLog.Modify();
        end;
    end;


    var
        BCDatatypes: enum "ORB LIFT BC Datatypes";
        LIFTPostInvTransactionLog: Record "LIFT Post Inv Transactions Log";

}
