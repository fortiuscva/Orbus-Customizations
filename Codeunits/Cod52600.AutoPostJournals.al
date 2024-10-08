codeunit 52600 "ORB Auto-Post Journals"
{
    trigger OnRun()
    var
        SFISetupRecLcl: record "SFI Setup";
    begin
        if not SFISetupRecLcl.Get() then
            exit;

        if (SFISetupRecLcl."ORB IWX Auto Post Output" = SFISetupRecLcl."ORB IWX Auto Post Output"::"Yes - Auto-Post Output Journal") then begin
            AutoPostOutput();
        end;
        if (SFISetupRecLcl."ORB IWX Auto Post Consumption" = SFISetupRecLcl."ORB IWX Auto Post Consumption"::"Yes - Auto-Post Consumption Journal") then begin
            AutoPostConsumption();
        end;
    end;

    procedure AutoPostOutput()
    var
        lrecTCMConfig: Record "SFI Client Configuration";
        lrecOutputLine: record "Item Journal Line";
        lcuItemJnlMgmt: codeunit ItemJnlManagement;
        lbJnlSelected: Boolean;
        lrecItemJnlBatch: Record "Item Journal Batch";
        dd: Record "Prod. Order Line";
    begin

        // Commits after each line.
        lcuItemJnlMgmt.TemplateSelection(
          PAGE::"Output Journal",
          5,
          FALSE,
          lrecOutputLine,
          lbJnlSelected
        );

        /*
        lrecTCMConfig.Reset();
        lrecTCMConfig.SetFilter("Output Batch Name", '<>%1', '');
        if lrecTCMConfig.FindSet(false) then begin
            repeat
                // output
                if (lrecTCMConfig."Output Batch Name" <> '') then begin
                    lrecOutputLine.SETRANGE("Journal Batch Name", lrecTCMConfig."Output Batch Name");
                    lrecOutputLine.SetRange("ORB IWX AutoPost State", lrecOutputLine."ORB IWX AutoPost State"::Unposted);
                    if lrecOutputLine.FINDSET(FALSE) then begin
                        repeat
                            postSingleLine(lrecOutputLine);
                            Commit(); // !!!!!!!!!  Commits after each line post,
                        until (lrecOutputLine.Next() = 0);
                    end;
                end;
            until lrecTCMConfig.Next() = 0;
        end;
        */

        lrecItemJnlBatch.Reset();
        lrecItemJnlBatch.SetRange("ORB Auto Post", true);
        if lrecItemJnlBatch.FindSet() then
            repeat
                // output
                lrecOutputLine.SETRANGE("Journal Batch Name", lrecItemJnlBatch.Name);
                //lrecOutputLine.SetRange("ORB IWX AutoPost State", lrecOutputLine."ORB IWX AutoPost State"::Unposted);
                lrecOutputLine.SetFilter("ORB IWX AutoPost State", '%1|%2', lrecOutputLine."ORB IWX AutoPost State"::Unposted, lrecOutputLine."ORB IWX AutoPost State"::Errored);
                if lrecOutputLine.FINDSET(FALSE) then begin
                    repeat
                        postSingleLine(lrecOutputLine);
                        Commit(); // !!!!!!!!!  Commits after each line post,
                    until (lrecOutputLine.Next() = 0);
                end;
            until lrecItemJnlBatch.Next() = 0;
    end;

    procedure AutoPostConsumption()
    Var
        lrecTCMConfig: Record "SFI Client Configuration";
        lrecConsumptionLine: record "Item Journal Line";
        lcuItemJnlMgmt: codeunit ItemJnlManagement;
        lbJnlSelected: Boolean;
        lrecItemJnlBatch: Record "Item Journal Batch";
    begin
        // Commits after each line.
        lcuItemJnlMgmt.TemplateSelection(Page::"Consumption Journal", 4, false, lrecConsumptionLine, lbJnlSelected);

        /*
        lrecTCMConfig.Reset();
        lrecTCMConfig.SetFilter("Consumption Batch Name", '<>%1', '');
        if lrecTCMConfig.FINDSET(false) then begin
            repeat
                // consumption
                if (lrecTCMConfig."Consumption Batch Name" <> '') then begin
                    lrecConsumptionLine.SETRANGE("Journal Batch Name", lrecTCMConfig."Consumption Batch Name");
                    lrecConsumptionLine.SetRange("ORB IWX AutoPost State", lrecConsumptionLine."ORB IWX AutoPost State"::Unposted);
                    if lrecConsumptionLine.FINDSET(false) then begin
                        repeat
                            postSingleLine(lrecConsumptionLine);
                            Commit(); // !!!!!!!!!  Commits after each line post,
                        until (lrecConsumptionLine.NEXT() = 0);
                    end;
                end;
            Until (lrecTCMConfig.Next() = 0);
        end;
        */
        lrecItemJnlBatch.Reset();
        lrecItemJnlBatch.SetRange("ORB Auto Post", true);
        if lrecItemJnlBatch.FindSet() then
            repeat
                // consumption
                lrecConsumptionLine.SETRANGE("Journal Batch Name", lrecItemJnlBatch.Name);
                lrecConsumptionLine.SetRange("ORB IWX AutoPost State", lrecConsumptionLine."ORB IWX AutoPost State"::Unposted);
                if lrecConsumptionLine.FINDSET(false) then begin
                    repeat
                        postSingleLine(lrecConsumptionLine);
                        Commit(); // !!!!!!!!!  Commits after each line post,
                    until (lrecConsumptionLine.NEXT() = 0);
                end;
            until lrecItemJnlBatch.Next() = 0;
    end;

    procedure postSingleLine(precItemJournalLine: Record "Item Journal Line");
    var
        lrecSingleLine: Record "Item Journal Line";
    begin
        lrecSingleLine.SetCurrentKey("Journal Template Name", "Journal Batch Name", "Line No.");

        if not lrecSingleLine.Get(precItemJournalLine."Journal Template Name", precItemJournalLine."Journal Batch Name", precItemJournalLine."Line No.") then
            exit;

        lrecSingleLine.SetRecFilter(); // only post this single line.

        if (not Codeunit.Run(Codeunit::"Item Jnl.-Post Batch", lrecSingleLine)) then begin
            lrecSingleLine."ORB IWX AutoPost State" := lrecSingleLine."ORB IWX AutoPost State"::Errored;
            lrecSingleLine."ORB IWX AutoPost Error DT" := CurrentDateTime();
            lrecSingleLine."ORB IWX AutoPost Error Message" := CopyStr(GetLastErrorText(), 1, MaxStrLen(lrecSingleLine."ORB IWX AutoPost Error Message"));
            if lrecSingleLine.Modify() then begin
                MovetoErrorBatch(lrecSingleLine);
            end;
        end;
    end;

    procedure MovetoErrorBatch(precItemJournalLine: Record "Item Journal Line");
    var
        lrecItemJnlLine: Record "Item Journal Line";
        lrecItemJnlBatch: Record "Item Journal Batch";
        ltxtErrBatchName: Code[10];
        lintNextLineNo: Integer;
    begin
        //ltxtErrBatchName := precItemJournalLine."Journal Batch Name" + '-ER';
        ltxtErrBatchName := 'OUTPUTERR';
        if not lrecItemJnlBatch.get(precItemJournalLine."Journal Template Name", ltxtErrBatchName) then begin
            lrecItemJnlBatch.Init();
            lrecItemJnlBatch."Journal Template Name" := precItemJournalLine."Journal Template Name";
            lrecItemJnlBatch.Name := ltxtErrBatchName;
            lrecItemJnlBatch.Insert(true);
        end;

        lintNextLineNo := 0;
        lrecItemJnlLine.Reset();
        lrecItemJnlLine.SetRange("Journal Template Name", precItemJournalLine."Journal Template Name");
        lrecItemJnlLine.SetRange("Journal Batch Name", ltxtErrBatchName);
        if lrecItemJnlLine.FindLast() then
            lintNextLineNo := lrecItemJnlLine."Line No.";

        lintNextLineNo += 1;

        lrecItemJnlLine.init;
        lrecItemJnlLine.TransferFields(precItemJournalLine);
        lrecItemJnlLine."Journal Batch Name" := ltxtErrBatchName;
        lrecItemJnlLine."Line No." := lintNextLineNo;
        lrecItemJnlLine.Insert();

        precItemJournalLine.Delete(true);
    end;
}

