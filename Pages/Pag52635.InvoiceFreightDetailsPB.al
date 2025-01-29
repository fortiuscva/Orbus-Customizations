page 52635 "ORB Invoice Freight Details PB"
{
    ApplicationArea = All;
    Caption = 'Invoice Freight PB';
    PageType = List;
    UsageCategory = ReportsAndAnalysis;
    SourceTable = "ORB FreightChargeDataTable";
    //Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Invoice; Rec.Invoice)
                {
                    Caption = 'Invoice';
                }
                field("Customer No"; REc."Customer No")
                {
                    Caption = 'Customer No';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    Caption = 'Customer Name';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }
                field("Order No"; Rec."Order No")
                {
                    Caption = 'Order No';
                }
                field(LocationCode; Rec.LocationCode)
                {
                    Caption = 'Location Code';
                }
                field("Shipping Agent"; Rec."Shipping Agent")
                {
                    Caption = 'Shipping Agent';
                }
                field("Shipping Agent Service"; Rec."Shipping Agent Service")
                {
                    Caption = 'Shipping Agent Service';
                }
                field(Package_Tracking_No_; Rec.Package_Tracking_No_)
                {
                    Caption = 'Package Tracking No';
                }
                field(Case_No_; Rec.Case_No_)
                {
                    Caption = 'Case No';
                }
                field(Invoiced_FRT_Charge; Rec.Invoiced_FRT_Charge)
                {
                    Caption = 'Invoiced FRT Charge';
                }
                field(LP_EasyPostFreightCost; Rec.LP_EasyPostFreightCost)
                {
                    Caption = 'License Plate Easy Post FRT Cost';
                }
                field(Sales_Order_Payment_Type; Rec.Sales_Order_Payment_Type)
                {
                    Caption = 'Sales Order Payment Type';
                }

                field(LicenseplatepaymentType; Rec.LicensepaymentType)
                {
                    Caption = 'Licenseplate Payment Type';
                }
                field(LicenseplateFreightOption; Rec.LicenseplateFreightOption)
                {
                    Caption = 'Licenseplate Freight Option';
                }
                field(Order_CreatedBy; Rec.Order_CreatedBy)
                {
                    Caption = 'Order CreatedBy';
                }
                field(LicensePlate_ShipmentDate; Rec.LicensePlate_ShipmentDate)
                {
                    Caption = 'LicensePlate Shipment Date';
                }
                field(Your_Reference; Rec.Your_Reference)
                {
                    Caption = 'Your Reference';
                }
                field(ORB_Magento_Order; Rec.ORB_Magento_Order)
                {
                    Caption = 'Magento Order';
                }
                field(Handling; Rec.Handling)
                {
                    Caption = 'Handling';
                }
                field(Createdate; Rec.CreatedDate)
                {
                    Caption = 'Created at';
                }
                field("No of License Plates"; Rec."No of License Plates")
                {
                    Caption = 'No of License Plates';
                }
                field("Mark up%"; Rec."Mark up%")
                {
                    Caption = 'Mark up%';
                }
                field("Markup Amount"; Rec."Markup Amount")
                {
                    Caption = 'Markup Amount';
                }


            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                end;
            }
        }
    }
}
