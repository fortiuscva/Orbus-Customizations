report 52620 "ORB Update Historic Entries"
{
    ApplicationArea = All;
    Caption = 'Update Historic Entries in Posted Invt. Pick';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem(PostedInvtPickHeader; "Posted Invt. Pick Header")
        {
            RequestFilterFields = "No.";
            DataItemTableView = sorting("No.");

            trigger OnAfterGetRecord()
            var
                PostedInvtPickLine: Record "Posted Invt. Pick Line";
            begin
                if "ORB Order No." = '' then begin
                    PostedInvtPickLine.SetRange("No.", "No.");
                    PostedInvtPickLine.SetRange("Source Document", PostedInvtPickLine."Source Document"::"Sales Order");

                    if PostedInvtPickLine.FindFirst() then begin
                        "ORB Order No." := PostedInvtPickLine."Source No.";
                        PostedInvtPickLine.Modify();
                        UpdatedCount += 1;
                    end;
                end;
            end;
        }

    }
    trigger OnPostReport()
    begin
        if UpdatedCount > 0 then
            Message('%1 Posted Inventory Picks updated successfully.', UpdatedCount)
        else
            Message('No Posted Inventory Picks required updating.');
    end;

    var
        UpdatedCount: Integer;
}
