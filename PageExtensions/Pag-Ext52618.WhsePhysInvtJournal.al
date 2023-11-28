/// <summary>
/// PageExtension ORB Whse. Phys. Invt. Journal (ID 52618) extends Record Whse. Phys. Invt. Journal.
/// </summary>
pageextension 52618 "ORB Whse. Phys. Invt. Journal" extends "Whse. Phys. Invt. Journal"
{
    actions
    {
        addafter("&Calculate Counting Period")
        {
            action("ORB Export")
            {
                ApplicationArea = All;
                Caption = 'Export';
                Ellipsis = true;
                Image = Export;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    ExportPhyInvJournal();
                end;
            }
            action("ORB Import")
            {
                ApplicationArea = All;
                Caption = 'Import';
                Ellipsis = true;
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    ReadExcelSheet();
                    ImportPhyInvJournal();
                end;
            }
        }
    }

    /// <summary>
    /// ExportPhyInvJournal.
    /// </summary>
    procedure ExportPhyInvJournal()
    var
        WarehouseJournalLineRecLcl: Record "Warehouse Journal Line";
        TempExcelBufferRecLcl: Record "Excel Buffer" temporary;
    begin
        TempExcelBufferRecLcl.Reset();
        TempExcelBufferRecLcl.DeleteAll();

        TempExcelBufferRecLcl.NewRow();
        TempExcelBufferRecLcl.AddColumn(rec.FieldCaption("Journal Template Name"), false, '', true, false, false, '', TempExcelBufferRecLcl."Cell Type"::Text);
        TempExcelBufferRecLcl.AddColumn(rec.FieldCaption("Journal Batch Name"), false, '', true, false, false, '', TempExcelBufferRecLcl."Cell Type"::Text);
        TempExcelBufferRecLcl.AddColumn(rec.FieldCaption("Location Code"), false, '', true, false, false, '', TempExcelBufferRecLcl."Cell Type"::Text);
        TempExcelBufferRecLcl.AddColumn(rec.FieldCaption("Line No."), false, '', true, false, false, '', TempExcelBufferRecLcl."Cell Type"::Text);
        TempExcelBufferRecLcl.AddColumn(rec.FieldCaption("Registering Date"), false, '', true, false, false, '', TempExcelBufferRecLcl."Cell Type"::Text);
        TempExcelBufferRecLcl.AddColumn(rec.FieldCaption("Whse. Document No."), false, '', true, false, false, '', TempExcelBufferRecLcl."Cell Type"::Text);
        TempExcelBufferRecLcl.AddColumn(rec.FieldCaption("Item No."), false, '', true, false, false, '', TempExcelBufferRecLcl."Cell Type"::Text);
        TempExcelBufferRecLcl.AddColumn(rec.FieldCaption(Description), false, '', true, false, false, '', TempExcelBufferRecLcl."Cell Type"::Text);
        TempExcelBufferRecLcl.AddColumn(rec.FieldCaption("Zone Code"), false, '', true, false, false, '', TempExcelBufferRecLcl."Cell Type"::Text);
        TempExcelBufferRecLcl.AddColumn(rec.FieldCaption("Bin Code"), false, '', true, false, false, '', TempExcelBufferRecLcl."Cell Type"::Text);
        TempExcelBufferRecLcl.AddColumn(rec.FieldCaption("Qty. (Calculated)"), false, '', true, false, false, '', TempExcelBufferRecLcl."Cell Type"::Text);
        TempExcelBufferRecLcl.AddColumn(rec.FieldCaption("Qty. (Phys. Inventory)"), false, '', true, false, false, '', TempExcelBufferRecLcl."Cell Type"::Text);
        TempExcelBufferRecLcl.AddColumn(rec.FieldCaption(Quantity), false, '', true, false, false, '', TempExcelBufferRecLcl."Cell Type"::Text);
        TempExcelBufferRecLcl.AddColumn(rec.FieldCaption("Unit of Measure Code"), false, '', true, false, false, '', TempExcelBufferRecLcl."Cell Type"::Text);



        WarehouseJournalLineRecLcl.Reset();
        WarehouseJournalLineRecLcl.SetRange("Journal Template Name", rec."Journal Template Name");
        WarehouseJournalLineRecLcl.SetRange("Journal Batch Name", rec."Journal Batch Name");
        WarehouseJournalLineRecLcl.SetRange("Location Code", rec."Location Code");
        if WarehouseJournalLineRecLcl.FindSet() then
            repeat
                TempExcelBufferRecLcl.NewRow();
                TempExcelBufferRecLcl.AddColumn(WarehouseJournalLineRecLcl."Journal Template Name", false, '', false, false, false, '', TempExcelBufferRecLcl."Cell Type"::Date);
                TempExcelBufferRecLcl.AddColumn(WarehouseJournalLineRecLcl."Journal Batch Name", false, '', false, false, false, '', TempExcelBufferRecLcl."Cell Type"::Text);
                TempExcelBufferRecLcl.AddColumn(WarehouseJournalLineRecLcl."Location Code", false, '', false, false, false, '', TempExcelBufferRecLcl."Cell Type"::Text);
                TempExcelBufferRecLcl.AddColumn(WarehouseJournalLineRecLcl."Line No.", false, '', false, false, false, '', TempExcelBufferRecLcl."Cell Type"::Text);
                TempExcelBufferRecLcl.AddColumn(WarehouseJournalLineRecLcl."Registering Date", false, '', false, false, false, '', TempExcelBufferRecLcl."Cell Type"::Date);
                TempExcelBufferRecLcl.AddColumn(WarehouseJournalLineRecLcl."Whse. Document No.", false, '', false, false, false, '', TempExcelBufferRecLcl."Cell Type"::Text);
                TempExcelBufferRecLcl.AddColumn(WarehouseJournalLineRecLcl."Item No.", false, '', false, false, false, '', TempExcelBufferRecLcl."Cell Type"::Text);
                TempExcelBufferRecLcl.AddColumn(WarehouseJournalLineRecLcl.Description, false, '', false, false, false, '', TempExcelBufferRecLcl."Cell Type"::Text);
                TempExcelBufferRecLcl.AddColumn(WarehouseJournalLineRecLcl."Zone Code", false, '', false, false, false, '', TempExcelBufferRecLcl."Cell Type"::Text);
                TempExcelBufferRecLcl.AddColumn(WarehouseJournalLineRecLcl."Bin Code", false, '', false, false, false, '', TempExcelBufferRecLcl."Cell Type"::Text);
                TempExcelBufferRecLcl.AddColumn(WarehouseJournalLineRecLcl."Qty. (Calculated)", false, '', false, false, false, '', TempExcelBufferRecLcl."Cell Type"::Number);
                TempExcelBufferRecLcl.AddColumn(WarehouseJournalLineRecLcl."Qty. (Phys. Inventory)", false, '', false, false, false, '', TempExcelBufferRecLcl."Cell Type"::Number);
                TempExcelBufferRecLcl.AddColumn(WarehouseJournalLineRecLcl.Quantity, false, '', false, false, false, '', TempExcelBufferRecLcl."Cell Type"::Number);
                TempExcelBufferRecLcl.AddColumn(WarehouseJournalLineRecLcl."Unit of Measure Code", false, '', false, false, false, '', TempExcelBufferRecLcl."Cell Type"::Text);
            until WarehouseJournalLineRecLcl.Next() = 0;

        TempExcelBufferRecLcl.CreateNewBook('Phy. Inventory Journal');
        TempExcelBufferRecLcl.WriteSheet('Phy. Inventory Journal', CompanyName, UserId);
        TempExcelBufferRecLcl.CloseBook();
        TempExcelBufferRecLcl.SetFriendlyFilename('Phy. Inventory Journal ' + Format(CurrentDateTime));
        TempExcelBufferRecLcl.OpenExcel();
    end;

    procedure ImportPhyInvJournal()
    var
        WarehouseJournalLineRecLcl: Record "Warehouse Journal Line";
        RowNoVarLcl: Integer;
        ColNoVarLcl: Integer;
        LineNoVarLcl: Integer;
        MaxRowNoVarLcl: Integer;
        WarehouseJournalLineNoVarLcl: Integer;
        WarehouseJournalQtyCalcVarLcl: Decimal;
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
            WarehouseJournalLineRecLcl.SetRange("Journal Template Name", GetValueAtCell(RowNoVarLcl, 1));
            WarehouseJournalLineRecLcl.SetRange("Journal Batch Name", GetValueAtCell(RowNoVarLcl, 2));
            WarehouseJournalLineRecLcl.SetRange("Location Code", GetValueAtCell(RowNoVarLcl, 3));
            Evaluate(WarehouseJournalLineNoVarLcl, GetValueAtCell(RowNoVarLcl, 4));
            WarehouseJournalLineRecLcl.SetRange("Line No.", WarehouseJournalLineNoVarLcl);
            if WarehouseJournalLineRecLcl.findfirst() then begin
                Evaluate(WarehouseJournalQtyCalcVarLcl, GetValueAtCell(RowNoVarLcl, 12));
                WarehouseJournalLineRecLcl.Validate("Qty. (Phys. Inventory)", WarehouseJournalQtyCalcVarLcl);
                WarehouseJournalLineRecLcl.Modify();
            end;
        end;
        Message(ExcelImportSucess);
    end;

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

    local procedure GetValueAtCell(RowNoVarLcl: Integer; ColNoVarLcl: Integer): Text
    begin

        TempExcelBufferRecGbl.Reset();
        If TempExcelBufferRecGbl.Get(RowNoVarLcl, ColNoVarLcl) then
            exit(TempExcelBufferRecGbl."Cell Value as Text")
        else
            exit('');
    end;

    var
        TempExcelBufferRecGbl: Record "Excel Buffer" temporary;
        FileNameVarLcl: Text[100];
        SheetNameVarLcl: Text[100];
        UploadExcelMsg: Label 'Please Choose the Excel file.';
        NoFileFoundMsg: Label 'No Excel file found!';
        ExcelImportSucess: Label 'Excel is successfully imported.';
}
