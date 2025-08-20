report 52619 "ORB Posted Invt. Pick Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/Layouts/OrbusPostedInvtPick.rdl';
    Caption = 'Posted Invt. Pick';


    dataset
    {
        dataitem("Warehouse Activity Header"; "Posted Invt. Pick Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", "No. Printed";
            column(No_WhseActivHeader; "No.")
            {
            }
            column(Location_Code; "Location Code")
            {
            }
            column(Assigned_User_ID; "Assigned User ID")
            {
            }
            column(PickNo; "No.")
            {
            }
            column(SourceDocNo; SourceDocNo)
            {
            }
            column(SalespersonCode; SalespersonCode)
            {
            }
            column(PaymentTermsCode; PaymentTermsCode)
            {
            }
            column(ShipmentMethodCOde; ShipmentMethodCOde)
            {
            }
            column(ExternalDocNo; ExternalDocNo)
            {
            }
            column(CustomerNo; CustomerNo)
            {
            }
            column(EncodedSourceDocNo; EncodedSourceDocNo)
            {
            }
            column(EncodedWareShipmentHeaderNo; EncodedWareShipmentHeaderNo)
            {
            }
            column(CurrentDateandTime; CurrentDateandTime)
            {
            }
            column(OrderDate; OrderDate)
            {
            }
            column(RequestedDeliveryDate; RequestedDeliveryDate)
            {
            }
            column(ShipmentDate; ShipmentDate)
            {
            }
            column(DShipPackagePaymentType; DShipPackagePaymentType)
            {
            }
            column(DShipPackagePaymentAccountNo; DShipPackagePaymentAccountNo)
            {
            }
            column(ShipFromCompanyName; ShipFromCompanyName)
            {
            }
            column(ShipFromContact; ShipFromContact)
            {
            }
            column(ShipFromAddress1; ShipFromAddress1)
            {
            }
            column(ShipFromAddress2; ShipFromAddress2)
            {
            }
            column(ShipFromCity; ShipFromCity)
            {
            }
            column(ShipFromState; ShipFromState)
            {
            }
            column(ShipFromZipCode; ShipFromZipCode)
            {
            }
            column(ShipToCustomerName; ShipToCustomerName)
            {
            }
            column(ShipToContact; ShipToContact)
            {
            }
            column(ShipToAddress1; ShipToAddress1)
            {
            }
            column(ShipToAddress2; ShipToAddress2)
            {
            }
            column(ShipToCity; ShipToCity)
            {
            }
            column(ShipToState; ShipToState)
            {
            }
            column(ShipToZipCode; ShipToZipCode)
            {
            }
            column(ShipVia; ShipVia)
            {
            }
            column(EnteredBy; EnteredBy)
            {
            }
            column(SalesHeaderWorkDescription; SalesHeaderWorkDescription)
            {
            }
            column(WarehouseShipmentNoBarcode; WarehouseShipmentNoBarcode)
            {
            }
            column(WarehouseShipmentNoText; WarehouseShipmentNoText)
            {
            }
            column(Printed_By; Printed_By)
            {
            }
            column(AssembleToOrderNo; AssembleToOrderNo)
            {
            }
            column(AssembleToOrderDescription; AssembleToOrderDescription)
            {
            }
            column(AssembleToOrderQty; AssembleToOrderQty)
            {
            }

            column(CreatedBy; GetUserName(SystemCreatedBy))
            {

            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = sorting(Number) where(Number = const(1));
                column(CompanyName; COMPANYPROPERTY.DisplayName())
                {
                }
                column(TodayFormatted; Format(Today, 0, 4))
                {
                }
                column("Time"; Time)
                {
                }
                column(PickFilter; PickFilter)
                {
                }
                column(DirectedPutAwayAndPick; Location."Directed Put-away and Pick")
                {
                }
                column(BinMandatory; Location."Bin Mandatory")
                {
                }
                column(InvtPick; InvtPick)
                {
                }
                column(ShowLotSN; ShowLotSN)
                {
                }
                column(SumUpLines; SumUpLines)
                {
                }
                column(No_WhseActivHeaderCaption; "Warehouse Activity Header".FieldCaption("No."))
                {
                }
                column(WhseActivHeaderCaption; "Warehouse Activity Header".TableCaption + ': ' + PickFilter)
                {
                }
                column(LoctnCode_WhseActivHeader; "Warehouse Activity Header"."Location Code")
                {
                }
                /*
                column(SortingMtd_WhseActivHeader; "Warehouse Activity Header"."Sorting Method")
                {
                }
                */
                column(SortingMtd_WhseActivHeader; '')
                {
                }
                column(AssgUserID_WhseActivHeader; "Warehouse Activity Header"."Assigned User ID")
                {
                }
                column(SourcDocument_WhseActLine; "Warehouse Activity Line"."Source Document")
                {
                }
                column(LoctnCode_WhseActivHeaderCaption; "Warehouse Activity Header".FieldCaption("Location Code"))
                {
                }
                /*
                column(SortingMtd_WhseActivHeaderCaption; "Warehouse Activity Header".FieldCaption("Sorting Method"))
                {
                }
                */
                column(SortingMtd_WhseActivHeaderCaption; '')
                {
                }
                column(AssgUserID_WhseActivHeaderCaption; "Warehouse Activity Header".FieldCaption("Assigned User ID"))
                {
                }
                column(SourcDocument_WhseActLineCaption; "Warehouse Activity Line".FieldCaption("Source Document"))
                {
                }
                column(SourceNo_WhseActLineCaption; WhseActLine.FieldCaption("Source No."))
                {
                }
                column(ShelfNo_WhseActLineCaption; WhseActLine.FieldCaption("Shelf No."))
                {
                }
                column(VariantCode_WhseActLineCaption; WhseActLine.FieldCaption("Variant Code"))
                {
                }
                column(Description_WhseActLineCaption; WhseActLine.FieldCaption(Description))
                {
                }
                column(ItemNo_WhseActLineCaption; WhseActLine.FieldCaption("Item No."))
                {
                }
                column(UOMCode_WhseActLineCaption; WhseActLine.FieldCaption("Unit of Measure Code"))
                {
                }
                column(QtytoHandle_WhseActLineCaption; WhseActLine.FieldCaption(Quantity))
                {
                }
                column(QtyBase_WhseActLineCaption; WhseActLine.FieldCaption("Qty. (Base)"))
                {
                }
                column(DestinatnType_WhseActLineCaption; WhseActLine.FieldCaption("Destination Type"))
                {
                }
                column(DestinationNo_WhseActLineCaption; WhseActLine.FieldCaption("Destination No."))
                {
                }
                column(ZoneCode_WhseActLineCaption; WhseActLine.FieldCaption("Zone Code"))
                {
                }
                column(BinCode_WhseActLineCaption; WhseActLine.FieldCaption("Bin Code"))
                {
                }
                column(ActionType_WhseActLineCaption; WhseActLine.FieldCaption("Action Type"))
                {
                }
                column(CurrReportPageNoCaption; CurrReportPageNoCaptionLbl)
                {
                }
                column(PickingListCaption; PickingListCaptionLbl)
                {
                }
                column(WhseActLineDueDateCaption; WhseActLineDueDateCaptionLbl)
                {
                }
                column(QtyHandledCaption; QtyHandledCaptionLbl)
                {
                }
                column(ORBCustomerSupportVarGbL; CustomerSupportVarGbl)
                {

                }
                column(ORBMustHaveDateVarGbl; MustHaveDateVarGbl)
                {

                }
                dataitem("Warehouse Activity Line"; "Posted Invt. Pick Line")
                {
                    DataItemLink = "No." = field("No.");
                    DataItemLinkReference = "Warehouse Activity Header";
                    DataItemTableView = sorting("No.", "Sorting Sequence No.");

                    trigger OnAfterGetRecord()
                    begin
                        /*
                        if SumUpLines and
                           ("Warehouse Activity Header"."Sorting Method" <>
                            "Warehouse Activity Header"."Sorting Method"::Document)
                        then begin
                            if TempWhseActivLine."No." = '' then begin
                                TempWhseActivLine := "Warehouse Activity Line";
                                TempWhseActivLine.Insert();
                                Mark(true);
                            end else begin
                                TempWhseActivLine.SetSumLinesFilters("Warehouse Activity Line");
                                if "Warehouse Activity Header"."Sorting Method" =
                                   "Warehouse Activity Header"."Sorting Method"::"Ship-To"
                                then begin
                                    TempWhseActivLine.SetRange("Destination Type", "Destination Type");
                                    TempWhseActivLine.SetRange("Destination No.", "Destination No.")
                                end;
                                if TempWhseActivLine.FindFirst() then begin
                                    TempWhseActivLine."Qty. (Base)" := TempWhseActivLine."Qty. (Base)" + "Qty. (Base)";
                                    TempWhseActivLine."Qty. to Handle" := TempWhseActivLine."Qty. to Handle" + "Qty. to Handle";
                                    TempWhseActivLine."Source No." := '';
                                    if "Warehouse Activity Header"."Sorting Method" <>
                                       "Warehouse Activity Header"."Sorting Method"::"Ship-To"
                                    then begin
                                        TempWhseActivLine."Destination Type" := TempWhseActivLine."Destination Type"::" ";
                                        TempWhseActivLine."Destination No." := '';
                                    end;
                                    TempWhseActivLine.Modify();
                                end else begin
                                    TempWhseActivLine := "Warehouse Activity Line";
                                    TempWhseActivLine.Insert();
                                    Mark(true);
                                end;
                            end;
                        end else
                            Mark(true);
                        */
                        Mark(true);
                    end;

                    trigger OnPostDataItem()
                    begin
                        MarkedOnly(true);
                    end;

                    trigger OnPreDataItem()
                    begin
                        //TempWhseActivLine.SetRange("Activity Type", "Warehouse Activity Header".Type);
                        TempWhseActivLine.SetRange("No.", "Warehouse Activity Header"."No.");
                        TempWhseActivLine.DeleteAll();
                        // if BreakbulkFilter then
                        //     TempWhseActivLine.SetRange("Original Breakbulk", false);
                        Clear(TempWhseActivLine);
                    end;
                }
                dataitem(Line; "Sales Line")
                {
                    DataItemLinkReference = "Warehouse Activity Line";
                    DataItemLink = "Document No." = field("Source No.");

                    column(No_; "No.")
                    {
                    }
                    column(Description; Description)
                    {
                    }
                    column(Quantity; Quantity)
                    {
                    }
                    column(SalesLineComments; SalesLineComments)
                    {
                    }
                    trigger OnAfterGetRecord()
                    var
                        Item: Record Item;
                        SalesCommentLine: Record "Sales Comment Line";
                        LineBreak: Text;
                        TypeHelper: Codeunit "Type Helper";
                    begin
                        SalesLineComments := '';
                        LineBreak := TypeHelper.CRLFSeparator();
                        Item.Reset();
                        Item.SetRange("No.", Line."No.");
                        if Item.FindFirst() then begin
                            if (Item.Type = Item.Type::Inventory) or (Item.Type = Item.Type::Service) then
                                CurrReport.Skip()
                            else begin
                                SalesCommentLine.Reset();
                                SalesCommentLine.SetRange("Document Type", SalesCommentLine."Document Type"::Order);
                                SalesCommentLine.SetRange("No.", Line."Document No.");
                                SalesCommentLine.SetRange("Document Line No.", Line."Line No.");
                                if SalesCommentLine.FindSet() then
                                    repeat
                                        SalesLineComments := SalesLineComments + 'Comment: ' + SalesCommentLine.Comment + LineBreak;
                                    until SalesCommentLine.Next() = 0
                                else
                                    SalesLineComments := '';
                                if SalesLineComments <> '' then SalesLineComments := DelChr(SalesLineComments, '>', LineBreak)
                            end;
                        end;
                    end;
                }
                dataitem(WhseActLine; "Posted Invt. Pick Line")
                {
                    DataItemLink = "No." = field("No.");
                    DataItemLinkReference = "Warehouse Activity Header";
                    DataItemTableView = sorting("No.", "Sorting Sequence No.");
                    column(SourceNo_WhseActLine; "Source No.")
                    {
                    }
                    column(FormatSourcDocument_WhseActLine; Format("Source Document"))
                    {
                    }
                    column(ShelfNo_WhseActLine; "Shelf No.")
                    {
                    }
                    column(ItemNo_WhseActLine; "Item No.")
                    {
                    }
                    column(Description_WhseActLine; Description)
                    {
                    }
                    column(VariantCode_WhseActLine; "Variant Code")
                    {
                    }
                    column(UOMCode_WhseActLine; "Unit of Measure Code")
                    {
                    }
                    column(DueDate_WhseActLine; Format("Due Date"))
                    {
                    }
                    column(QtytoHandle_WhseActLine; Quantity)
                    {
                    }
                    column(QtyBase_WhseActLine; "Qty. (Base)")
                    {
                    }
                    column(DestinatnType_WhseActLine; "Destination Type")
                    {
                    }
                    column(DestinationNo_WhseActLine; "Destination No.")
                    {
                    }
                    column(ZoneCode_WhseActLine; "Zone Code")
                    {
                    }
                    column(BinCode_WhseActLine; "Bin Code")
                    {
                    }
                    column(ActionType_WhseActLine; "Action Type")
                    {
                    }
                    column(LotNo_WhseActLine; "Lot No.")
                    {
                    }
                    column(SerialNo_WhseActLine; "Serial No.")
                    {
                    }
                    column(LotNo_WhseActLineCaption; FieldCaption("Lot No."))
                    {
                    }
                    column(SerialNo_WhseActLineCaption; FieldCaption("Serial No."))
                    {
                    }
                    column(LineNo_WhseActLine; "Line No.")
                    {
                    }
                    /*
                    column(BinRanking_WhseActLine; '')
                    {
                    }
                    */
                    column(EmptyStringCaption; EmptyStringCaptionLbl)
                    {
                    }
                    column(Qty__Handled; Quantity)
                    {
                    }
                    column(Qty__Outstanding; Quantity)
                    {
                    }
                    column(Unit_of_Measure_Code; "Unit of Measure Code")
                    {
                    }
                    column(EncodedBarcodeLineItemNo; EncodedBarcodeLineItemNo)
                    {
                    }
                    column(NonInventoryItemNo; NonInventoryItemNo)
                    {
                    }
                    column(NonInventoryItemDescription; NonInventoryItemDescription)
                    {
                    }
                    column(NonInventoryItemQuantity; NonInventoryItemQuantity)
                    {
                    }
                    dataitem(WhseActLine2; "Posted Invt. Pick Line")
                    {
                        DataItemLink = "No." = field("No."), "Bin Code" = field("Bin Code"), "Item No." = field("Item No."), "Action Type" = field("Action Type"), "Variant Code" = field("Variant Code"), "Unit of Measure Code" = field("Unit of Measure Code"), "Due Date" = field("Due Date");
                        DataItemLinkReference = WhseActLine;
                        DataItemTableView = sorting("No.", "Line No.");
                        column(LotNo_WhseActLine2; "Lot No.")
                        {
                        }
                        column(SerialNo_WhseActLine2; "Serial No.")
                        {
                        }
                        column(QtyBase_WhseActLine2; "Qty. (Base)")
                        {
                        }
                        column(QtytoHandle_WhseActLine2; Quantity)
                        {
                        }
                        column(LineNo_WhseActLine2; "Line No.")
                        {
                        }
                    }

                    trigger OnAfterGetRecord()
                    begin
                        WarehouseShipmentNoText := WhseActLine."Whse. Activity No.";
                        GetBarcodesForLineNo();
                        if SumUpLines then begin
                            TempWhseActivLine.Get("No.", "Line No.");
                            "Qty. (Base)" := TempWhseActivLine."Qty. (Base)";
                            Quantity := TempWhseActivLine.Quantity;
                        end;
                    end;

                    trigger OnPreDataItem()
                    begin
                        Copy("Warehouse Activity Line");
                        Counter := Count;
                        if Counter = 0 then
                            CurrReport.Break();

                        // if BreakbulkFilter then
                        //     SetRange("Original Breakbulk", false);
                    end;
                }
            }

            trigger OnAfterGetRecord()
            var
                SalesHeader: Record "Sales Header";
                WarehouseActivityLine: Record "Posted Invt. Pick Line";
                DShipPackageOptions: Record "DSHIP Package Options";
                DShipShipmentOptions: Record "DSHIP Shipment Options";
                User: Record User;
                SalesHeaderRecLcl: Record "Sales Header";
            begin
                /*
                this.GetLocation("Location Code");
                InvtPick := Type = Type::"Invt. Pick";
                if InvtPick then
                    BreakbulkFilter := false
                else
                    BreakbulkFilter := "Breakbulk Filter";
                */
                WarehouseActivityLine.Reset();
                WarehouseActivityLine.SetRange("No.", "Warehouse Activity Header"."No.");
                if WarehouseActivityLine.FindFirst() then SourceDocNo := WarehouseActivityLine."Source No.";
                SalesHeader.Reset();
                SalesHeader.SetRange("No.", SourceDocNo);
                if SalesHeader.FindFirst() then begin
                    CustomerNo := SalesHeader."Sell-to Customer No.";
                    PaymentTermsCode := SalesHeader."Payment Terms Code";
                    SalespersonCode := SalesHeader."Salesperson Code";
                    ExternalDocNo := SalesHeader."External Document No.";
                    ShipmentMethodCOde := SalesHeader."Shipment Method Code";
                    OrderDate := Format(SalesHeader."Order Date", 0, '<Month>/<Day>/<Year4>');
                    RequestedDeliveryDate := Format(SalesHeader."Requested Delivery Date", 0, '<Month>/<Day>/<Year4>');
                    ShipmentDate := Format(SalesHeader."Shipment Date", 0, '<Month>/<Day>/<Year4>');
                    ShipToCustomerName := SalesHeader."Ship-to Name";
                    ShipToContact := SalesHeader."Ship-to Contact";
                    ShipToAddress1 := SalesHeader."Ship-to Address";
                    ShipToAddress2 := SalesHeader."Ship-to Address 2";
                    ShipToCity := SalesHeader."Ship-to City";
                    ShipToState := SalesHeader."Ship-to County";
                    ShipToZipCode := SalesHeader."Ship-to Post Code";
                    ShipVia := SalesHeader."Shipping Agent Code" + '- ' + SalesHeader."Shipping Agent Service Code";
                    SalesHeaderWorkDescription := SalesHeader.GetWorkDescription();
                    User.Reset();
                    User.SetRange("User Security ID", SalesHeader.SystemCreatedBy);
                    if User.FindFirst() then EnteredBy := User."User Name";
                    DShipPackageOptions.Reset();
                    DShipPackageOptions.SetRange("Document No.", SalesHeader."No.");
                    if DShipPackageOptions.FindFirst() then begin
                        DShipPackagePaymentType := Format(DShipPackageOptions."Payment Type", 0, '<Text>');
                        DShipPackagePaymentAccountNo := DShipPackageOptions."Payment Account No.";
                    end;
                    DShipShipmentOptions.Reset();
                    DShipShipmentOptions.SetRange("Document No.", SalesHeader."No.");
                    if DShipShipmentOptions.FindFirst() then begin
                        ShipFromCompanyName := DShipShipmentOptions.Company;
                        ShipFromCompanyName := DShipShipmentOptions.Name;
                        ShipFromAddress1 := DShipShipmentOptions.Address;
                        ShipFromAddress2 := DShipShipmentOptions."Address 2";
                        ShipFromCity := DShipShipmentOptions.City;
                        ShipFromState := DShipShipmentOptions.County;
                        ShipFromZipCode := DShipShipmentOptions."Post Code";
                        ShipFromCountryCode := DShipShipmentOptions."Country/Region Code";
                    end;
                end;
                GetBarcodes();
                GetCurrentDateandTime();
                GetAssemblyItems();

                if not IsReportInPreviewMode() then
                    CODEUNIT.Run(CODEUNIT::"Whse.-Printed", "Warehouse Activity Header");

                SalesHeaderRecLcl.reset;
                Clear(CustomerSupportVarGbl);
                Clear(MustHaveDateVarGbl);
                SalesHeaderRecLcl.reset;
                SalesHeaderRecLcl.SetFilter("No.", "Warehouse Activity Header"."Source No.");
                SalesHeaderRecLcl.SetRange("Document Type", SalesHeaderRecLcl."Document Type"::Order);
                If SalesHeaderRecLcl.FindFirst() then begin
                    CustomerSupportVarGbl := SalesHeaderRecLcl."ORB Customer Support";
                    MustHaveDateVarGbl := SalesHeaderRecLcl."In-Hands Date";
                end;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(Breakbulk; BreakbulkFilter)
                    {
                        ApplicationArea = Warehouse;
                        Caption = 'Set Breakbulk Filter';
                        Editable = BreakbulkEditable;
                        ToolTip = 'Specifies if you do not want to view the intermediate lines that are created when the unit of measure is changed in pick instructions.';
                    }
                    field(SumUpLines; SumUpLines)
                    {
                        ApplicationArea = Warehouse;
                        Caption = 'Sum up Lines';
                        Editable = SumUpLinesEditable;
                        ToolTip = 'Specifies if you want the lines to be summed up for each item, such as several pick lines that originate from different source documents that concern the same item and bins.';
                    }
                    field(LotSerialNo; ShowLotSN)
                    {
                        ApplicationArea = Warehouse;
                        Caption = 'Show Serial/Lot Number';
                        ToolTip = 'Specifies if you want to show lot and serial number information for items that use item tracking.';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit()
        begin
            SumUpLinesEditable := true;
            BreakbulkEditable := true;
        end;

        trigger OnOpenPage()
        begin
            if HideOptions then begin
                BreakbulkEditable := false;
                SumUpLinesEditable := false;
            end;
        end;
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        PickFilter := "Warehouse Activity Header".GetFilters();
        Printed_By := UserId();
    end;

    trigger OnPostReport()
    var
        WhseActivityHeader: Record "Warehouse Activity Header";
    begin
        WhseActivityHeader.Reset();
        WhseActivityHeader.SetRange("No.", "Warehouse Activity Header"."No.");
        if WhseActivityHeader.FindSet() then
            repeat
                WhseActivityHeader."Printed By" := UserId();
                WhseActivityHeader."Printed At" := CurrentDateTime();
                WhseActivityHeader.Modify();
            until WhseActivityHeader.Next() = 0;
    end;

    var
        Location: Record Location;
        TempWhseActivLine: Record "Posted Invt. Pick Line" temporary;
        PickFilter: Text;
        InvtPick: Boolean;
        Counter: Integer;
        CurrReportPageNoCaptionLbl: Label 'Page';
        PickingListCaptionLbl: Label 'Picking List';
        WhseActLineDueDateCaptionLbl: Label 'Due Date';
        QtyHandledCaptionLbl: Label 'Qty. Handled';
        EmptyStringCaptionLbl: Label '____________';
        SalesLineComments: Text;
        EncodedBarcodeLineItemNo: Text;
        NonInventoryItemNo: Text;
        NonInventoryItemQuantity: Text;
        NonInventoryItemDescription: Text;
        SourceDocNo: Text;
        PaymentTermsCode: Text;
        CustomerNo: Text;
        SalespersonCode: Text;
        ExternalDocNo: Text;
        ShipmentMethodCOde: Text;
        EncodedWareShipmentHeaderNo: Text;
        EncodedSourceDocNo: Text;
        CurrentDateandTime: Text;
        OrderDate: Text;
        RequestedDeliveryDate: Text;
        ShipmentDate: Text;
        DShipPackagePaymentType: Text;
        DShipPackagePaymentAccountNo: Text;
        ShipToCustomerName: Text;
        ShipToContact: Text;
        ShipToAddress1: Text;
        ShipToAddress2: Text;
        ShipToCity: Text;
        ShipToState: Text;
        ShipToZipCode: Text;
        ShipFromCompanyName: Text;
        ShipFromContact: Text;
        ShipFromAddress1: Text;
        ShipFromAddress2: Text;
        ShipFromCity: Text;
        ShipFromState: Text;
        ShipFromZipCode: Text;
        ShipFromCountryCode: Text;
        ShipVia: Text;
        EnteredBy: Text;
        SalesHeaderWorkDescription: Text;
        WarehouseShipmentNoBarcode: Text;
        WarehouseShipmentNoText: Text;
        Printed_By: Text;
        AssembleToOrderNo: Text;
        AssembleToOrderDescription: Text;
        AssembleToOrderQty: Text;
        CustomerSupportVarGbl: CODE[20];
        MustHaveDateVarGbl: Date;


    protected var
        BreakbulkFilter: Boolean;
        HideOptions: Boolean;
        ShowLotSN: Boolean;
        SumUpLines: Boolean;
        BreakbulkEditable: Boolean;
        SumUpLinesEditable: Boolean;


    local procedure GetLocation(LocationCode: Code[10])
    begin
        if LocationCode = '' then
            Location.Init()
        else
            if Location.Code <> LocationCode then
                Location.Get(LocationCode);
    end;

    protected procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        exit(CurrReport.Preview() or MailManagement.IsHandlingGetEmailBody());
    end;

    procedure SetBreakbulkFilter(BreakbulkFilter2: Boolean)
    begin
        BreakbulkFilter := BreakbulkFilter2;
    end;

    procedure SetInventory(SetHideOptions: Boolean)
    begin
        HideOptions := SetHideOptions;
    end;

    local procedure GetUserName(SystemCreatedBy: Guid): Code[50]
    var
        UserRec: Record User;
    begin
        if UserRec.Get(SystemCreatedBy) then
            exit(UserRec."User Name");
    end;

    local procedure GetBarcodes()
    var
        BarcodeSymbology: Enum "Barcode Symbology";
        BarcodeFontProviderInterface: Interface "Barcode Font Provider";
        BarcodeFontProviderEnum: Enum "Barcode Font Provider";
        BarcodeString: Text;
        BarcodeString2: Text;
        BarcodeString3: Text;
        PickLine: Record "Warehouse Activity Line";
    begin
        PickLine.Reset();
        PickLine.SetRange("No.", "Warehouse Activity Header"."No.");
        if PickLine.FindFirst() then begin
            BarcodeString3 := PickLine."Whse. Document No.";
            WarehouseShipmentNoText := PickLine."Whse. Document No.";
        end;
        PickLine.Reset();
        BarcodeSymbology := BarcodeSymbology::Code39;
        BarcodeFontProviderInterface := BarcodeFontProviderEnum::IDAutomation1D;
        BarcodeString := "Warehouse Activity Header"."No.";
        BarcodeString2 := SourceDocNo;
        BarcodeFontProviderInterface.ValidateInput(BarcodeString, BarcodeSymbology);
        BarcodeFontProviderInterface.ValidateInput(BarcodeString2, BarcodeSymbology);
        // if "Warehouse Activity Header".Type <> "Warehouse Activity Header".Type::"Invt. Pick" then
        //BarcodeFontProviderInterface.ValidateInput(BarcodeString3, BarcodeSymbology);
        EncodedWareShipmentHeaderNo := BarcodeFontProviderInterface.EncodeFont(BarcodeString, BarcodeSymbology);
        EncodedSourceDocNo := BarcodeFontProviderInterface.EncodeFont(BarcodeString2, BarcodeSymbology);
        WarehouseShipmentNoBarcode := BarcodeFontProviderInterface.EncodeFont(BarcodeString3, BarcodeSymbology);
    end;

    local procedure GetBarcodesForLineNo()
    var
        BarcodeSymbology: Enum "Barcode Symbology";
        BarcodeFontProviderInterface: Interface "Barcode Font Provider";
        BarcodeFontProviderEnum: Enum "Barcode Font Provider";
        BarcodeString: Text;
        BarcodeString2: Text;
        ItemReference: Record "Item Reference";
    begin
        if (WhseActLine."Item No." <> '') and (WhseActLine."Variant Code" <> '') then begin
            ItemReference.Reset();
            ItemReference.SetRange("Item No.", WhseActLine."Item No.");
            ItemReference.SetRange("Variant Code", WhseActLine."Variant Code");
            if ItemReference.FindFirst() then
                BarcodeString := ItemReference."Reference No."
            else
                BarcodeString := WhseActLine."Item No.";
        end
        else
            BarcodeString := WhseActLine."Item No.";
        BarcodeSymbology := BarcodeSymbology::Code39;
        BarcodeFontProviderInterface := BarcodeFontProviderEnum::IDAutomation1D;
        BarcodeFontProviderInterface.ValidateInput(BarcodeString, BarcodeSymbology);
        EncodedBarcodeLineItemNo := BarcodeFontProviderInterface.EncodeFont(BarcodeString, BarcodeSymbology);
    end;

    local procedure GetCurrentDateandTime()
    var
    begin
        CurrentDateandTime := 'Printed: ' + Format(CurrentDateTime, 0, '<Month>/<Day>/<Year4> <Hours12>:<Minutes,2> <AM/PM>')
    end;

    procedure GetAssemblyItems()
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        Item: Record Item;
        LineBreak: Text;
        TypeHelper: Codeunit "Type Helper";
    begin
        LineBreak := TypeHelper.CRLFSeparator();
        AssembleToOrderNo := '';
        AssembleToOrderDescription := '';
        AssembleToOrderQty := '';
        SalesLine.Reset();
        SalesLine.SetRange("Document No.", "Warehouse Activity Header"."Source No.");
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        if SalesLine.FindSet() then
            repeat
                Item.Reset();
                Item.SetRange("No.", SalesLine."No.");
                Item.SetRange("Assembly Policy", Item."Assembly Policy"::"Assemble-to-Order");
                if Item.FindFirst() then begin
                    AssembleToOrderNo := AssembleToOrderNo + Item."No." + LineBreak;
                    AssembleToOrderDescription := AssembleToOrderDescription + Item.Description + LineBreak;
                    AssembleToOrderQty := AssembleToOrderQty + Format(SalesLine.Quantity) + LineBreak;
                end;
            until SalesLine.Next() = 0;
        if AssembleToOrderNo <> '' then begin
            AssembleToOrderNo := DelChr(AssembleToOrderNo, '>', LineBreak);
            AssembleToOrderDescription := DelChr(AssembleToOrderDescription, '>', LineBreak);
            AssembleToOrderQty := DelChr(AssembleToOrderQty, '>', LineBreak);
        end;
    end;
}

