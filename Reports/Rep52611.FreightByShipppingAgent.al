report 52611 "ORB Freight By ShipppingAgent"
{
    Caption = 'Freight Charge Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = "FreightDet";

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {

            RequestFilterFields = "Posting Date", "Shipping Agent Code";


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
            column(Location_Code; "Location Code")
            {
            }
            column(Order_CreatedBy; FreightOptionUserIDGvar)
            {
            }
            column(LicensePlate_ShipmentDate; LicenePlateShipmentDtTxGvar)
            {
            }

            column(Your_Reference; "Your Reference")
            {

            }
            column(ORB_Magento_Order__; "ORB Magento Order #")
            {

            }

            trigger OnPreDataItem()
            begin
                SetFilter("No.", 'PS*');
                SetCurrentKey("Order No.");
            end;

            trigger OnAfterGetRecord()
            var
                SalesInvoiceLineRecLvar: Record "Sales Invoice Line";
                IWXLPHeaderRecLvar: Record "IWX LP Header";
                DSHIPLabelDataRecLvar: Record "DSHIP Label Data";
                DSHIPPackageOptionsRecLvar: Record "DSHIP Package Options";
                DSHIPShipmentOptionsRecLvar: Record "DSHIP Shipment Options";
                bcostFound: Boolean;
                LicensePlateNoLcl: Code[20];
                LicensePlatepkgNo: Text[100];
            begin
                //check if the Licenseplate payment type matches the selected filter.
                clear(LicensePlateNoLcl);
                clear(LicensePlatepkgNo);
                clear(LicenPlateNoGVar);
                clear(LiceplatePaymentTypeGvar);
                clear(LicenseplateFreightOption);
                clear(LicenePlateShipmentDtTxGvar);
                clear(FreightOptionUserIDGvar);
                bcostFound := false;
                FreightCostGvar := 0;
                InvoicedFreightChargeGvar := 0;
                SalesInvoiceLineRecLvar.Reset();
                SalesInvoiceLineRecLvar.SetCurrentKey(Type, "No.");
                SalesInvoiceLineRecLvar.SetRange("Document No.", "Sales Invoice Header"."No.");
                SalesInvoiceLineRecLvar.Setrange(Type, SalesInvoiceLineRecLvar.Type::Resource);
                SalesInvoiceLineRecLvar.SetFilter("No.", 'RES0000018');
                IF SalesInvoiceLineRecLvar.FINDSET() then begin
                    repeat
                        InvoicedFreightChargeGvar := InvoicedFreightChargeGvar + SalesInvoiceLineRecLvar."Amount";
                    until (SalesInvoiceLineRecLvar.next = 0);
                end;

                //LicensePlateDetails
                IWXLPHeaderRecLvar.Reset();
                if "Sales Invoice Header"."Order No." <> '' then begin
                    IWXLPHeaderRecLvar.SetRange("Shipped Source No.", "Sales Invoice Header"."Order No.");
                    IF IWXLPHeaderRecLvar.FindSet() then begin
                        repeat
                            LicenePlateShipmentDtTxGvar := Format(IWXLPHeaderRecLvar."Shipment Date");
                            DSHIPLabelDataRecLvar.Reset();
                            DSHIPLabelDataRecLvar.SetRange("License Plate No.", IWXLPHeaderRecLvar."No.");
                            DSHIPLabelDataRecLvar.SetFilter(Cost, '>%1', 0);
                            IF DSHIPLabelDataRecLvar.FindFirst() then
                                FreightCostGvar := DSHIPLabelDataRecLvar.Cost;
                            LicensePlateNoLcl := IWXLPHeaderRecLvar."No.";
                            LicensePlatepkgNo := IWXLPHeaderRecLvar."Package Order ID";
                            if FreightCostGvar > 0 then
                                bcostFound := true;
                        until (IWXLPHeaderRecLvar.next = 0) or (bcostFound = true);
                        DSHIPPackageOptionsRecLvar.Reset();
                        DSHIPPackageOptionsRecLvar.SetRange("License Plate No.", LicensePlateNoLcl);
                        IF DSHIPPackageOptionsRecLvar.FindFirst() then
                            LiceplatePaymentTypeGvar := Format(DSHIPPackageOptionsRecLvar."Payment Type");
                        DSHIPShipmentOptionsRecLvar.Reset();
                        DSHIPShipmentOptionsRecLvar.SetRange("Order ID", LicensePlatepkgNo);
                        IF DSHIPShipmentOptionsRecLvar.FindFirst() then begin
                            LicenseplateFreightOption := Format(DSHIPShipmentOptionsRecLvar."Add Freight Line");
                            IF (LicenseplateFreightOption) = 'Manual' then FreightOptionUserIDGvar := "Sales Invoice Header"."Sales Order Created By";
                        end
                    end else begin //order is shipped but no shipped source no,check if LP exists for the source no
                        if ("Sales Invoice Header"."Package Tracking No." <> '') then begin
                            IWXLPHeaderRecLvar.Reset();
                            IWXLPHeaderRecLvar.SetRange("Package Tracking No.", "Sales Invoice Header"."Package Tracking No.");
                            IF IWXLPHeaderRecLvar.FindSet() then begin
                                repeat
                                    LicenePlateShipmentDtTxGvar := Format(IWXLPHeaderRecLvar."Shipment Date");
                                    DSHIPLabelDataRecLvar.Reset();
                                    DSHIPLabelDataRecLvar.SetRange("License Plate No.", IWXLPHeaderRecLvar."No.");
                                    DSHIPLabelDataRecLvar.SetFilter(Cost, '>%1', 0);
                                    IF DSHIPLabelDataRecLvar.FindFirst() then
                                        FreightCostGvar := DSHIPLabelDataRecLvar.Cost;
                                    LicensePlateNoLcl := IWXLPHeaderRecLvar."No.";
                                    LicensePlatepkgNo := IWXLPHeaderRecLvar."Package Order ID";
                                    if FreightCostGvar > 0 then
                                        bcostFound := true;
                                until (IWXLPHeaderRecLvar.next = 0) or (bcostFound = true);
                                DSHIPPackageOptionsRecLvar.Reset();
                                DSHIPPackageOptionsRecLvar.SetRange("License Plate No.", LicensePlateNoLcl);
                                IF DSHIPPackageOptionsRecLvar.FindFirst() then
                                    LiceplatePaymentTypeGvar := Format(DSHIPPackageOptionsRecLvar."Payment Type");
                                DSHIPShipmentOptionsRecLvar.Reset();
                                DSHIPShipmentOptionsRecLvar.SetRange("Order ID", LicensePlatepkgNo);
                                IF DSHIPShipmentOptionsRecLvar.FindFirst() then begin
                                    LicenseplateFreightOption := Format(DSHIPShipmentOptionsRecLvar."Add Freight Line");
                                    IF (LicenseplateFreightOption) = 'Manual' then FreightOptionUserIDGvar := "Sales Invoice Header"."Sales Order Created By";
                                end;
                            end
                        end;
                        /* if ("Sales Invoice Header"."Order No." = prevOrderNoGbl) and (prevEasyCostGbl = FreightCostGvar) then begin
                            FreightCostGvar := 0;
                        end; */
                    end;
                end;
                if ("Sales Invoice Header"."Order No." = prevOrderNoGbl) and ((prevEasyCostGbl = FreightCostGvar) or (prevEasyCostGbl = 0)) and ("Sales Invoice Header"."Order No." <> '') then begin
                    FreightCostGvar := 0;
                end;
                prevOrderNoGbl := "Order No.";
                prevEasyCostGbl := FreightCostGvar;
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
        prevOrderNoGbl: Code[20];
        prevEasyCostGbl: Decimal;

}