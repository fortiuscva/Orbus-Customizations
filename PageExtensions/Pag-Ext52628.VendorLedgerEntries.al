
pageextension 52628 "ORB Vendor Ledger Entries" extends "Vendor Ledger Entries"
{
    layout
    {
        addafter("Vendor No.")
        {
            field("ORB Vendor Name"; VendorNameVarGbl)
            {
                ApplicationArea = ALL;
                Editable = false;
                ToolTip = 'Specifies the Vendor Name';
                Caption = 'Vendor Name';

            }
        }

    }
    var
        VendorNameVarGbl: Text;

    trigger OnAfterGetRecord()
    var
        lVendorRecLcl: record Vendor;
    begin
        lVendorRecLcl.Reset();
        lVendorRecLcl.SetRange("No.", Rec."Vendor No.");
        If lVendorRecLcl.FindFirst() then begin
            VendorNameVarGbl := lVendorRecLcl.Name;
        end else
            VendorNameVarGbl := ''
    end;

}



