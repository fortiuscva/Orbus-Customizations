codeunit 52609 "LIFT Sales Order Integration"
{
    [ServiceEnabled]
    procedure ReadSalesOrderData(salesData: text) ReturnValue: text
    var

        LIFTIntegration: Codeunit "ORB LIFT Integration";
    begin
        LIFTIntegration.ProcessRequest(LIFTAPICodesGbl.GetSalesOrderAPICode(), salesData);
    end;

    var
        LIFTAPICodesGbl: Codeunit "ORB LIFT API Codes";
}