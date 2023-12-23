reportextension 52604 "ORB DSHIP Commercial Invoice" extends "DSHIP Commercial Invoice"
{
    dataset
    {
        add(diLPHeader)
        {
            column(ORBTaxID_SalesHeader; SalesHeaderRecGbl."ORB Tax ID")
            {

            }
            column(ORBDeclaredValue_SalesHeader; SalesHeaderRecGbl."ORB Declared Value")
            { }
            column(ORBInternationalContact_SalesHeader; SalesHeaderRecGbl."ORB International Contact")
            { }
            column(ORBTaxIDLbl; TaxIDLbl)
            { }
            column(ORBDeclaredValueLbl; DeclaredValueLbl)
            { }
            column(ORBInternationalContactLbl; InternationalContactLbl)
            { }
        }
        modify(diLPHeader)
        {
            trigger OnAfterAfterGetRecord()
            begin
                if diLPHeader."Source Document" = diLPHeader."Source Document"::"Sales Order" then
                    if SalesHeaderRecGbl.get(SalesHeaderRecGbl."Document Type"::Order, diLPHeader."Source No.") then;
            end;
        }
    }

    Var
        SalesHeaderRecGbl: Record "Sales Header";
        TaxIDLbl: Label 'Tax ID';
        DeclaredValueLbl: Label 'Declared Value';
        InternationalContactLbl: Label 'International Contact';

}
