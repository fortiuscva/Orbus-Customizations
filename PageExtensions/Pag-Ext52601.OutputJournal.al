pageextension 52601 "ORB Output Journal" extends "Output Journal"
{
    layout
    {
        addafter(Description)
        {
            field("ORB IWX AutoPost State"; Rec."ORB IWX AutoPost State")
            {
                Visible = false;
                ApplicationArea = All;
                ToolTip = 'Whether or not this has been errored from the auto-post.';

            }
            field("ORB IWX AutoPost Error DT"; Rec."ORB IWX AutoPost Error DT")
            {
                Visible = false;
                ApplicationArea = All;
                ToolTip = 'The last time this item journal line encountered an error message.';

            }
            field("ORB IWX AutoPost Error Message"; Rec."ORB IWX AutoPost Error Message")
            {
                Visible = false;
                ApplicationArea = All;
                ToolTip = 'The last error message from the auto-post.';

            }
        }
        addafter("Output Quantity")
        {
            field("ORB Finished Quantity"; FinishedQuantityVarGbl)
            {
                Caption = 'Finished Quantity';
                ApplicationArea = all;
                Editable = false;
                ToolTip = 'Finished Quantity from Prodcution Order';
            }
            field("ORB Required Quantity"; RequiredQuantityVarGbl)
            {
                Caption = 'Required Quantity';
                ApplicationArea = all;
                Editable = false;
                ToolTip = 'Calculated from Quanity minus of Finished Quantity from Production Order';
            }
        }
    }
    actions
    {
        addlast("F&unctions")
        {
            action("ORB CleanFinishedRPOLines")
            {
                Caption = 'Clean Up Finished RPO Lines';
                Visible = ShowCleanUpButtonVarGbl;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = CancelAllLines;

                trigger OnAction()
                var
                    ItemJnlLineRecLcl: Record "Item Journal Line";
                    ProdOrdeRecLcl: Record "Production Order";
                    ProceedConfirmMsgLbl: Label 'Do you want to delete the finished production order journal lines?';
                begin
                    if not Confirm(ProceedConfirmMsgLbl, false) then
                        exit;

                    Rec.TestField("Journal Template Name", 'OUTPUT');
                    ItemJnlLineRecLcl.Reset();
                    ItemJnlLineRecLcl.SetRange("Journal Template Name", 'OUTPUT');
                    ItemJnlLineRecLcl.SetRange("Journal Batch Name", CurrentJnlBatchName);
                    if ItemJnlLineRecLcl.FindSet() then
                        repeat
                            if not ProdOrdeRecLcl.get(ProdOrdeRecLcl.status::Released, ItemJnlLineRecLcl."Order No.") then
                                ItemJnlLineRecLcl.Delete(true);
                        until ItemJnlLineRecLcl.Next() = 0;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        ShowCleanUpButtonVarGbl := false;
        IF (Rec."Journal Batch Name" = 'OUTPUTERR') OR (Rec."Journal Batch Name" = 'WR-GRAPHIC') OR (Rec."Journal Batch Name" = 'LV-GRAPHIC') then
            ShowCleanUpButtonVarGbl := true;
    end;

    trigger OnAfterGetCurrRecord()
    begin
        ShowCleanUpButtonVarGbl := false;
        IF (Rec."Journal Batch Name" = 'OUTPUTERR') OR (Rec."Journal Batch Name" = 'WR-GRAPHIC') OR (Rec."Journal Batch Name" = 'LV-GRAPHIC') then
            ShowCleanUpButtonVarGbl := true;
    end;

    trigger OnAfterGetRecord()
    var
        ProdOrderLineVarLcl: Record "Prod. Order Line";
    begin
        Clear(FinishedQuantityVarGbl);
        Clear(RequiredQuantityVarGbl);
        ProdOrderLineVarLcl.Reset();
        if ProdOrderLineVarLcl.get(ProdOrderLineVarLcl.Status::Released, rec."Order No.", rec."Order Line No.") then begin
            FinishedQuantityVarGbl := ProdOrderLineVarLcl."Finished Quantity";
            RequiredQuantityVarGbl := ProdOrderLineVarLcl.Quantity - ProdOrderLineVarLcl."Finished Quantity";
        end;
    end;

    var
        FinishedQuantityVarGbl: Decimal;
        RequiredQuantityVarGbl: Decimal;
        ShowCleanUpButtonVarGbl: Boolean;
}