codeunit 53415 "ORB LIFT Post Item Jnl."
{
    TableNo = "Sales Header";

    trigger OnRun()
    var
        LIFTERPSetuplcl: Record "ORB LIFT ERP Setup";
        ItemJnlRecLcl: Record "Item Journal Line";
        OrbusSingleInstanceCUGbl: Codeunit "ORB Orbus Single Instance";
    begin
        if not LIFTERPSetuplcl.Get() then
            LIFTERPSetuplcl.Init();


        LIFTERPSetuplcl.TestField("Inv. Pick Post. Jnl. Batch");


        if ItemJnlTemplateNameGbl = '' then begin
            LIFTERPSetuplcl.TestField("Inv. Pick Post. Jnl. Template");
            ItemJnlTemplateNameGbl := LIFTERPSetuplcl."Inv. Pick Post. Jnl. Template";
        end;

        if ItemJnlBatchNameGbl = '' then begin
            LIFTERPSetuplcl.TestField("Inv. Pick Post. Jnl. Batch");
            ItemJnlBatchNameGbl := LIFTERPSetuplcl."Inv. Pick Post. Jnl. Batch";
        end;

        ItemJnlRecLcl.Reset();
        ItemJnlRecLcl.SetRange("Journal Template Name", ItemJnlTemplateNameGbl);
        ItemJnlRecLcl.SetRange("Journal Batch Name", ItemJnlBatchNameGbl);
        ItemJnlRecLcl.SetRange("Document No.", Rec."No.");


        if ItemJnlRecLcl.FindSet() then
            CODEUNIT.Run(CODEUNIT::"Item Jnl.-Post", ItemJnlRecLcl);
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
