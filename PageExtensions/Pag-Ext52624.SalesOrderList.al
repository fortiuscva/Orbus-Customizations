pageextension 52624 "ORB Sales Order List" extends "Sales Order List"
{
    layout
    {
        addafter("No.")
        {
            field("ORB Magento Order #"; Rec."ORB Magento Order #")
            {
                ApplicationArea = all;
                ToolTip = 'Magento Order #';
            }
            field("ORB Escalation Reason Code"; Rec."ORB Escalation Reason Code")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the issue that is stopping the order release';

            }
            field("ORB Resolved By"; Rec."ORB Resolved By")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the user who resolved the escalated reason';
            }
            field("ORB Total Payment Amount"; Rec."ORB Total Payment Amount")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Total Payment Amount Field value';
            }
            field("ORB Freight Line"; Rec."ORB Freight Line")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the field Freight Line value';
            }
        }
        addlast(Control1)
        {
            field("ORB DS Payment Account No."; Rec."ORB DS Payment Account No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Payment Account No. field.', Comment = '%';
            }
            field("ORB DS Payment Type"; Rec."ORB DS Payment Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Payment Type field.', Comment = '%';
            }
            field("ORB Original Promised Ship Dt."; Rec."ORB Original Promised Ship Dt.")
            {
                ApplicationArea = ALL;
                ToolTip = 'Specifies the fist warehouse release date for the order';
                Editable = false;
            }
            field("ORB Delayed Ship Reason Code"; Rec."ORB Delayed Ship Reason Code")
            {
                ApplicationArea = ALL;
                ToolTip = 'Specifies the reason for shipment delay';
                Editable = false;
            }
            field("ORB Delayed Ship Sub-Reason"; Rec."ORB Delayed Ship Sub-Reason")
            {
                ApplicationArea = ALL;
                ToolTip = 'Specifies the sub-reason for shipment delay';
                Editable = false;
            }
            field("ORB Sales Order Payment Type"; Rec."Sales Order Payment Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sales Order Payment Type field.', Comment = '%';
            }
            field("ORB SO Payment Account No."; Rec."SO Payment Account No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sales Order Payment Account No. field.', Comment = '%';
            }
            field("ORB Your Reference(CS)"; Rec."ORB Your Reference(CS)")
            {
                ApplicationArea = ALL;
                ToolTip = 'Specifies Your Reference';
                Editable = false;
            }
            field("ORB Project No."; Rec."Project No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Project No.';
                Editable = false;
            }
            field("ORB Customer Support"; Rec."ORB Customer Support")
            {
                Caption = 'Customer Support';
                ApplicationArea = All;
                Editable = false;
            }
            field("ORB Business Development"; Rec."ORB Business Development")
            {
                Caption = 'Business Development';
                ApplicationArea = All;
                Editable = false;
            }
        }
    }
    actions
    {
        addlast("O&rder")
        {
            action("ORB Sales Header Additional Fields")
            {
                Caption = 'Additional Fields';
                Image = RelatedInformation;
                ApplicationArea = all;
                RunObject = page "ORB Sales Header Add. Fields";
                RunPageLink = "Document Type" = field("Document Type"), "No." = field("No.");
            }
            action("ORB LIFT Get Sales Orders")
            {
                Image = Order;
                ApplicationArea = all;
                Caption = 'LIFT Get Sales Orders';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = IsLIFTERPFunctionEnabled;
                trigger OnAction()
                var
                    LIFTERPSetupRecLcl: Record "ORB LIFT ERP Setup";
                    LIFTIntegrationDataLogRecLcl: Record "ORB LIFT Integration Data Log";
                    LIFTIntegration: Codeunit "ORB LIFT Integration";
                    LIFTAPICodes: Codeunit "ORB LIFT API Codes";
                begin
                    LIFTERPSetupRecLcl.Get();
                    LIFTIntegrationDataLogRecLcl.Reset();
                    LIFTIntegrationDataLogRecLcl.SetCurrentKey("Source Type", "Source Subtype", "Source No.");
                    LIFTIntegrationDataLogRecLcl.SetRange("Source Type", Database::"Sales Header");
                    LIFTIntegrationDataLogRecLcl.SetRange("Source Subtype", 1);
                    if LIFTIntegrationDataLogRecLcl.FindLast() then
                        LIFTIntegration.ParseData(LIFTERPSetupRecLcl."Sales Orders API" + '&p1=' + LIFTIntegrationDataLogRecLcl."Source No.", LIFTAPICodes.GetSalesOrderAPICode())
                    else
                        LIFTIntegration.ParseData(LIFTERPSetupRecLcl."Sales Orders API", LIFTAPICodes.GetSalesOrderAPICode());
                end;
            }

        }
        modify("Release & Pick")
        {

            trigger OnBeforeAction()
            var
                SalesHeaderRecLcl: Record "Sales Header";
            begin
                CurrPage.SetSelectionFilter(SalesHeaderRecLcl);
                SalesHeaderRecLcl.MarkedOnly(true);
                IF SalesHeaderRecLcl.FindSet() then
                    repeat
                        OrbusFunctions.RestrictZeroTransactionAmountforCreditCardPayment(SalesHeaderRecLcl);
                    Until SalesHeaderRecLcl.Next() = 0;

            end;
        }
        addfirst(processing)
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
                action("ORB Get & Post LIFT Inventory Transactions")
                {
                    Image = Order;
                    ApplicationArea = all;
                    Caption = 'Get & Post Inventory Transactions';
                    Visible = false;

                    trigger OnAction()
                    var
                        LIFTSalesOrderInvTrans: Codeunit "LIFT Sales Order Inv. Trans";
                    begin
                        if UserId <> 'BCADMIN' then
                            Error('Unauthorized access');

                        if not Confirm('Do you want to Proceed?', false) then
                            exit;

                        //Get all Inventory Transactions from LIFTERP
                        ClearLastError();
                        if not Codeunit.Run(Codeunit::"ORB LIFT Read Inv.Transactions") then;

                        Commit();


                        //Register Warehouse Item journals specific to Sales order
                        Codeunit.Run(Codeunit::"ORB LIFT Register Whse. Jnl.", rec);
                    end;
                }
                action("ORB Run LIFT Warehouse Adjustments")
                {
                    ApplicationArea = All;
                    Caption = 'Run LIFT Warehouse Adjustments';
                    Image = CalculateWarehouseAdjustment;
                    Visible = false;

                    trigger OnAction()
                    var
                        LIFTCalcWhseAdjmt: Report "ORB LIFT Calculate Whse. Adj";
                        ItemJnlRecLcl: Record "Item Journal Line";
                        ItemNoLcl: Code[1024];
                        SalesLineRecLcl: Record "Sales Line";
                        ItemRecLcl: Record Item;
                        ItemRecTempLcl: Record Item temporary;
                        WarehouseEntryRecLcl: Record "Warehouse Entry";
                    begin
                        if UserId <> 'BCADMIN' then
                            Error('Unauthorized access');

                        if not Confirm('Do you want to Proceed?', false) then
                            exit;

                        // Execute LIFT Calculate Warehouse Adjustment
                        Codeunit.Run(Codeunit::"ORB LIFT Calculate Whse. Adj.", rec);


                        // Post Warehouse Adjustments (Item journals)
                        Codeunit.Run(Codeunit::"ORB LIFT Post Adjustment Jnl.", rec);
                    end;
                }
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

                    trigger OnAction()
                    var
                        LIFTBCFunctionsCULcl: Codeunit "ORB LIFTtoBC Functions";
                    begin
                        LIFTBCFunctionsCULcl.OpenWhseTransactions(Rec);
                    end;
                }
            }
        }

    }

    trigger OnOpenPage()
    begin
        clear(IsLIFTERPFunctionEnabled);
        if LiftFunctions.IsLIFTERPSetupEnabled() and (LiftFunctions.IsGetSalesOrdersAllowed()) then
            IsLIFTERPFunctionEnabled := true;
    end;

    var
        OrbusFunctions: Codeunit "ORB Functions";
        LiftFunctions: Codeunit "ORB LIFT Functions";
        IsLIFTERPFunctionEnabled: Boolean;
}
