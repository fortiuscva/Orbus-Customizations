pageextension 52638 "ORB SFI WS - Dispatch" extends "SFI WS - Dispatch"
{
    layout
    {
        addafter("Run Time")
        {
            field("ORB Prduct Line"; Rec."ORB Product Line")
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
            Rec."ORB Product Line" := '';
            Rec."ORB Material" := '';
            DimensionManagement.GetShortcutDimensions(ProdOrderLine."Dimension Set ID", ShortcutDimensionCode);
            DimValueRecLcl.Reset();
            DimValueRecLcl.SetRange("Dimension Code", GeneralLedgerSetup."Shortcut Dimension 3 Code");
            DimValueRecLcl.SetRange(Code, ShortcutDimensionCode[3]);
            if DimValueRecLcl.FindFirst() then
                Rec."ORB Product Line" := DimValueRecLcl.Name;

            DimValueRecLcl.Reset();
            DimValueRecLcl.SetRange("Dimension Code", GeneralLedgerSetup."Shortcut Dimension 7 Code");
            DimValueRecLcl.SetRange(Code, ShortcutDimensionCode[7]);
            if DimValueRecLcl.FindFirst() then
                Rec."ORB Material" := DimValueRecLcl.Name;
            Rec.Modify();
        end;
    end;

}
