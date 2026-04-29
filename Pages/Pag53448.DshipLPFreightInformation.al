page 53448 "ORB DshipLPFreightInformation"

{
    APIgroup = 'orbus';
    APIPublisher = 'orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'DshipFeightInformationAPI';
    EntityName = 'DshipLPFreightInformation';
    EntitySetName = 'DshipLPFreightInformation';
    PageType = API;
    Editable = false;
    DelayedInsert = false;
    SourceTable = "DSHIP Label Data";


    layout
    {
        area(Content)
        {
            repeater(general)

            {
                field(LicensePlateNo; Rec."License Plate No.")
                {
                    Caption = 'LIcense Palte No';
                }
                field(Cost; Rec.Cost)
                {
                    Caption = 'Carrier Name';
                }
                field(ORBHandling; Rec."ORB Handling")
                {
                    Caption = 'Handling';
                }
                field(ORBFreightQuote; Rec."ORB Freight Quote")
                {
                    Caption = 'Freight Quote';
                }
                field(PackageTrackingNo; Rec."Package Tracking No.")
                {
                    Caption = 'Package Tracking No.';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'LP Created At';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'LP Modified At';
                }

            }

        }
    }

}