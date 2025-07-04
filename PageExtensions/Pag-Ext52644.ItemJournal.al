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
            action("ORB LIFT Roll Up Cost")
            {
                ApplicationArea = All;
                Caption = 'LIFT Roll Up Cost';
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Image = UpdateUnitCost;
                Visible = false;
                trigger OnAction()
                begin
                    if UserId <> 'BCADMIN' then
                        Error('Unauthorized access');

                    if not Confirm(RollupCostConfirmMsgLbl, false) then
                        exit;
                    LiftFunctions.ItemJournalRollupCost(Rec."Journal Template Name", Rec."Journal Batch Name");
                end;
            }
            action("ORB Calculate LIFT Warehouse Adjustments")
            {
                ApplicationArea = Warehouse;
                Caption = 'Calculate LIFT Warehouse Adjustments';
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Ellipsis = true;
                Image = CalculateWarehouseAdjustment;
                Visible = false;
                ToolTip = 'Calculate adjustments in quantity based on the warehouse adjustment bin for each item in the journal. New lines are added for negative and positive quantities.';

                trigger OnAction()
                begin
                    if UserId <> 'BCADMIN' then
                        Error('Unauthorized access');

                    LIFTCalcWhseAdjmt.SetItemJnlLine(Rec);
                    LIFTCalcWhseAdjmt.RunModal();
                    Clear(LIFTCalcWhseAdjmt);
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        clear(IsLiftRollupCostAllowed);
        Clear(IsLiftCalcWhseAdjmtAllowed);
        if LiftFunctions.IsLIFTERPSetupEnabled() and (LiftFunctions.IsRollupCostAllowed()) then
            IsLiftRollupCostAllowed := true;
        if LiftFunctions.IsLIFTERPSetupEnabled() and (LiftFunctions.IsCalcWhseAdjustmentAllowed()) then
            IsLiftCalcWhseAdjmtAllowed := true;
    end;

    var
        IsLiftRollupCostAllowed: Boolean;
        IsLiftCalcWhseAdjmtAllowed: Boolean;
        LiftFunctions: Codeunit "ORB LIFT Functions";
        RollupCostConfirmMsgLbl: Label 'Do you want to roll up material cost to finished goods?';
        LIFTCalcWhseAdjmt: Report "ORB LIFT Calculate Whse. Adj";
}
