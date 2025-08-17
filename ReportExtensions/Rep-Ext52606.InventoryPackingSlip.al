reportextension 52606 "ORB Inventory Packing Slip" extends "Picking List"
{
    //RDLCLayout = './Reports/Layouts/OrbusPickingList_Mod.rdl'= OrbusPickingList_ModifiedList;

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
                SalesHeaderRecLcl.reset;
                SalesHeaderRecLcl.SetFilter("No.", "Warehouse Activity Header"."Source No.");
                SalesHeaderRecLcl.SetRange("Document Type", SalesHeaderRecLcl."Document Type"::Order);
                If SalesHeaderRecLcl.FindFirst() then begin
                    CustomerSupportVarGbl := SalesHeaderRecLcl."ORB Customer Support";
                    MustHaveDateVarGbl := SalesHeaderRecLcl."In-Hands Date";
                end;
            end;

        }
    }

    rendering
    {
        layout(OrbusPickingList_ModifiedList)

        {
            Type = RDLC;
            LayoutFile = './Reports/Layouts/OrbusPickingList_ModifiedList.rdl';

        }
    }
    var
        CustomerSupportVarGbl: CODE[20];
        MustHaveDateVarGbl: Date;


}