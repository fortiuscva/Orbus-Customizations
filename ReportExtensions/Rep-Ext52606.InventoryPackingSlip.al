reportextension 52606 "ORB Inventory Packing Slip" extends "Picking List"
{
    dataset
    {
        add("Warehouse Activity Header")
        {
            column(ORBCustomerSupportVarGbL; CustomerSupportVarGbl)
            {

            }
            column(ORBMustHaveDateVarGbl; MustHaveDateVarGbl)
            {

            }
        }
        modify("Warehouse Activity Header")
        {
            trigger OnAfterAfterGetRecord()
            var
                SalesHeaderRecLcl: Record "Sales Header";
            begin
                SalesHeaderRecLcl.reset;
                Clear(CustomerSupportVarGbl);
                Clear(MustHaveDateVarGbl);
                if SalesHeaderRecLcl.Get("Warehouse Activity Header"."Source No.") then
                    if SalesHeaderRecLcl."Document Type" = SalesHeaderRecLcl."Document Type"::Order then begin
                        CustomerSupportVarGbl := SalesHeaderRecLcl."ORB Customer Support";
                        MustHaveDateVarGbl := SalesHeaderRecLcl."In-Hands Date";
                    end;

            end;

        }
    }
    var
        CustomerSupportVarGbl: CODE[20];
        MustHaveDateVarGbl: Date;



}