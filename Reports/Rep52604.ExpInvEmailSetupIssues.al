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
        WarningMessageVarLcl: Text;
    begin
        TempExcelBufferRecLcl.DeleteAll();
        TempExcelBufferRecLcl.AddColumn('Customer No.', false, '', true, false, true, '', TempExcelBufferRecLcl."Cell Type"::Text);
        TempExcelBufferRecLcl.AddColumn('Name', false, '', true, false, true, '', TempExcelBufferRecLcl."Cell Type"::Text);
        TempExcelBufferRecLcl.AddColumn('Warning Message', false, '', true, false, true, '', TempExcelBufferRecLcl."Cell Type"::Text);


        GroupPSIByCustomerQueLcl.Open();
        While GroupPSIByCustomerQueLcl.Read() Do begin
            Clear(WarningMessageVarLcl);
            if CustomerRecLcl.Get(GroupPSIByCustomerQueLcl.Sell_to_Customer_No_) then begin
                if not CustomerRecLcl."ORB Auto Send Email" then
                    WarningMessageVarLcl := 'Auto Send Email is not Enabled;';

                CustomReportSelectionRecLcl.Reset();
                CustomReportSelectionRecLcl.SetRange("Source Type", Database::Customer);
                CustomReportSelectionRecLcl.SetRange("Source No.", CustomerRecLcl."No.");
                CustomReportSelectionRecLcl.SetRange(Usage, CustomReportSelectionRecLcl.Usage::"S.Invoice");
                if CustomReportSelectionRecLcl.FindFirst() then begin
                    if CustomReportSelectionRecLcl."Custom Report Description" = '' then
                        WarningMessageVarLcl += ';Custom Report Description is blank';

                    if CustomReportSelectionRecLcl."Email Body Layout Description" = '' then begin
                        WarningMessageVarLcl += ';Email Body Layout Description is blank';

                        CustomReportLayoutRecLcl.reset();
                        CustomReportLayoutRecLcl.setrange(Code, CustomReportSelectionRecLcl."Custom Report Layout Code");
                        if CustomReportLayoutRecLcl.FindFirst() then
                            if CustomReportLayoutRecLcl.Type <> CustomReportLayoutRecLcl.Type::Word then
                                WarningMessageVarLcl += ';Custom Report Layout is not word';
                    end;


                    if CustomReportSelectionRecLcl."Send To Email" = '' then
                        WarningMessageVarLcl += ';Send To Email is blank';


                end else
                    WarningMessageVarLcl += ';Document Layout not found';


                if WarningMessageVarLcl <> '' then begin
                    TempExcelBufferRecLcl.NewRow();
                    TempExcelBufferRecLcl.AddColumn(CustomerRecLcl."No.", false, '', false, false, false, '', TempExcelBufferRecLcl."Cell Type"::Text);
                    TempExcelBufferRecLcl.AddColumn(CustomerRecLcl.Name, false, '', false, false, false, '', TempExcelBufferRecLcl."Cell Type"::Text);
                    TempExcelBufferRecLcl.AddColumn(WarningMessageVarLcl, false, '', false, false, false, '', TempExcelBufferRecLcl."Cell Type"::Text);
                end;
            end;
        end;

        TempExcelBufferRecLcl.CreateNewBook('Customer List');
        TempExcelBufferRecLcl.WriteSheet('Customer List', CompanyName, UserId);

        TempExcelBufferRecLcl.CloseBook();
        TempExcelBufferRecLcl.SetFriendlyFilename('Customers Export');
        TempExcelBufferRecLcl.OpenExcel();
    end;

}
