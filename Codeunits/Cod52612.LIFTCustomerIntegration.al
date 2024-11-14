codeunit 52612 "ORB LIFT Customer Integration"
{
    [ServiceEnabled]
    procedure ReadCustomerData(custData: text) ReturnValue: text
    var

        LIFTIntegration: Codeunit "ORB LIFT Integration";
    begin
        LIFTIntegration.ProcessRequest(LIFTAPICodesGbl.GetCustomersAPICode(), custData);
    end;

    var
        LIFTAPICodesGbl: Codeunit "ORB LIFT API Codes";
}
