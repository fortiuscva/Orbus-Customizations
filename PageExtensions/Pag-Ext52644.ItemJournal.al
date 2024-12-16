pageextension 52644 "ORB Item Journal" extends "Item Journal"
{
    layout
    {
        addafter("Document No.")
        {
            field("ORB LIFT Inv. Transaction ID"; Rec."ORB LIFT Inv. Transaction ID")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the LIFT Inventory Transaction ID field.', Comment = '%';
                Editable = false;
            }
            field("ORB LIFT Order Line ID"; Rec."ORB LIFT Order Line ID")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the LIFT Order Line ID field.', Comment = '%';
            }
        }
    }
    actions
    {
        addlast("F&unctions")
        {
            action("ORB LIFT Get Inventory Transactions")
            {
                Image = Order;
                ApplicationArea = all;
                Caption = 'LIFT Get Inventory Transactions';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    LIFTERPSetupRecLcl: Record "ORB LIFT ERP Setup";
                    LIFTIntegrationDataLogRecLcl: Record "ORB LIFT Integration Data Log";
                    LIFTIntegration: Codeunit "ORB LIFT Integration";
                    LIFTAPICodes: Codeunit "ORB LIFT API Codes";
                begin
                    LIFTERPSetupRecLcl.Get();
                    LIFTIntegrationDataLogRecLcl.Reset();
                    LIFTIntegrationDataLogRecLcl.SetCurrentKey("Transaction ID");
                    LIFTIntegrationDataLogRecLcl.SetRange("Source Type", Database::"Item Journal Line");
                    if LIFTIntegrationDataLogRecLcl.FindLast() then
                        LIFTIntegration.ParseData(LIFTERPSetupRecLcl."Inventory Journal API" + '&p1=' + format(LIFTIntegrationDataLogRecLcl."Transaction ID"), LIFTAPICodes.GetInventoryJournalAPICode())
                    else
                        LIFTIntegration.ParseData(LIFTERPSetupRecLcl."Inventory Journal API", LIFTAPICodes.GetInventoryJournalAPICode());
                end;
            }
            action("ORB LIFT Roll Up Cost")
            {
                ApplicationArea = All;
                Caption = 'LIFT Roll Up Cost';
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = UpdateUnitCost;
                trigger OnAction()
                begin
                    if not Confirm(RollupCostConfirmMsgLbl, false) then
                        exit;
                    LiftFunctions.ItemJournalRollupCost(Rec."Journal Template Name", Rec."Journal Batch Name");
                end;
            }
        }
    }
    var
        LiftFunctions: Codeunit "ORB LIFT Functions";
        RollupCostConfirmMsgLbl: Label 'Do you want to roll up material cost to finished goods?';
}
