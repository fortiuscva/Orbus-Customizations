report 52611 "ORB  PB Freightreport"
{
    Caption = 'Freight Charge Report for PB';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "Posting Date", "Shipping Agent Code";

            trigger OnPreDataItem()
            begin
                SetFilter("No.", 'PS*');
                SetCurrentKey("Order No.");
                FreightChargedataTableRecLcl.DeleteAll();
            end;

            trigger OnAfterGetRecord()
            var
                SalesInvoiceLineRecLcl: Record "Sales Invoice Line";
                IWXLPHeaderRecLcl: Record "IWX LP Header";
                DSHIPLabelDataRecLcl: Record "DSHIP Label Data";
                DSHIPPackageOptionsRecLcl: Record "DSHIP Package Options";
                DSHIPShipmentOptionsRecLcl: Record "DSHIP Shipment Options";
                bcostFoundVarLcl: Boolean;
                LicensePlateNoVarLcl: Code[20];
                LicensePlatepkgNoVarLcl: Text[100];
                markupRatioVarLcl: Decimal;
            begin
                //check if the Licenseplate payment type matches the selected filter.
                clear(LicensePlateNoVarLcl);
                clear(LicensePlatepkgNoVarLcl);
                clear(LicenPlateNoGVar);
                clear(LiceplatePaymentTypeGvar);
                clear(LicenseplateFreightOption);
                clear(LicenePlateShipmentDtTxGvar);
                clear(FreightOptionUserIDGvar);
                clear(markupRatioVarLcl);
                bcostFoundVarLcl := false;
                FreightCostGvar := 0;
                HandlingChargedecimal := 0;
                DynamicShipFreightPriceRecLcl.reset;
                InvoicedFreightChargeGvar := 0;
                FreightDataRecord.Invoice := "Sales Invoice Header"."No.";
                FreightChargedataTableRecLcl.init;
                reccount += 1;
                FreightChargedataTableRecLcl.RowNo := reccount;
                FreightChargedataTableRecLcl.Invoice := "Sales Invoice Header"."No.";
                FreightChargedataTableRecLcl."Customer No" := "Sales Invoice Header"."Sell-to Customer No.";
                FreightChargedataTableRecLcl."Customer Name" := "Sales Invoice Header"."Sell-to Customer Name";
                FreightChargedataTableRecLcl."Order No" := "Sales Invoice Header"."Order No.";
                FreightChargedataTableRecLcl.LocationCode := "Sales Invoice Header"."Location Code";
                FreightChargedataTableRecLcl."Posting Date" := "Sales Invoice Header"."Posting Date";
                FreightChargedataTableRecLcl."Shipping Agent" := "Sales Invoice Header"."Shipping Agent Code";
                FreightChargedataTableRecLcl."Shipping Agent Service" := "Sales Invoice Header"."Shipping Agent Service Code 2";
                FreightChargedataTableRecLcl.Sales_Order_Payment_Type := format("Sales Invoice Header"."Sales Order Payment Type");
                FreightChargedataTableRecLcl.Case_No_ := "Sales Invoice Header"."Case No.";
                FreightChargedataTableRecLcl.Your_Reference := "Sales Invoice Header"."Your Reference";
                FreightChargedataTableRecLcl.ORB_Magento_Order := "Sales Invoice Header"."ORB Magento Order #";
                FreightChargedataTableRecLcl.Package_Tracking_No_ := "Sales Invoice Header"."Package Tracking No.";
                DynamicShipFreightPriceRecLcl.reset;
                DynamicShipFreightPriceRecLcl.SetRange("Shipping Agent Code", "Sales Invoice Header"."Shipping Agent Code");
                DynamicShipFreightPriceRecLcl.SetRange("Shipping Agent Service Code", "Sales Invoice Header"."Shipping Agent Service Code 2");
                if DynamicShipFreightPriceRecLcl.findfirst then markupRatioVarLcl := 1 + (DynamicShipFreightPriceRecLcl."Markup %" * 0.01);
                SalesInvoiceLineRecLcl.Reset();
                SalesInvoiceLineRecLcl.SetCurrentKey(Type, "No.");
                SalesInvoiceLineRecLcl.SetRange("Document No.", "Sales Invoice Header"."No.");
                SalesInvoiceLineRecLcl.Setrange(Type, SalesInvoiceLineRecLcl.Type::Resource);
                SalesInvoiceLineRecLcl.SetFilter("No.", 'RES0000018');
                IF SalesInvoiceLineRecLcl.FINDSET() then begin
                    repeat
                        InvoicedFreightChargeGvar := InvoicedFreightChargeGvar + SalesInvoiceLineRecLcl."Amount";
                    until (SalesInvoiceLineRecLcl.next = 0);
                    FreightChargedataTableRecLcl.Invoiced_FRT_Charge := InvoicedFreightChargeGvar;
                    //LicensePlateDetails
                    IWXLPHeaderRecLcl.Reset();
                    if "Sales Invoice Header"."Order No." <> '' then begin
                        IWXLPHeaderRecLcl.SetRange("Shipped Source No.", "Sales Invoice Header"."Order No.");
                        IF IWXLPHeaderRecLcl.FindSet() then begin
                            repeat
                                LicenePlateShipmentDtTxGvar := Format(IWXLPHeaderRecLcl."Shipment Date");
                                DSHIPLabelDataRecLcl.Reset();
                                DSHIPLabelDataRecLcl.SetRange("License Plate No.", IWXLPHeaderRecLcl."No.");
                                DSHIPLabelDataRecLcl.SetFilter(Cost, '>%1', 0);
                                IF DSHIPLabelDataRecLcl.FindFirst() then begin
                                    FreightCostGvar := DSHIPLabelDataRecLcl.Cost;
                                    FreightChargedataTableRecLcl.Handling := DSHIPLabelDataRecLcl."ORB Handling";
                                end;
                                LicensePlateNoVarLcl := IWXLPHeaderRecLcl."No.";
                                LicensePlatepkgNoVarLcl := IWXLPHeaderRecLcl."Package Order ID";
                                if FreightCostGvar > 0 then bcostFoundVarLcl := true;
                                if bcostFoundVarLcl then begin
                                    FreightChargedataTableRecLcl.LP_EasyPostFreightCost := FreightCostGvar;
                                end;
                            until (IWXLPHeaderRecLcl.next = 0) or (bcostFoundVarLcl = true);
                            DSHIPPackageOptionsRecLcl.Reset();
                            DSHIPPackageOptionsRecLcl.SetRange("License Plate No.", LicensePlateNoVarLcl);
                            IF DSHIPPackageOptionsRecLcl.FindFirst() then LiceplatePaymentTypeGvar := Format(DSHIPPackageOptionsRecLcl."Payment Type");
                            FreightChargedataTableRecLcl.LicensepaymentType := LiceplatePaymentTypeGvar;
                            DSHIPShipmentOptionsRecLcl.Reset();
                            DSHIPShipmentOptionsRecLcl.SetRange("Order ID", LicensePlatepkgNoVarLcl);
                            IF DSHIPShipmentOptionsRecLcl.FindFirst() then begin
                                LicenseplateFreightOption := Format(DSHIPShipmentOptionsRecLcl."Add Freight Line");
                                IF (LicenseplateFreightOption) = 'Manual' then FreightOptionUserIDGvar := "Sales Invoice Header"."Sales Order Created By";
                                FreightChargedataTableRecLcl.LicenseplateFreightOption := LicenseplateFreightOption;
                                FreightChargedataTableRecLcl.Order_CreatedBy := FreightOptionUserIDGvar;
                            end;
                            If markupRatioVarLcl > 0 then
                                if InvoicedFreightChargeGvar > 0 then begin
                                    HandlingChargedecimal := (InvoicedFreightChargeGvar - (markupRatioVarLcl * FreightCostGvar)) / markupRatioVarLcl;
                                    if HandlingChargedecimal < 0 then HandlingChargedecimal := 0;
                                    FreightChargedataTableRecLcl.Handling := HandlingChargedecimal;
                                end
                                else begin //order is shipped but no shipped source no,check if LP exists for the source no
                                    if ("Sales Invoice Header"."Package Tracking No." <> '') then begin
                                        IWXLPHeaderRecLcl.Reset();
                                        IWXLPHeaderRecLcl.SetRange("Package Tracking No.", "Sales Invoice Header"."Package Tracking No.");
                                        IF IWXLPHeaderRecLcl.FindSet() then begin
                                            repeat
                                                LicenePlateShipmentDtTxGvar := Format(IWXLPHeaderRecLcl."Shipment Date");
                                                DSHIPLabelDataRecLcl.Reset();
                                                DSHIPLabelDataRecLcl.SetRange("License Plate No.", IWXLPHeaderRecLcl."No.");
                                                DSHIPLabelDataRecLcl.SetFilter(Cost, '>%1', 0);
                                                IF DSHIPLabelDataRecLcl.FindFirst() then FreightCostGvar := DSHIPLabelDataRecLcl.Cost;
                                                LicensePlateNoVarLcl := IWXLPHeaderRecLcl."No.";
                                                LicensePlatepkgNoVarLcl := IWXLPHeaderRecLcl."Package Order ID";
                                                if FreightCostGvar > 0 then bcostFoundVarLcl := true;
                                                if bcostFoundVarLcl then begin
                                                    FreightChargedataTableRecLcl.LP_EasyPostFreightCost := FreightCostGvar;
                                                    FreightChargedataTableRecLcl.Handling := DSHIPLabelDataRecLcl."ORB Handling";
                                                end;
                                            until (IWXLPHeaderRecLcl.next = 0) or (bcostFoundVarLcl = true);
                                            DSHIPPackageOptionsRecLcl.Reset();
                                            DSHIPPackageOptionsRecLcl.SetRange("License Plate No.", LicensePlateNoVarLcl);
                                            IF DSHIPPackageOptionsRecLcl.FindFirst() then LiceplatePaymentTypeGvar := Format(DSHIPPackageOptionsRecLcl."Payment Type");
                                            FreightChargedataTableRecLcl.LicensepaymentType := LiceplatePaymentTypeGvar;
                                            DSHIPShipmentOptionsRecLcl.Reset();
                                            DSHIPShipmentOptionsRecLcl.SetRange("Order ID", LicensePlatepkgNoVarLcl);
                                            If markupRatioVarLcl > 0 then
                                                if InvoicedFreightChargeGvar > 0 then begin
                                                    HandlingChargedecimal := (InvoicedFreightChargeGvar - (markupRatioVarLcl * FreightCostGvar)) / markupRatioVarLcl;
                                                    if HandlingChargedecimal < 0 then HandlingChargedecimal := 0;
                                                    FreightChargedataTableRecLcl.Handling := HandlingChargedecimal;
                                                end;
                                            IF DSHIPShipmentOptionsRecLcl.FindFirst() then begin
                                                LicenseplateFreightOption := Format(DSHIPShipmentOptionsRecLcl."Add Freight Line");
                                                IF (LicenseplateFreightOption) = 'Manual' then FreightOptionUserIDGvar := "Sales Invoice Header"."Sales Order Created By";
                                                FreightChargedataTableRecLcl.LicenseplateFreightOption := LicenseplateFreightOption;
                                                FreightChargedataTableRecLcl.Order_CreatedBy := FreightOptionUserIDGvar;
                                            end;
                                        end
                                    end;
                                end;
                        end;
                    end;
                    if ("Sales Invoice Header"."Order No." = prevOrderNoGbl) and ((prevEasyCostGbl = FreightCostGvar) or (prevEasyCostGbl = 0)) and ("Sales Invoice Header"."Order No." <> '') then begin
                        FreightCostGvar := 0;
                    end;
                    prevOrderNoGbl := "Order No.";
                    prevEasyCostGbl := FreightCostGvar;
                    FreightChargedataTableRecLcl.Createddate := CurrentDateTime;
                    FreightChargedataTableRecLcl.insert;
                end;
            end;
        }
    }
    trigger OnPostReport()
    var
        myInt: Integer;
    begin
        if GuiAllowed then Message('Completed ' + format(currentdatetime));
    end;

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
        FreightDataRecord: Record FreightChargedataTable;
        DynamicShipFreightPriceRecLcl: Record "DSHIP Freight Price";
        HandlingChargedecimal: Decimal;
        reccount: Integer;
        FreightChargedataTableRecLcl: Record FreightChargeDataTable;
}
