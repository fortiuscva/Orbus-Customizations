codeunit 53000 "ORB Add Retension Policy Table"

{

    trigger OnRun()
    var
        RetenPolAllowedTables: Codeunit "Reten. Pol. Allowed Tables";
    begin
        RetenPolAllowedTables.AddAllowedTable(Database::"Versapay ARC Log -CL-");
        // RetenPolAllowedTables.AddAllowedTable(Database::"Versapay Rec Discrepancy -CL-");
    end;

}