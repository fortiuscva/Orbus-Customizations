page 53418 "ORB LIFT Ship-To Address API"
{
    APIGroup = 'Orbus';
    APIPublisher = 'Orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'liftShipToAddressAPI';
    DelayedInsert = true;
    EntityName = 'LIFTShipToAddressAPI';
    EntitySetName = 'LIFTShipToAddressAPI';
    PageType = API;
    SourceTable = "ORB LIFT Ship-To Address";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(customerNo; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                }
                field("code"; Rec."Code")
                {
                    Caption = 'Code';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(name2; Rec."Name 2")
                {
                    Caption = 'Name 2';
                }
                field(address; Rec.Address)
                {
                    Caption = 'Address';
                }
                field(address2; Rec."Address 2")
                {
                    Caption = 'Address 2';
                }
                field(city; Rec.City)
                {
                    Caption = 'City';
                }
                field(contact; Rec.Contact)
                {
                    Caption = 'Contact';
                }
                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                }
                field(countryRegionCode; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                }
                field(postCode; Rec."Post Code")
                {
                    Caption = 'Post Code';
                }
                field(county; Rec.County)
                {
                    Caption = 'County';
                }
                field(eMail; Rec."E-Mail")
                {
                    Caption = 'E-Mail';
                }
                field(active; Rec.Active)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        LIFTShipToAddressMgmt.PropagateOnShipToAddressInsert(Rec);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        LIFTShipToAddressMgmt.PropagateOnShipToAddressModify(Rec);
    end;

    var
        LIFTShipToAddressMgmt: Codeunit "ORB LIFT Ship-To Address Mgmt";
}
