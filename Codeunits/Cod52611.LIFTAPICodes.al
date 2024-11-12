codeunit 52611 "ORB LIFT API Codes"
{

    Subtype = Install;
    trigger OnInstallAppPerCompany()
    begin
        CreateAPICodesData();
    end;

    procedure CreateAPICodesData()
    begin
        LIFTAPICodesRecGbl.Init();
        LIFTAPICodesRecGbl.Code := 'SALESORDERS';
        if LIFTAPICodesRecGbl.Insert() then;

        LIFTAPICodesRecGbl.Init();
        LIFTAPICodesRecGbl.Code := 'CUSTOMERS';
        if LIFTAPICodesRecGbl.Insert() then;

        LIFTAPICodesRecGbl.Init();
        LIFTAPICodesRecGbl.Code := 'ITEMS';
        if LIFTAPICodesRecGbl.Insert() then;
    end;

    procedure GetSalesOrderAPICode() APICode: Code[20]
    begin
        Clear(LIFTAPICodesRecGbl);
        if LIFTAPICodesRecGbl.GET('SALESORDERS') then
            APICode := LIFTAPICodesRecGbl.Code;
    end;

    procedure GetCustomersAPICode() APICode: Code[20]
    begin
        Clear(LIFTAPICodesRecGbl);
        if LIFTAPICodesRecGbl.GET('CUSTOMERS') then
            APICode := LIFTAPICodesRecGbl.Code;
    end;

    procedure GetItemsAPICode() APICode: Code[20]
    begin
        Clear(LIFTAPICodesRecGbl);
        if LIFTAPICodesRecGbl.GET('ITEMS') then
            APICode := LIFTAPICodesRecGbl.Code;
    end;

    var
        LIFTAPICodesRecGbl: Record "ORB LIFT API Codes";

}
