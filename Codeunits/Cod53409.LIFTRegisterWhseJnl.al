codeunit 53409 "ORB LIFT Register Whse. Jnl."
{
    TableNo = "Sales Header";

    trigger OnRun()
    var
        WhseJnlLine: Record "Warehouse Journal Line";
    begin
        if ItemJnlTemplateNameGbl = '' then
            ItemJnlTemplateNameGbl := 'ITEM';

        if ItemJnlBatchNameGbl = '' then
            ItemJnlBatchNameGbl := 'LIFTERP';

        WhseJnlLine.Reset();
        WhseJnlLine.SetRange("Journal Template Name", ItemJnlTemplateNameGbl);
        WhseJnlLine.SetRange("Journal Batch Name", ItemJnlBatchNameGbl);
        WhseJnlLine.SetRange("Location Code", rec."Location Code");
        WhseJnlLine.SetRange("Whse. Document No.", rec."No.");

        if WhseJnlLine.FindSet() then
            CODEUNIT.Run(CODEUNIT::"Whse. Jnl.-Register", WhseJnlLine);
    end;

    procedure InitializeRequest(JournalTemplateNamePar: Code[10]; JournalBatchNamePar: Code[10])
    begin
        ItemJnlTemplateNameGbl := JournalTemplateNamePar;
        ItemJnlBatchNameGbl := JournalBatchNamePar;
    end;

    var
        ItemJnlTemplateNameGbl: Code[10];
        ItemJnlBatchNameGbl: Code[10];
}