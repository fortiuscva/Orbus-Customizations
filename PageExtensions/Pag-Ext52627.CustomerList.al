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
                Caption = 'Ship-to Street Address';

            }



            field("ORB Ship-to State"; Rec."ORB Ship-to State")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Filter By State';
                Caption = 'Ship-to State';

            }

            field("ORB Ship-to Zip"; ShiptoZipcodeVarGbl)
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Customer Street Address';
                Caption = 'Ship-to Street Address';

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
            StreetAddressVarGbl := ShiptoAddressRecLcl.Address;
            ShiptoZipcodeVarGbl := ShiptoAddressRecLcl."Post Code";
        end else begin
            StreetAddressVarGbl := '';
            ShiptoZipcodeVarGbl := '';
        end;
    end;
}
