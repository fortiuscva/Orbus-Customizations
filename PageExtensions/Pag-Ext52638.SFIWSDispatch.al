pageextension 52638 "ORB SFI WS - Dispatch" extends "SFI WS - Dispatch"
{
    layout
    {
        addafter("Run Time")
        {
            field("ORB PrdLn Dimension"; Rec."ORB PrdLn Dimension")
            {
                ApplicationArea = all;
                ToolTip = 'PrdLn Dimension';
                trigger OnValidate()
                var
                    DimensionManagement: Codeunit DimensionManagement;
                    ProdOrderLine: Record "Prod. Order Line";
                    TempDimSetEntry: Record "Dimension Set Entry" temporary;
                    Dimensionvalue: Record "Dimension Value";
                    ShortcutDimensionCode: array[8] of Code[20];
                    OldDimensionSetID: Integer;
                    DiemnsionSetId: Integer;
                begin
                    if ProdOrderLine.Get(Rec.Status, Rec."Prod. Order No.", Rec."Routing Reference No.") then begin
                        DimensionManagement.GetGLSetup(ShortcutDimensionCode);
                        OldDimensionSetID := ProdOrderLine."Dimension Set ID";
                        Dimensionvalue."Dimension Code" := ShortcutDimensionCode[4];
                        Dimensionvalue.GET(Dimensionvalue."Dimension Code", Rec."ORB PrdLn Dimension");
                        DimensionManagement.GetDimensionSet(TempDimSetEntry, OldDimensionSetID);
                        IF TempDimSetEntry.GET(TempDimSetEntry."Dimension Set ID", Rec."ORB PrdLn Dimension") THEN
                            IF TempDimSetEntry."Dimension Value Code" <> Rec."ORB PrdLn Dimension" THEN
                                TempDimSetEntry.DELETE;
                        IF Rec."ORB PrdLn Dimension" <> '' THEN BEGIN
                            TempDimSetEntry."Dimension Code" := Dimensionvalue."Dimension Code";
                            TempDimSetEntry."Dimension Value Code" := Dimensionvalue.Code;
                            TempDimSetEntry."Dimension Value ID" := Dimensionvalue."Dimension Value ID";
                            IF TempDimSetEntry.INSERT THEN;
                        END;
                        DiemnsionSetId := DimensionManagement.GetDimensionSetID(TempDimSetEntry);
                        if OldDimensionSetID <> DiemnsionSetId then begin
                            ProdOrderLine."Dimension Set ID" := DiemnsionSetId;
                            ProdOrderLine.Modify();
                        end;
                    end;
                end;
            }
            field("ORB Material Dimension"; Rec."ORB Material Dimension")
            {
                ApplicationArea = all;
                ToolTip = 'Material Dimension';
                trigger OnValidate()
                var
                    DimensionManagement: Codeunit DimensionManagement;
                    ProdOrderLine: Record "Prod. Order Line";
                    TempDimSetEntry: Record "Dimension Set Entry" temporary;
                    Dimensionvalue: Record "Dimension Value";
                    ShortcutDimensionCode: array[8] of Code[20];
                    OldDimensionSetID: Integer;
                    DiemnsionSetId: Integer;
                begin
                    if ProdOrderLine.Get(Rec.Status, Rec."Prod. Order No.", Rec."Routing Reference No.") then begin
                        DimensionManagement.GetGLSetup(ShortcutDimensionCode);
                        OldDimensionSetID := ProdOrderLine."Dimension Set ID";
                        Dimensionvalue."Dimension Code" := ShortcutDimensionCode[7];
                        Dimensionvalue.GET(Dimensionvalue."Dimension Code", Rec."ORB Material Dimension");
                        DimensionManagement.GetDimensionSet(TempDimSetEntry, OldDimensionSetID);
                        IF TempDimSetEntry.GET(TempDimSetEntry."Dimension Set ID", Rec."ORB Material Dimension") THEN
                            IF TempDimSetEntry."Dimension Value Code" <> Rec."ORB Material Dimension" THEN
                                TempDimSetEntry.DELETE;
                        IF Rec."ORB Material Dimension" <> '' THEN BEGIN
                            TempDimSetEntry."Dimension Code" := Dimensionvalue."Dimension Code";
                            TempDimSetEntry."Dimension Value Code" := Dimensionvalue.Code;
                            TempDimSetEntry."Dimension Value ID" := Dimensionvalue."Dimension Value ID";
                            IF TempDimSetEntry.INSERT THEN;
                        END;
                        DiemnsionSetId := DimensionManagement.GetDimensionSetID(TempDimSetEntry);
                        if OldDimensionSetID <> DiemnsionSetId then begin
                            ProdOrderLine."Dimension Set ID" := DiemnsionSetId;
                            ProdOrderLine.Modify();
                        end;
                    end;
                end;
            }
        }
    }
    trigger OnAfterGetRecord()
    var
        ProdOrderLine: Record "Prod. Order Line";
        DimensionManagement: Codeunit DimensionManagement;
        ShortcutDimensionCode: array[8] of Code[20];
    begin
        if ProdOrderLine.Get(Rec.Status, Rec."Prod. Order No.", Rec."Routing Reference No.") then begin
            DimensionManagement.GetShortcutDimensions(ProdOrderLine."Dimension Set ID", ShortcutDimensionCode);
            Rec."ORB PrdLn Dimension" := ShortcutDimensionCode[4];
            Rec."ORB Material Dimension" := ShortcutDimensionCode[7];
        end;
    end;

}
