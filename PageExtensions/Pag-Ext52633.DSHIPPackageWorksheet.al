pageextension 52633 "ORB DSHIP Package Worksheet" extends "DSHIP Package Worksheet"
{
    layout
    {
        modify(edtScan)
        {
            trigger OnAfterValidate()
            var
                SingleInstanceCU: Codeunit "ORB Orbus Single Instance";
                LastCommandRan: Text;
            begin
                LastCommandRan := SingleInstanceCU.GetLastCommandRan();
                if (LastCommandRan = '--upa') or (LastCommandRan = '--unpackall') then begin
                    FactBoxUpdates();
                    CurrPage.shipInfoFactBox.Page.InitializeValues();
                end;
            end;
        }
        modify("New License Plate No.")
        {
            trigger OnAfterValidate()
            var
                FactBox: page "DSHIP Order Info. Factbox";
            begin
                CurrPage.shipInfoFactBox.Page.SetLicensePlateNo(Rec."License Plate No.");
            end;
        }
    }
    trigger OnAfterGetRecord()
    var
        FactBox: page "DSHIP Order Info. Factbox";
    begin
        CurrPage.shipInfoFactBox.Page.SetLicensePlateNo(Rec."License Plate No.");
    end;
}
