pageextension 52633 "ORB DSHIP Package Worksheet" extends "DSHIP Package Worksheet"
{
    layout
    {
        modify(edtScan)
        {
            trigger OnAfterValidate()
            begin
                FactBoxUpdates();
                CurrPage.shipInfoFactBox.Page.SetORBValues(189);
            end;
        }
    }
}
