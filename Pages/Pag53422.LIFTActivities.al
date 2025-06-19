page 53422 "ORB LIFT Activities"
{
    PageType = CardPart;
    SourceTable = "Sales Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(Activities)
            {
                field("Post Inventory Transactions"; DummyText)
                {
                    ApplicationArea = All;
                    Caption = 'Post Inventory Transactions';
                    DrillDown = true;
                    ShowCaption = false;

                    trigger OnDrillDown()
                    var
                        SalesHeaderRecLcl: Record "Sales Header";
                    begin
                        SalesHeaderRecLcl.SetRange("Document Type", Rec."Document Type");
                        SalesHeaderRecLcl.SetRange("No.", Rec."No.");
                        if SalesHeaderRecLcl.FindFirst() then
                            Report.RunModal(Report::"ORB Post LIFT Transactions", true, false, SalesHeaderRecLcl);
                    end;
                }
            }
            group(History)
            {
                field("Warehouse Entry Count"; GetWhseCount())
                {
                    ApplicationArea = All;
                    Caption = 'Warehouse Entries';
                    DrillDown = true;

                    trigger OnDrillDown()
                    var
                        LIFTBCFunctionsCU: Codeunit "ORB LIFTtoBC Functions";
                    begin
                        LIFTBCFunctionsCU.OpenWhseTransactions(Rec);
                    end;
                }

                field("Item Ledger Entry Count"; GetILECount())
                {
                    ApplicationArea = All;
                    Caption = 'Item Ledger Entries';
                    DrillDown = true;

                    trigger OnDrillDown()
                    var
                        LIFTBCFunctionsCU: Codeunit "ORB LIFTtoBC Functions";
                    begin
                        LIFTBCFunctionsCU.OpenILETransactions(Rec);
                    end;
                }

                field("Integration Log Count"; GetLogCount())
                {
                    ApplicationArea = All;
                    Caption = 'Integration Data Logs';
                    DrillDown = true;

                    trigger OnDrillDown()
                    var
                        LIFTBCFunctionsCU: Codeunit "ORB LIFTtoBC Functions";
                    begin
                        LIFTBCFunctionsCU.OpenInventoryTransactionLog(Rec."No.");
                    end;
                }


            }
        }
    }


    var
        WhseTransQry: Query "ORB LIFT Whse. Trans. By Id";
        ILE: Record "Item Ledger Entry";
        WhseEntry: Record "Warehouse Entry";
        IntegrationLog: Record "ORB LIFT Integration Data Log";
        DummyText: Label 'Post Inventory Transactions';

    local procedure GetWhseCount(): Integer
    var
        TransactionIDvar: Text;
        EntryCount: Integer;
    begin
        WhseTransQry.SetRange(SourceNo, Rec."No.");
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

        WhseEntry.SetFilter("ORB LIFT Inv. Transaction ID", TransactionIDvar);
        EntryCount := WhseEntry.Count();
        exit(EntryCount);
    end;

    local procedure GetILECount(): Integer
    begin
        ILE.SetRange("Document No.", Rec."No.");
        exit(ILE.Count());
    end;

    local procedure GetLogCount(): Integer
    begin
        IntegrationLog.SetRange("Source No.", Rec."No.");
        exit(IntegrationLog.Count());
    end;
}
