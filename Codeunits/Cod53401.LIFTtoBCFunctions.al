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

    var
        BCDatatypes: enum "ORB LIFT BC Datatypes";
}
