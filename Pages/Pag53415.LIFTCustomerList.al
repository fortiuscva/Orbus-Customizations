page 53415 "ORB LIFT Customer List"
{
    ApplicationArea = All;
    Caption = 'LIFT Customer List';
    PageType = List;
    SourceTable = "ORB LIFT Customer Buffer";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field(Address; Rec.Address)
                {
                    ToolTip = 'Specifies the value of the Address field.', Comment = '%';
                }
                field(City; Rec.City)
                {
                    ToolTip = 'Specifies the value of the City field.', Comment = '%';
                }
                field(Contact; Rec.Contact)
                {
                    ToolTip = 'Specifies the value of the Contact field.', Comment = '%';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ToolTip = 'Specifies the value of the Phone No. field.', Comment = '%';
                }
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ToolTip = 'Specifies the value of the Ship-to Code field.', Comment = '%';
                }
                field("Credit Limit (LCY)"; Rec."Credit Limit (LCY)")
                {
                    ToolTip = 'Specifies the value of the Credit Limit (LCY) field.', Comment = '%';
                }
                field("Customer Posting Group"; Rec."Customer Posting Group")
                {
                    ToolTip = 'Specifies the value of the Customer Posting Group field.', Comment = '%';
                }
                field("Customer Price Group"; Rec."Customer Price Group")
                {
                    ToolTip = 'Specifies the value of the Customer Price Group field.', Comment = '%';
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ToolTip = 'Specifies the value of the Payment Terms Code field.', Comment = '%';
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ToolTip = 'Specifies the value of the Salesperson Code field.', Comment = '%';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ToolTip = 'Specifies the value of the Country/Region Code field.', Comment = '%';
                }
                field(Blocked; Rec.Blocked)
                {
                    ToolTip = 'Specifies the value of the Blocked field.', Comment = '%';
                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    ToolTip = 'Specifies the value of the Payment Method Code field.', Comment = '%';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ToolTip = 'Specifies the value of the Last Date Modified field.', Comment = '%';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ToolTip = 'Specifies the value of the Post Code field.', Comment = '%';
                }
                field(County; Rec.County)
                {
                    ToolTip = 'Specifies the value of the County field.', Comment = '%';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ToolTip = 'Specifies the value of the E-Mail field.', Comment = '%';
                }
                field("Tax Liable"; Rec."Tax Liable")
                {
                    ToolTip = 'Specifies the value of the Tax Liable field.', Comment = '%';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ToolTip = 'Specifies the value of the Currency Code field.', Comment = '%';
                }
                field("Currency Id"; Rec."Currency Id")
                {
                    ToolTip = 'Specifies the value of the Currency Id field.', Comment = '%';
                }
                field("Contact ID"; Rec."Contact ID")
                {
                    ToolTip = 'Specifies the value of the Contact ID field.', Comment = '%';
                }
                field(Needs_Approval; Rec.Needs_Approval)
                {
                    ToolTip = 'Specifies the value of the Needs_Approval field.', Comment = '%';
                }
                field("Approval Status"; Rec."ORB Customer Approval Status")
                {

                }
                field("Magento ID"; Rec."Magento ID")
                {
                    ToolTip = 'Specifies the value of the Magento ID field.', Comment = '%';
                }
                field(ORBAPPAssociationsName; Rec.ORBAPPAssociationsName)
                {
                    ToolTip = 'Specifies the value of the ORBAPPAssociationsName field.', Comment = '%';
                }
                field("ORB Regional Sales Executive"; Rec."ORB Regional Sales Executive")
                {
                    ToolTip = 'Specifies the value of the ORB Regional Sales Executive field.', Comment = '%';
                }
                field("ORB Customer Support"; Rec."ORB Customer Support")
                {
                    ToolTip = 'Specifies the value of the ORB Customer Support field.', Comment = '%';
                }
                field("ORB Business Development"; Rec."ORB Business Development")
                {
                    ToolTip = 'Specifies the value of the ORB Business Development field.', Comment = '%';
                }
                field("ORB LIFT Customer"; Rec."ORB LIFT Customer")
                {
                    ToolTip = 'Specifies the value of the ORB LIFT Customer field.', Comment = '%';
                }
                field("First Invoice Date"; Rec."First Invoice Date")
                {
                    ToolTip = 'Specifies the value of the First Invoice Date field.', Comment = '%';
                }
                field("Magento Contact No."; Rec."Magento Contact No.")
                {
                    ToolTip = 'Specifies the value of the Magento Contact No. field.', Comment = '%';
                }
                field("Magento Contact Name"; Rec."Magento Contact Name")
                {
                    ToolTip = 'Specifies the value of the Magento Contact Name field.', Comment = '%';
                }
                field("Magento Contact Email"; Rec."Magento Contact Email")
                {
                    ToolTip = 'Specifies the value of the Magento Contact Email field.', Comment = '%';
                }
                field("Needs Magento ID"; Rec."Needs Magento ID")
                {
                    ToolTip = 'Specifies the value of the Needs Magento ID field.', Comment = '%';
                }
                field("Last Visit Date"; Rec."Last Visit Date")
                {
                    ToolTip = 'Specifies the value of the Last Visit Date field.', Comment = '%';
                }
                field("Last Invoice Date"; Rec."Last Invoice Date")
                {
                    ToolTip = 'Specifies the value of the Last Invoice Date field.', Comment = '%';
                }
                field(International; Rec.International)
                {
                    ToolTip = 'Specifies the value of the International field.', Comment = '%';
                }
                field(Channel; Rec.Channel)
                {
                    ToolTip = 'Specifies the value of the Channel field.', Comment = '%';
                }
                field(Industry; Rec.Industry)
                {
                    ToolTip = 'Specifies the value of the Industry field.', Comment = '%';
                }
                field(CustomerType; Rec.CustomerType)
                {
                    ToolTip = 'Specifies the value of the CustomerType field.', Comment = '%';
                }
            }
        }
    }
}
