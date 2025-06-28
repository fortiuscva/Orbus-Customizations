page 53422 "ORB LIFT SO Actions FactBox"
{
    PageType = CardPart;
    SourceTable = "Sales Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("LIFT Actions")
            {
                field("No."; rec."No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("ORB LIFT")
            {
                Caption = 'LIFT';

                action("ORB Post LIFT Inventory Transactions")
                {
                    Image = Order;
                    ApplicationArea = all;
                    Caption = 'Post LIFT Inventory Transactions';

                    trigger OnAction()
                    var
                        SalesHeaderRecLcl: Record "Sales Header";
                    begin
                        SalesHeaderRecLcl.Reset();
                        SalesHeaderRecLcl.SetRange("Document Type", rec."Document Type");
                        SalesHeaderRecLcl.SetRange("No.", Rec."No.");
                        if SalesHeaderRecLcl.FindFirst() then
                            Report.RunModal(Report::"ORB Post LIFT Transactions", true, false, SalesHeaderRecLcl);

                    end;
                }
                // action("ORB Get & Post LIFT Inventory Transactions")
                // {
                //     Image = Order;
                //     ApplicationArea = all;
                //     Caption = 'Get & Post Inventory Transactions';
                //     Visible = false;

                //     trigger OnAction()
                //     var
                //         LIFTSalesOrderInvTrans: Codeunit "LIFT Sales Order Inv. Trans";
                //     begin
                //         if UserId <> 'BCADMIN' then
                //             Error('Unauthorized access');

                //         if not Confirm('Do you want to Proceed?', false) then
                //             exit;

                //         //Get all Inventory Transactions from LIFTERP
                //         ClearLastError();
                //         if not Codeunit.Run(Codeunit::"ORB LIFT Read Inv.Transactions") then;

                //         Commit();


                //         //Register Warehouse Item journals specific to Sales order
                //         Codeunit.Run(Codeunit::"ORB LIFT Register Whse. Jnl.", rec);
                //     end;
                // }
                // action("ORB Run LIFT Warehouse Adjustments")
                // {
                //     ApplicationArea = All;
                //     Caption = 'Run LIFT Warehouse Adjustments';
                //     Image = CalculateWarehouseAdjustment;
                //     Visible = false;

                //     trigger OnAction()
                //     var
                //         LIFTCalcWhseAdjmt: Report "ORB LIFT Calculate Whse. Adj";
                //         ItemJnlRecLcl: Record "Item Journal Line";
                //         ItemNoLcl: Code[1024];
                //         SalesLineRecLcl: Record "Sales Line";
                //         ItemRecLcl: Record Item;
                //         ItemRecTempLcl: Record Item temporary;
                //         WarehouseEntryRecLcl: Record "Warehouse Entry";
                //     begin
                //         if UserId <> 'BCADMIN' then
                //             Error('Unauthorized access');

                //         if not Confirm('Do you want to Proceed?', false) then
                //             exit;

                //         // Execute LIFT Calculate Warehouse Adjustment
                //         Codeunit.Run(Codeunit::"ORB LIFT Calculate Whse. Adj.", rec);


                //         // Post Warehouse Adjustments (Item journals)
                //         Codeunit.Run(Codeunit::"ORB LIFT Post Adjustment Jnl.", rec);
                //     end;
                // }
                action("ORB Show Inventory Transaction Log")
                {
                    ApplicationArea = all;
                    Caption = 'Show Inventory Transaction Log';
                    Image = Log;
                    RunObject = Page "ORB LIFT Integration Data Log";
                    RunPageLink = "Source No." = field("No.");
                }
                action("ORB LIFT Warehouse Entries")
                {
                    ApplicationArea = All;
                    Caption = 'Open LIFT Warehouse Entries';
                    Image = Entries;

                    trigger OnAction()
                    var
                        LIFTBCFunctionsCULcl: Codeunit "ORB LIFTtoBC Functions";
                    begin
                        LIFTBCFunctionsCULcl.OpenWhseTransactions(Rec);
                    end;
                }
                action("ORB LIFT Item Ledger Entries")
                {
                    ApplicationArea = All;
                    Caption = 'Open Item Ledger Entries';
                    Image = ItemLedger;
                    trigger OnAction()
                    var
                        LIFTBCFunctionsCULcl: Codeunit "ORB LIFTtoBC Functions";
                    begin
                        LIFTBCFunctionsCULcl.OpenILETransactions(Rec);
                    end;
                }
            }
        }
    }
}
