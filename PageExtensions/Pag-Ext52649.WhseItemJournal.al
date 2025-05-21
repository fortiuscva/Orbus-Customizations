pageextension 52649 "ORB Whse. Item Journal" extends "Whse. Item Journal"
{
    layout
    {
        addfirst(Control1)
        {

            field("ORB Journal Template Name"; Rec."Journal Template Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the name of the journal template, the basis of the journal batch, that the entries were posted from.';
                Visible = false;
            }
            field("ORB Journal Batch Name"; Rec."Journal Batch Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the name of the journal batch, a personalized journal layout, that the entries were posted from.';
                Visible = false;
            }
            field("ORB Line No."; Rec."Line No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the number of the warehouse journal line.';
                Visible = false;
            }
        }
        addlast(Control1)
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
        addfirst(Processing)
        {
            action("ORB Get LIFT Inventory Transactions")
            {
                Image = Order;
                ApplicationArea = all;
                Caption = 'Get LIFT Inventory Transactions';
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
                    LIFTIntegrationDataLogRecLcl.SetCurrentKey("Transaction ID");
                    LIFTIntegrationDataLogRecLcl.SetRange("Source Type", Database::"Warehouse Journal Line");
                    if LIFTIntegrationDataLogRecLcl.FindLast() then
                        LIFTIntegration.ParseData(LIFTERPSetupRecLcl."Inventory Journal API" + '&p1=' + format(LIFTIntegrationDataLogRecLcl."Transaction ID"), LIFTAPICodes.GetInventoryJournalAPICode())
                    else
                        LIFTIntegration.ParseData(LIFTERPSetupRecLcl."Inventory Journal API", LIFTAPICodes.GetInventoryJournalAPICode());
                end;
            }
            action("ORB Import Bin Content")
            {
                ApplicationArea = All;
                Caption = 'Import Bin Content';
                Ellipsis = true;
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    ReadExcelSheet();
                    ImportBinContentLines();
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin

        clear(IsLIFTERPFunctionEnabled);
        if LiftFunctions.IsLIFTERPSetupEnabled() and (LiftFunctions.IsGetWhseJournalAllowed()) then
            IsLIFTERPFunctionEnabled := true;
    end;


    var
        LiftFunctions: Codeunit "ORB LIFT Functions";
        IsLIFTERPFunctionEnabled: Boolean;
        RollupCostConfirmMsgLbl: Label 'Do you want to roll up material cost to finished goods?';
        TempExcelBufferRecGbl: Record "Excel Buffer" temporary;
        FileNameVarLcl: Text[100];
        SheetNameVarLcl: Text[100];
        UploadExcelMsg: Label 'Please Choose the Excel file.';
        NoFileFoundMsg: Label 'No Excel file found!';
        ExcelImportSucess: Label 'Excel is successfully imported.';

    local procedure ReadExcelSheet()
    var
        FileMgtCULcl: Codeunit "File Management";
        IStreamVarLcl: InStream;
        FromFileVarLcl: Text[100];
    begin
        UploadIntoStream(UploadExcelMsg, '', '', FromFileVarLcl, IStreamVarLcl);
        if FromFileVarLcl <> '' then begin
            FileNameVarLcl := FileMgtCULcl.GetFileName(FromFileVarLcl);
            SheetNameVarLcl := TempExcelBufferRecGbl.SelectSheetsNameStream(IStreamVarLcl);
        end else
            Error(NoFileFoundMsg);
        TempExcelBufferRecGbl.Reset();
        TempExcelBufferRecGbl.DeleteAll();
        TempExcelBufferRecGbl.OpenBookStream(IStreamVarLcl, SheetNameVarLcl);
        TempExcelBufferRecGbl.ReadSheet();
    end;

    local procedure ImportBinContentLines()
    var
        WarehouseJournalLineRecLcl: Record "Warehouse Journal Line";
        RowNoVarLcl: Integer;
        ColNoVarLcl: Integer;
        LineNoVarLcl: Integer;
        MaxRowNoVarLcl: Integer;
        QtyVarLcl: Decimal;
        QtyPerUOMVarLcl: Decimal;
        QtyBaseVarLcl: Decimal;
        countImported: Integer;
    begin

        RowNoVarLcl := 0;
        ColNoVarLcl := 0;
        MaxRowNoVarLcl := 0;
        LineNoVarLcl := 0;

        TempExcelBufferRecGbl.Reset();
        if TempExcelBufferRecGbl.FindLast() then begin
            MaxRowNoVarLcl := TempExcelBufferRecGbl."Row No.";
        end;
        for RowNoVarLcl := 2 to MaxRowNoVarLcl do begin
            WarehouseJournalLineRecLcl.Reset();
            // WarehouseJournalLineRecLcl.SetRange("Journal Template Name", Rec."Journal Template Name");
            // WarehouseJournalLineRecLcl.SetRange("Journal Batch Name", Rec."Journal Batch Name");
            WarehouseJournalLineRecLcl.SetRange("Location Code", GetValueAtCell(RowNoVarLcl, 10));
            WarehouseJournalLineRecLcl.SetRange("Item No.", GetValueAtCell(RowNoVarLcl, 4));
            WarehouseJournalLineRecLcl.SetRange("Bin Code", GetValueAtCell(RowNoVarLcl, 3));
            WarehouseJournalLineRecLcl.SetRange("Variant Code", GetValueAtCell(RowNoVarLcl, 9));
            if WarehouseJournalLineRecLcl.FindFirst() then begin
                // WarehouseJournalLineRecLcl.Validate("Item No.", GetValueAtCell(RowNoVarLcl, 4));
                // WarehouseJournalLineRecLcl.Validate("Bin Code", GetValueAtCell(RowNoVarLcl, 3));
                WarehouseJournalLineRecLcl.Validate("Unit of Measure Code", GetValueAtCell(RowNoVarLcl, 5));
                // WarehouseJournalLineRecLcl.Validate("Variant Code", GetValueAtCell(RowNoVarLcl, 9));
                WarehouseJournalLineRecLcl.Validate("Zone Code", GetValueAtCell(RowNoVarLcl, 11));
                Evaluate(QtyVarLcl, GetValueAtCell(RowNoVarLcl, 12));
                WarehouseJournalLineRecLcl.Validate(Quantity, QtyVarLcl);
                Evaluate(QtyPerUOMVarLcl, GetValueAtCell(RowNoVarLcl, 13));
                WarehouseJournalLineRecLcl.Validate("Qty. per Unit of Measure", QtyPerUOMVarLcl);
                WarehouseJournalLineRecLcl.Validate("From Bin Type Code", GetValueAtCell(RowNoVarLcl, 17));
                Evaluate(QtyBaseVarLcl, GetValueAtCell(RowNoVarLcl, 19));
                WarehouseJournalLineRecLcl.Validate("Qty. (Base)", QtyBaseVarLcl);
                WarehouseJournalLineRecLcl.Validate(Description, GetValueAtCell(RowNoVarLcl, 28));
                WarehouseJournalLineRecLcl.Modify();
                countImported += 1;
            end;
        end;
        Message(ExcelImportSucess + ' %1 lines updated.', countImported);
    end;

    local procedure GetValueAtCell(RowNoVarLcl: Integer; ColNoVarLcl: Integer): Text
    begin

        TempExcelBufferRecGbl.Reset();
        If TempExcelBufferRecGbl.Get(RowNoVarLcl, ColNoVarLcl) then
            exit(TempExcelBufferRecGbl."Cell Value as Text")
        else
            exit('');
    end;

}
