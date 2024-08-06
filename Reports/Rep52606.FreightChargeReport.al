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

            column(License_Plate_PaymentType; LiceplatePaymentTypeGvar)
            {

            }

            column(LicenseplateFreightOption; LicenseplateFreightOption)
            {

            }

            column(Location_Code; "Location Code")
            {

            }

            column(Order_CreatedBy; FreightOptionUserIDGvar)
            {

            }
            column(LicensePlate_ShipmentDate; LicenePlateShipmentDtTxGvar)
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
                LicenePlateShipmentDtTxGvar := '';
                FreightOptionUserIDGvar := '';
                SalesInvoiceLineRecLvar.Reset();
                SalesInvoiceLineRecLvar.SetCurrentKey(Type, "No.");
                SalesInvoiceLineRecLvar.SetRange("Document No.", "Sales Invoice Header"."No.");
                SalesInvoiceLineRecLvar.Setrange(Type, SalesInvoiceLineRecLvar.Type::Resource);
                SalesInvoiceLineRecLvar.SetFilter("No.", 'RES0000018');
                IF SalesInvoiceLineRecLvar.FINDSET() then begin
                    repeat
                        InvoicedFreightChargeGvar := InvoicedFreightChargeGvar + SalesInvoiceLineRecLvar.Amount;
                    until (SalesInvoiceLineRecLvar.next = 0);
                end;

                //LicensePlateDetails
                IWXLPHeaderRecLvar.Reset();
                IWXLPHeaderRecLvar.SetRange("Shipped Source No.", "Order No.");
                IF IWXLPHeaderRecLvar.FindSet() then begin
                    LicenePlateShipmentDtTxGvar := Format(IWXLPHeaderRecLvar."Shipment Date");
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
                    IF DSHIPShipmentOptionsRecLvar.FindFirst() then begin
                        LicenseplateFreightOption := Format(DSHIPShipmentOptionsRecLvar."Add Freight Line");
                        IF (LicenseplateFreightOption) = 'Manual' then
                            FreightOptionUserIDGvar := "Sales Invoice Header"."Sales Order Created By";
                    end;

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
        FreightOptionUserIDGvar: Text[100];
        LicenePlateShipmentDtTxGvar: Text[10];

}