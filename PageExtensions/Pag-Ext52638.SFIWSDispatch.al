pageextension 52638 "ORB SFI WS - Dispatch" extends "SFI WS - Dispatch"
{
    layout
    {
        addafter("Run Time")
        {
            field("ORB Prduct Line"; Rec."ORB Prduct Line")
            {
                ApplicationArea = all;
                ToolTip = 'PrdLn Dimension';
                Editable = false;
            }
            field("ORB Material"; Rec."ORB Material")
            {
                ApplicationArea = all;
                ToolTip = 'Material Dimension';
                Editable = false;
            }
        }
    }
    trigger OnAfterGetRecord()
    var
        ProdOrderLine: Record "Prod. Order Line";
        DimensionManagement: Codeunit DimensionManagement;
        ShortcutDimensionCode: array[8] of Code[20];
        DimValueRecLcl: Record "Dimension Value";
        GeneralLedgerSetup: Record "General Ledger Setup";
    begin
        if not GeneralLedgerSetup.Get() then
            GeneralLedgerSetup.Init();

        if ProdOrderLine.Get(Rec.Status, Rec."Prod. Order No.", Rec."Routing Reference No.") then begin
            Rec."ORB Prduct Line" := '';
            Rec."ORB Material" := '';
            DimensionManagement.GetShortcutDimensions(ProdOrderLine."Dimension Set ID", ShortcutDimensionCode);
            DimValueRecLcl.Reset();
            DimValueRecLcl.SetRange(Code, GeneralLedgerSetup."Shortcut Dimension 4 Code");
            DimValueRecLcl.SetRange("Dimension Code", ShortcutDimensionCode[4]);
            if DimValueRecLcl.FindFirst() then
                Rec."ORB Prduct Line" := DimValueRecLcl.Name;

            DimValueRecLcl.Reset();
            DimValueRecLcl.SetRange(Code, GeneralLedgerSetup."Shortcut Dimension 7 Code");
            DimValueRecLcl.SetRange("Dimension Code", ShortcutDimensionCode[7]);
            if DimValueRecLcl.FindFirst() then
                Rec."ORB Material" := DimValueRecLcl.Name;
            Rec.Modify();
        end;
    end;

}
