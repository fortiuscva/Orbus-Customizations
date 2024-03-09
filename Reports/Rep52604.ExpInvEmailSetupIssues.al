report 52604 "Exp. Inv. Email Setup Issues"
{
    Caption = 'Export Invoice Email Setup Issues';
    ProcessingOnly = true;
    UseRequestPage = false;

    dataset
    {
        dataitem(Integer; Integer)
        {
            DataItemTableView = sorting(Number) where(Number = const(1));

            trigger OnAfterGetRecord()
            begin
                PrintIncorrectCustomerForEMail();
            end;

        }
    }



    procedure PrintIncorrectCustomerForEMail()
    var
        CustomerRecLcl: Record Customer;
        CustomReportSelectionRecLcl: Record "Custom Report Selection";
        TempExcelBufferRecLcl: Record "Excel Buffer" temporary;
        CustomReportLayoutRecLcl: Record "Custom Report Layout";
        GroupPSIByCustomerQueLcl: Query "ORB GroupPSIByCustomer";
        SkipVarLcl: Boolean;

    begin
        TempExcelBufferRecLcl.DeleteAll();
        TempExcelBufferRecLcl.AddColumn('Customer No.', false, '', true, false, true, '', TempExcelBufferRecLcl."Cell Type"::Text);
        TempExcelBufferRecLcl.AddColumn('Name', false, '', true, false, true, '', TempExcelBufferRecLcl."Cell Type"::Text);
        TempExcelBufferRecLcl.AddColumn('Warning Message', false, '', true, false, true, '', TempExcelBufferRecLcl."Cell Type"::Text);


        GroupPSIByCustomerQueLcl.Open();
        While GroupPSIByCustomerQueLcl.Read() Do begin
            Clear(WarningMessageVarGbl);
            if CustomerRecLcl.Get(GroupPSIByCustomerQueLcl.Sell_to_Customer_No_) then begin
                if not CustomerRecLcl."ORB Auto Send Email" then
                    PrepareWarningMsg('Auto Send Email is not Enabled');

                CustomReportSelectionRecLcl.Reset();
                CustomReportSelectionRecLcl.SetRange("Source Type", Database::Customer);
                CustomReportSelectionRecLcl.SetRange("Source No.", CustomerRecLcl."No.");
                CustomReportSelectionRecLcl.SetRange(Usage, CustomReportSelectionRecLcl.Usage::"S.Invoice");
                if not CustomReportSelectionRecLcl.FindFirst() then
                    PrepareWarningMsg('No Document Layout found with usage Invoice');

                SkipVarLcl := false;
                CustomReportSelectionRecLcl.Reset();
                CustomReportSelectionRecLcl.SetRange("Source Type", Database::Customer);
                CustomReportSelectionRecLcl.SetRange("Source No.", CustomerRecLcl."No.");
                CustomReportSelectionRecLcl.SetRange(Usage, CustomReportSelectionRecLcl.Usage::"S.Invoice");
                if CustomReportSelectionRecLcl.FindSet() then
                    repeat
                        if CustomReportSelectionRecLcl."Send To Email" = '' then begin
                            PrepareWarningMsg('There is atleast one document layout which has blank Send to Email');
                            SkipVarLcl := false;
                        end;
                    until (CustomReportSelectionRecLcl.Next() = 0) or SkipVarLcl;

                CustomReportSelectionRecLcl.Reset();
                CustomReportSelectionRecLcl.SetRange("Source Type", Database::Customer);
                CustomReportSelectionRecLcl.SetRange("Source No.", CustomerRecLcl."No.");
                CustomReportSelectionRecLcl.SetRange(Usage, CustomReportSelectionRecLcl.Usage::"S.Invoice");
                CustomReportSelectionRecLcl.SetRange("Use for Email Body", true);
                CustomReportSelectionRecLcl.SetRange("Email Body Layout Code", '');
                if CustomReportSelectionRecLcl.FindFirst() then
                    PrepareWarningMsg('There is atleast one document layout which has is to set for Email Body and blank "Body Layout" selected');

                SkipVarLcl := false;
                CustomReportSelectionRecLcl.Reset();
                CustomReportSelectionRecLcl.SetRange("Source Type", Database::Customer);
                CustomReportSelectionRecLcl.SetRange("Source No.", CustomerRecLcl."No.");
                CustomReportSelectionRecLcl.SetRange(Usage, CustomReportSelectionRecLcl.Usage::"S.Invoice");
                CustomReportSelectionRecLcl.SetRange("Use for Email Body", true);
                CustomReportSelectionRecLcl.SetFilter("Email Body Layout Code", '<>%1');
                if CustomReportSelectionRecLcl.FindFirst() then
                    repeat
                        CustomReportLayoutRecLcl.reset();
                        CustomReportLayoutRecLcl.setrange(Code, CustomReportSelectionRecLcl."Email Body Layout Code");
                        if not CustomReportLayoutRecLcl.FindFirst() then begin
                            PrepareWarningMsg('Invalid Body Layout Selected');
                            SkipVarLcl := false;
                        end else begin
                            if CustomReportLayoutRecLcl.Type <> CustomReportLayoutRecLcl.Type::Word then begin
                                PrepareWarningMsg('There is atlease one document layout selected for email body which is not a Word document');
                                SkipVarLcl := false;
                            end;
                        end;
                    until (CustomReportSelectionRecLcl.Next() = 0) or SkipVarLcl;

                CustomReportSelectionRecLcl.Reset();
                CustomReportSelectionRecLcl.SetRange("Source Type", Database::Customer);
                CustomReportSelectionRecLcl.SetRange("Source No.", CustomerRecLcl."No.");
                CustomReportSelectionRecLcl.SetRange(Usage, CustomReportSelectionRecLcl.Usage::"S.Invoice");
                CustomReportSelectionRecLcl.SetFilter("Custom Report Layout Code", '<>%1');
                if not CustomReportSelectionRecLcl.FindFirst() then
                    PrepareWarningMsg('There is no document layout which is using a custom layout.');
            end;

            if WarningMessageVarGbl <> '' then begin
                TempExcelBufferRecLcl.NewRow();
                TempExcelBufferRecLcl.AddColumn(CustomerRecLcl."No.", false, '', false, false, false, '', TempExcelBufferRecLcl."Cell Type"::Text);
                TempExcelBufferRecLcl.AddColumn(CustomerRecLcl.Name, false, '', false, false, false, '', TempExcelBufferRecLcl."Cell Type"::Text);
                TempExcelBufferRecLcl.AddColumn(WarningMessageVarGbl, false, '', false, false, false, '', TempExcelBufferRecLcl."Cell Type"::Text);
            end;
        end;

        TempExcelBufferRecLcl.CreateNewBook('Customer List');
        TempExcelBufferRecLcl.WriteSheet('Customer List', CompanyName, UserId);

        TempExcelBufferRecLcl.CloseBook();
        TempExcelBufferRecLcl.SetFriendlyFilename('Customers Export');
        TempExcelBufferRecLcl.OpenExcel();
    end;


    procedure PrepareWarningMsg(WarningMsgVarLcl: Text);
    begin
        if WarningMessageVarGbl = '' then
            WarningMessageVarGbl := WarningMsgVarLcl
        else
            WarningMessageVarGbl += '; ' + WarningMsgVarLcl;
    end;

    var
        WarningMessageVarGbl: Text;

}
