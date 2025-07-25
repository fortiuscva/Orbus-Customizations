page 53404 "LIFT Country Region"
{
    APIGroup = 'Orbus';
    APIPublisher = 'Orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'liftCountryRegion';
    DelayedInsert = true;
    EntityName = 'LIFTCountryRegion';
    EntitySetName = 'LIFTCountryRegion';
    PageType = API;
    SourceTable = "Country/Region";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("code"; Rec."Code")
                {
                    Caption = 'Code';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(isoCode; Rec."ISO Code")
                {
                    Caption = 'ISO Code';
                }
                field(isoNumericCode; Rec."ISO Numeric Code")
                {
                    Caption = 'ISO Numeric Code';
                }
                field(euCountryRegionCode; Rec."EU Country/Region Code")
                {
                    Caption = 'EU Country/Region Code';
                }
                field(intrastatCode; Rec."Intrastat Code")
                {
                    Caption = 'Intrastat Code';
                }
                field(addressFormat; Rec."Address Format")
                {
                    Caption = 'Address Format';
                }
                field(contactAddressFormat; Rec."Contact Address Format")
                {
                    Caption = 'Contact Address Format';
                }
                field(vatScheme; Rec."VAT Scheme")
                {
                    Caption = 'VAT Scheme';
                }
                field(lastModifiedDateTime; Rec."Last Modified Date Time")
                {
                    Caption = 'Last Modified Date Time';
                }
                field(countyName; Rec."County Name")
                {
                    Caption = 'County Name';
                }
                field(isoCodeCL; Rec."ISO Code -CL-")
                {
                    Caption = 'ISO Alphabetic Code';
                }
                field(satCountryCode; Rec."SAT Country Code")
                {
                    Caption = 'SAT Country Code';
                }
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'SystemCreatedAt';
                }
                field(systemCreatedBy; Rec.SystemCreatedBy)
                {
                    Caption = 'SystemCreatedBy';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(systemModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'SystemModifiedAt';
                }
                field(systemModifiedBy; Rec.SystemModifiedBy)
                {
                    Caption = 'SystemModifiedBy';
                }
            }
        }
    }
}
