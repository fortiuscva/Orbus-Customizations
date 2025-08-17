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
                    Visible = false;

                    trigger OnDrillDown()
                    begin
                        LIFTBCFunctionsCU.PostLIFTInventoryTransactions(Rec);
                    end;
                }
                field("Post Inv. Transactions (Inv. Pick)"; DummyText1)
                {
                    ApplicationArea = All;
                    Caption = 'Post Inv. Transactions (Inv. Pick)';
                    DrillDown = true;
                    ShowCaption = false;

                    trigger OnDrillDown()
                    begin
                        LIFTBCFunctionsCU.PostLIFTInventoryTransactionsInventoryPick(Rec);
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
        LIFTBCFunctionsCU: Codeunit "ORB LIFTtoBC Functions";
        DummyText: Label 'Post Inventory Transactions';
        DummyText1: Label 'Post Inventory Transactions (Inventory Pick)';

    local procedure GetWhseCount(): Integer
    begin
        exit(LIFTBCFunctionsCU.GetWhseCount(Rec));
    end;

    local procedure GetILECount(): Integer
    begin
        exit(LIFTBCFunctionsCU.GetILECount(Rec));
    end;

    local procedure GetLogCount(): Integer
    begin
        exit(LIFTBCFunctionsCU.GetIntegrationLogCount(Rec));
    end;
}
