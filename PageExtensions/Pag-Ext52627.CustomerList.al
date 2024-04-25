pageextension 52627 "ORB Customer List" extends "Customer List"
{
    layout
    {
        addlast(Control1)
        {
            field("ORB Ship-toStreetAddress"; StreetAddressVarGbl)
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Customer Street Address';
                Caption = 'Default Street Address';

            }
            field("ORB ShiptoState"; ShiptoStateVarGbl)
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Customer ship to State';
                Caption = 'Default Ship-to State';

            }
            field("ORB ShiptoZipCode"; ShiptoZipcodeVarGbl)
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Customer Ship-to State';
                Caption = 'Default Zip Code';

            }

        }

    }

    Var
        StreetAddressVarGbl: Text;
        ShiptoStateVarGbl: Text;
        ShiptoZipcodeVarGbl: Text;

    trigger OnAfterGetRecord()
    Var
        ShiptoAddressRecLcl: Record "Ship-to Address";
    begin
        ShiptoAddressRecLcl.Reset();
        ShiptoAddressRecLcl.SetRange("Customer No.", Rec."No.");
        ShiptoAddressRecLcl.SetRange(Code, Rec."Ship-to Code");
        If ShiptoAddressRecLcl.FindFirst() then begin
            ShiptoStateVarGbl := ShiptoAddressRecLcl.County;
            StreetAddressVarGbl := ShiptoAddressRecLcl.Address;
            ShiptoZipcodeVarGbl := ShiptoAddressRecLcl."Post Code";
        end else begin
            ShiptoStateVarGbl := '';
            StreetAddressVarGbl := '';
            ShiptoZipcodeVarGbl := '';
        end;
    end;
}
