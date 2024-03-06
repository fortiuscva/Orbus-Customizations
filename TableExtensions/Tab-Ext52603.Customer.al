tableextension 52603 "ORB Customer" extends Customer
{
    fields
    {
        field(52600; "ORB Auto Send Email"; Boolean)
        {
            Caption = 'Auto Send Email';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                CustomReportSelectionRecLcl: Record "Custom Report Selection";
                CustomReportLayoutRecLcl: Record "Custom Report Layout";
                DocumentLayoutNotFoundLbl: Label 'Document Layout not found for %1';
            begin
                if rec."ORB Auto Send Email" then begin
                    CustomReportSelectionRecLcl.Reset();
                    CustomReportSelectionRecLcl.SetRange("Source Type", Database::Customer);
                    CustomReportSelectionRecLcl.SetRange("Source No.", rec."No.");
                    CustomReportSelectionRecLcl.SetRange(Usage, CustomReportSelectionRecLcl.Usage::"S.Invoice");
                    if CustomReportSelectionRecLcl.FindFirst() then begin
                        if CustomReportSelectionRecLcl."Custom Report Description" = '' then
                            Error('Custom Report Description is blank');

                        if CustomReportSelectionRecLcl."Email Body Layout Description" = '' then begin
                            Error('Email Body Layout Description is blank');

                            CustomReportLayoutRecLcl.reset();
                            CustomReportLayoutRecLcl.setrange(Code, CustomReportSelectionRecLcl."Custom Report Layout Code");
                            if CustomReportLayoutRecLcl.FindFirst() then
                                if CustomReportLayoutRecLcl.Type <> CustomReportLayoutRecLcl.Type::Word then
                                    Error('Custom Report Layout is not word');
                        end;
                        if CustomReportSelectionRecLcl."Send To Email" = '' then
                            Error('Send To Email is blank');
                    end else
                        Error(DocumentLayoutNotFoundLbl, rec."No.");
                end;
            end;
        }
    }


}