codeunit 53403 "ORB LIFT Ship-To Address Mgmt"
{
    procedure PropagateOnShipToAddressInsert(var LIFTShipToAddress: Record "ORB LIFT Ship-To Address")
    begin
        if not ShipToAddress.Get(LIFTShipToAddress."Customer No.", LIFTShipToAddress.Code) then begin
            ShipToAddress.Init();
            ShipToAddress.Validate("Customer No.", LIFTShipToAddress."Customer No.");
            ShipToAddress.Validate(Code, LIFTShipToAddress.Code);
            ShipToAddress.Insert();
        end;
        UpdateShipToAddress(LIFTShipToAddress);
    end;

    procedure PropagateOnShipToAddressModify(var LIFTShipToAddress: Record "ORB LIFT Ship-To Address")
    begin
        if ShipToAddress.Get(LIFTShipToAddress."Customer No.", LIFTShipToAddress.Code) then
            UpdateShipToAddress(LIFTShipToAddress);
    end;

    procedure UpdateShipToAddress(var LIFTShipToAddress: Record "ORB LIFT Ship-To Address")
    begin
        ValidateShipToAddressFields(LIFTShipToAddress);
        ShipToAddress.Modify();
    end;

    procedure ValidateShipToAddressFields(var LIFTShipToAddress: Record "ORB LIFT Ship-To Address")
    begin
        ShipToAddress.Validate(Name, LIFTShipToAddress.Name);
        ShipToAddress.Validate("Name 2", LIFTShipToAddress."Name 2");
        ShipToAddress.Validate(Address, LIFTShipToAddress.Address);
        ShipToAddress.Validate("Address 2", LIFTShipToAddress."Address 2");
        ShipToAddress.Validate(City, LIFTShipToAddress.City);
        ShipToAddress.Validate(Contact, LIFTShipToAddress.Contact);
        ShipToAddress.Validate("Phone No.", LIFTShipToAddress."Phone No.");
        ShipToAddress.Validate("Country/Region Code", LIFTShipToAddress."Country/Region Code");
        ShipToAddress.Validate("Post Code", LIFTShipToAddress."Post Code");
        ShipToAddress.Validate(County, LIFTShipToAddress.County);
        ShipToAddress.Validate("E-Mail", LIFTShipToAddress."E-Mail");
    end;

    var
        ShipToAddress: Record "Ship-to Address";
}
