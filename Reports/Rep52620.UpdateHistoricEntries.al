report 52620 "ORB Update Historic Entries"
{
    ApplicationArea = All;
    Caption = 'Update Historic Entries in Posted Invt. Pick';
    UsageCategory = ReportsAndAnalysis;
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
                    end;
                end;
            end;
        }
    }
}
