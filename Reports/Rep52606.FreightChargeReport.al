report 52606 "ORB Freight Charge Report"
{
    Caption = 'Freight Charge Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = "FreightDet";

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "Posting Date";

            column(Invoice; "No.")
            {

            }
            column(Customer; "Sell-to Customer No.")
            {

            }
            column(Posting_Date; "Posting Date")
            {

            }
            column(Order_No; "Order No.")
            {

            }

            column(Shipping_Agent_Code; "Shipping Agent Code")
            {

            }
            column(Shipping_Agent_Service_Code_2; "Shipping Agent Service Code 2")
            {

            }

            column(Package_Tracking_No_; "Package Tracking No.")
            {

            }
            column(Case_No_; "Case No.")
            {

            }

            column(Invoiced_Freight_Resouce_Charge; InvoicedFreightChargeGvar)
            {

            }

            column(License_plate_EasyPostFreightCost; FreightCostGvar)
            {

            }

            column(Sales_Order_Payment_Type; "Sales Order Payment Type")
            {

            }

            column(LicensepaymentType; LiceplatePaymentTypeGvar)
            {

            }

            column(LicenseplateFreightOption; LicenseplateFreightOption)
            {

            }

            trigger OnPreDataItem()
            begin
                SetFilter("No.", 'PS*');
                SetCurrentKey("Posting Date");
            end;

            trigger OnAfterGetRecord()
            var
                SalesInvoiceLineRecLvar: Record "Sales Invoice Line";
                IWXLPHeaderRecLvar: Record "IWX LP Header";
                DSHIPLabelDataRecLvar: Record "DSHIP Label Data";
                DSHIPPackageOptionsRecLvar: Record "DSHIP Package Options";
                DSHIPShipmentOptionsRecLvar: Record "DSHIP Shipment Options";
            begin
                InvoicedFreightChargeGvar := 0;
                LicenPlateNoGVar := '';
                LiceplatePaymentTypeGvar := '';
                FreightCostGvar := 0;
                LicenseplateFreightOption := '';
                SalesInvoiceLineRecLvar.Reset();
                SalesInvoiceLineRecLvar.SetCurrentKey(Type, "No.");
                SalesInvoiceLineRecLvar.SetRange("Document No.", "Sales Invoice Header"."No.");
                SalesInvoiceLineRecLvar.Setrange(Type, SalesInvoiceLineRecLvar.Type::Resource);
                SalesInvoiceLineRecLvar.SetFilter("No.", 'RES0000018');
                IF SalesInvoiceLineRecLvar.FINDSET() then begin
                    repeat
                        InvoicedFreightChargeGvar := InvoicedFreightChargeGvar + SalesInvoiceLineRecLvar."Amount Including VAT";
                    until (SalesInvoiceLineRecLvar.next = 0);
                end;

                //LicensePlateDetails
                IWXLPHeaderRecLvar.Reset();
                IWXLPHeaderRecLvar.SetRange("Shipped Source No.", "Order No.");
                IF IWXLPHeaderRecLvar.FindSet() then begin
                    DSHIPLabelDataRecLvar.Reset();
                    DSHIPLabelDataRecLvar.SetRange("License Plate No.", IWXLPHeaderRecLvar."No.");
                    IF DSHIPLabelDataRecLvar.FindFirst() then
                        FreightCostGvar := DSHIPLabelDataRecLvar.Cost;
                    DSHIPPackageOptionsRecLvar.Reset();
                    DSHIPPackageOptionsRecLvar.SetRange("License Plate No.", IWXLPHeaderRecLvar."No.");
                    IF DSHIPPackageOptionsRecLvar.FindFirst() then
                        LiceplatePaymentTypeGvar := Format(DSHIPPackageOptionsRecLvar."Payment Type");
                    DSHIPShipmentOptionsRecLvar.Reset();
                    DSHIPShipmentOptionsRecLvar.SetRange("Order ID", IWXLPHeaderRecLvar."Package Order ID");
                    IF DSHIPShipmentOptionsRecLvar.FindFirst() then
                        LicenseplateFreightOption := Format(DSHIPShipmentOptionsRecLvar."Add Freight Line");

                end;
            end;

        }

    }
    rendering
    {
        layout(FreightDet)
        {
            Type = Excel;
            LayoutFile = 'FreightChargeReport.xlsx';
        }
    }

    var
        InvoicedFreightChargeGvar: Decimal;
        LicenPlateNoGVar: Code[20];
        LiceplatePaymentTypeGvar: Code[20];
        FreightCostGvar: Decimal;
        LicenseplateFreightOption: Text[20];

}