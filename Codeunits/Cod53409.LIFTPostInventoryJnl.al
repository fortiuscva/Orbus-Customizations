codeunit 53409 "ORB LIFT Post Inventory Jnl"
{
    TableNo = "Sales Header";

    trigger OnRun()
    var
        WhseJnlLine: Record "Warehouse Journal Line";
    begin
        WhseJnlLine.Reset();
        WhseJnlLine.SetRange("Journal Template Name", 'ITEM');
        WhseJnlLine.SetRange("Journal Batch Name", 'LIFTERP');
        WhseJnlLine.SetRange("Location Code", 'WR');
        WhseJnlLine.SetRange("Whse. Document No.", rec."No.");

        if WhseJnlLine.FindSet() then
            CODEUNIT.Run(CODEUNIT::"Whse. Jnl.-Register", WhseJnlLine);
    end;

}