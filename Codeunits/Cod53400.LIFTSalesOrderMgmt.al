codeunit 53400 "ORB LIFT Sales Order Mgmt"
{
    procedure PropagateOnSalesHeaderInsert(var LIFTSalesOrderBuffer: Record "ORB LIFT Sales Order Buffer")
    var
        DShipPackOptions: Record "DSHIP Package Options";
        SalesHeaderRecLcl: Record "Sales Header";
    begin
        if not SalesHeader.Get(LIFTSalesOrderBuffer."Document Type", LIFTSalesOrderBuffer."No.") then begin
            SalesHeader.Init();
            SalesHeader.Validate("Document Type", LIFTSalesOrderBuffer."Document Type");
            SalesHeader.Validate("No.", LIFTSalesOrderBuffer."No.");
            SalesHeader.Insert();
        end;
        DShipPackOptions.RetrievePackageOptions(Enum::"DSHIP Document Type"::"Sales Order", LIFTSalesOrderBuffer."No.", '');
        UpdateSalesHeader(LIFTSalesOrderBuffer, true);
        UpdateDShipPackageOptions(DShipPackOptions, LIFTSalesOrderBuffer);
    end;

    procedure PropagateOnSalesHeaderModify(var LIFTSalesOrderBuffer: Record "ORB LIFT Sales Order Buffer")
    var
        DShipPackOptions: Record "DSHIP Package Options";
        SalesShipmentHeader: Record "Sales Shipment Header";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesHeaderArchive: Record "Sales Header Archive";
        // SOLinesUnReserverCU: Codeunit "ORB SO Lines Unreserve";
        PostedSalesOrderError: Label 'Sales Order %1 is already Invoiced. And the Posted Sales Invoice is %2.';
        ShippedOrderError: Label 'Sales Order %1 is already Shipped. And the Posted Sales Shipment is %2.';
        CancelledSalesOrderError: Label 'Sales Order %1 is already cancelled.';
    begin
        Clear(OrderStatusReopen);
        OrderStatusReopen := false;
        SalesHeader.Reset();
        SalesHeader.SetRange("Document Type", LIFTSalesOrderBuffer."Document Type");
        SalesHeader.SetRange("No.", LIFTSalesOrderBuffer."No.");
        if SalesHeader.FindFirst() then begin
            //if SalesHeader.Get(LIFTSalesOrderBuffer."Document Type", LIFTSalesOrderBuffer."No.") then begin
            /*
                if SalesHeader."Completely Shipped" then begin
                    SalesShipmentHeader.Reset();
                    SalesShipmentHeader.SetRange("Order No.", LIFTSalesOrderBuffer."No.");
                    if SalesShipmentHeader.FindFirst() then
                        Error(StrSubstNo(ShippedOrderError, LIFTSalesOrderBuffer."No.", SalesShipmentHeader."No."));
                end;
            */
            if SalesHeader.Status = SalesHeader.Status::Released then begin
                ReOpenSalesOrder(SalesHeader);
                OrderStatusReopen := true;
            end;

            //Sales Line UnReserve
            // SOLinesUnReserverCU.UnreserveSalesOrder(SalesHeader."No.");

            ArchiveManagement.ArchiveSalesDocument(SalesHeader);
            UpdateSalesHeader(LIFTSalesOrderBuffer, false);
            DShipPackOptions.RetrievePackageOptions(Enum::"DSHIP Document Type"::"Sales Order", LIFTSalesOrderBuffer."No.", '');
            UpdateDShipPackageOptions(DShipPackOptions, LIFTSalesOrderBuffer);
            // if OrderStatusReopen then
            //     ReleaseSalesOrder(SalesHeader);
        end
        else begin
            SalesInvoiceHeader.Reset();
            SalesInvoiceHeader.SetRange("Order No.", LIFTSalesOrderBuffer."No.");
            if SalesInvoiceHeader.FindFirst() then
                Error(StrSubstNo(PostedSalesOrderError, LIFTSalesOrderBuffer."No.", SalesInvoiceHeader."No."))
            else begin
                SalesHeaderArchive.Reset();
                SalesHeaderArchive.SetRange("No.", LIFTSalesOrderBuffer."No.");
                if SalesHeaderArchive.FindLast() then
                    Error(StrSubstNo(CancelledSalesOrderError, LIFTSalesOrderBuffer."No."));
            end;
        end;
    end;

    local procedure UpdateSalesHeader(var LIFTSalesOrderBuffer: Record "ORB LIFT Sales Order Buffer"; CreateSO: Boolean)
    begin
        ValidateSalesHeaderFields(SalesHeader, LIFTSalesOrderBuffer, CreateSO);
        SalesHeader.Modify();
    end;

    procedure ValidateSalesHeaderFields(var SalesHeader: Record "Sales Header"; var LIFTSalesOrderBuffer: Record "ORB LIFT Sales Order Buffer"; CreateSO: Boolean)
    var
        Contact: Record Contact;
    begin
        if SalesHeader."Sell-to Customer No." <> LIFTSalesOrderBuffer."Sell-to Customer No." then
            SalesHeader.Validate("Sell-to Customer No.", LIFTSalesOrderBuffer."Sell-to Customer No.");
        //SalesHeader.Validate("Bill-to Customer No.", LIFTSalesOrderBuffer."Bill-to Customer No.");
        if SalesHeader."Ship-to Code" <> LIFTSalesOrderBuffer."Ship-to Code" then
            SalesHeader.Validate("Ship-to Code", LIFTSalesOrderBuffer."Ship-to Code");
        if SalesHeader."Ship-to Name" <> LIFTSalesOrderBuffer."Ship-to Name" then
            SalesHeader.Validate("Ship-to Name", LIFTSalesOrderBuffer."Ship-to Name");
        if SalesHeader."Ship-to Name 2" <> LIFTSalesOrderBuffer."Ship-to Name 2" then
            SalesHeader.Validate("Ship-to Name 2", LIFTSalesOrderBuffer."Ship-to Name 2");
        if SalesHeader."Ship-to Address" <> LIFTSalesOrderBuffer."Ship-to Address" then
            SalesHeader.Validate("Ship-to Address", LIFTSalesOrderBuffer."Ship-to Address");
        if SalesHeader."Ship-to Address 2" <> LIFTSalesOrderBuffer."Ship-to Address 2" then
            SalesHeader.Validate("Ship-to Address 2", LIFTSalesOrderBuffer."Ship-to Address 2");
        if SalesHeader."Ship-to City" <> LIFTSalesOrderBuffer."Ship-to City" then
            SalesHeader.Validate("Ship-to City", LIFTSalesOrderBuffer."Ship-to City");
        if SalesHeader."Ship-to Contact" <> LIFTSalesOrderBuffer."Ship-to Contact" then
            SalesHeader.Validate("Ship-to Contact", LIFTSalesOrderBuffer."Ship-to Contact");
        if SalesHeader."Order Date" <> LIFTSalesOrderBuffer."Order Date" then
            SalesHeader.Validate("Order Date", LIFTSalesOrderBuffer."Order Date");
        if SalesHeader."Posting Date" <> LIFTSalesOrderBuffer."Posting Date" then
            SalesHeader.Validate("Posting Date", LIFTSalesOrderBuffer."Posting Date");
        if SalesHeader."Shipment Date" <> LIFTSalesOrderBuffer."Shipment Date" then
            SalesHeader.Validate("Shipment Date", LIFTSalesOrderBuffer."Shipment Date");
        if LIFTSalesOrderBuffer."Your Reference" <> '' then
            if SalesHeader."Payment Terms Code" <> 'CC' then
                SalesHeader.Validate("Payment Terms Code", 'CC');
        if SalesHeader."Due Date" <> LIFTSalesOrderBuffer."Due Date" then
            SalesHeader.Validate("Due Date", LIFTSalesOrderBuffer."Due Date");
        if SalesHeader."Shipment Method Code" <> LIFTSalesOrderBuffer."Shipment Method Code" then
            SalesHeader.Validate("Shipment Method Code", LIFTSalesOrderBuffer."Shipment Method Code");
        if SalesHeader."Customer Price Group" <> LIFTSalesOrderBuffer."Customer Price Group" then
            SalesHeader.Validate("Customer Price Group", LIFTSalesOrderBuffer."Customer Price Group");
        if SalesHeader."Salesperson Code" <> LIFTSalesOrderBuffer."Salesperson Code" then
            SalesHeader.Validate("Salesperson Code", LIFTSalesOrderBuffer."Salesperson Code");
        if SalesHeader."ORB Customer Support" <> LIFTSalesOrderBuffer."ORB Customer Support" then
            SalesHeader.Validate("ORB Customer Support", LIFTSalesOrderBuffer."ORB Customer Support");
        if SalesHeader."Ship-to Post Code" <> LIFTSalesOrderBuffer."Ship-to Post Code" then
            SalesHeader.Validate("Ship-to Post Code", LIFTSalesOrderBuffer."Ship-to Post Code");
        if SalesHeader."Ship-to County" <> LIFTSalesOrderBuffer."Ship-to County" then
            SalesHeader.Validate("Ship-to County", LIFTSalesOrderBuffer."Ship-to County");
        if LIFTSalesOrderBuffer."Ship-to Country/Region Code" <> '' then begin
            if SalesHeader."Ship-to Country/Region Code" <> LIFTSalesOrderBuffer."Ship-to Country/Region Code" then
                SalesHeader.Validate("Ship-to Country/Region Code", LIFTSalesOrderBuffer."Ship-to Country/Region Code");
        end else begin
            if SalesHeader."Ship-to Country/Region Code" <> 'US' then
                SalesHeader.Validate("Ship-to Country/Region Code", 'US');
        end;
        if SalesHeader."Document Date" <> LIFTSalesOrderBuffer."Document Date" then
            SalesHeader.Validate("Document Date", LIFTSalesOrderBuffer."Document Date");
        if SalesHeader."External Document No." <> LIFTSalesOrderBuffer."External Document No." then
            SalesHeader.Validate("External Document No.", LIFTSalesOrderBuffer."External Document No.");
        if LIFTSalesOrderBuffer."Your Reference" <> '' then
            if SalesHeader."Payment Method Code" <> LIFTSalesOrderBuffer."Payment Method Code" then
                SalesHeader.Validate("Payment Method Code", LIFTSalesOrderBuffer."Payment Method Code");
        if SalesHeader."Shipping Agent Code" <> LIFTSalesOrderBuffer."Shipping Agent Code" then
            SalesHeader.Validate("Shipping Agent Code", LIFTSalesOrderBuffer."Shipping Agent Code");
        SalesHeader.SetWorkDescription(LIFTSalesOrderBuffer."ORB LIFT ART_NOTE");
        //SalesHeader.Validate("Shipping Advice", LIFTSalesOrderBuffer."Shipping Advice");
        if SalesHeader."Shipping Agent Service Code" <> LIFTSalesOrderBuffer."Shipping Agent Service Code" then
            SalesHeader.Validate("Shipping Agent Service Code", LIFTSalesOrderBuffer."Shipping Agent Service Code");
        if CreateSO then
            SalesHeader.Validate("Order Status", LIFTSalesOrderBuffer."Order Status");
        if SalesHeader."Location Code" <> LIFTSalesOrderBuffer."Location Code" then
            SalesHeader.Validate("Location Code", LIFTSalesOrderBuffer."Location Code");
        if SalesHeader."Shortcut Dimension 1 Code" <> LIFTSalesOrderBuffer."Shortcut Dimension 1 Code" then
            SalesHeader.Validate("Shortcut Dimension 1 Code", LIFTSalesOrderBuffer."Shortcut Dimension 1 Code");
        if SalesHeader."Shortcut Dimension 2 Code" <> LIFTSalesOrderBuffer."Shortcut Dimension 2 Code" then
            SalesHeader.Validate("Shortcut Dimension 2 Code", LIFTSalesOrderBuffer."Shortcut Dimension 2 Code");
        if SalesHeader."Location Override" <> LIFTSalesOrderBuffer."Location Override" then
            SalesHeader.Validate("Location Override", LIFTSalesOrderBuffer."Location Override");
        if SalesHeader.Created_By <> LIFTSalesOrderBuffer.Created_By then
            SalesHeader.Validate("Created_By", LIFTSalesOrderBuffer."Created_By");
        if SalesHeader.Rush <> LIFTSalesOrderBuffer.Rush then
            SalesHeader.Validate("Rush", LIFTSalesOrderBuffer."Rush");
        if SalesHeader."ORB Declared Value" <> LIFTSalesOrderBuffer."ORB Declared Value" then
            SalesHeader.Validate("ORB Declared Value", LIFTSalesOrderBuffer."ORB Declared Value");
        if SalesHeader."ORB International Contact" <> LIFTSalesOrderBuffer."ORB International Contact" then
            SalesHeader.Validate("ORB International Contact", LIFTSalesOrderBuffer."ORB International Contact");
        if SalesHeader."ORB Magento Order #" <> LIFTSalesOrderBuffer."ORB Magento Order #" then
            SalesHeader.Validate("ORB Magento Order #", LIFTSalesOrderBuffer."ORB Magento Order #");
        if SalesHeader."ORB Magento CC 4 Digits" <> LIFTSalesOrderBuffer."ORB Magento CC 4 Digits" then
            SalesHeader.Validate("ORB Magento CC 4 Digits", LIFTSalesOrderBuffer."ORB Magento CC 4 Digits");
        if LIFTSalesOrderBuffer."Sales Order Payment Type" = LIFTSalesOrderBuffer."Sales Order Payment Type"::"3rd Party" then begin
            if SalesHeader."Sales Order Payment Type" <> SalesHeader."Sales Order Payment Type"::"Third Party" then
                SalesHeader.Validate("Sales Order Payment Type", SalesHeader."Sales Order Payment Type"::"Third Party")
        end else if LIFTSalesOrderBuffer."Sales Order Payment Type" = LIFTSalesOrderBuffer."Sales Order Payment Type"::Free then begin
            if SalesHeader."Sales Order Payment Type" <> SalesHeader."Sales Order Payment Type"::Collect then
                SalesHeader.Validate("Sales Order Payment Type", SalesHeader."Sales Order Payment Type"::Collect)
        end else begin
            if SalesHeader."Sales Order Payment Type" <> LIFTSalesOrderBuffer."Sales Order Payment Type" then
                SalesHeader.Validate("Sales Order Payment Type", LIFTSalesOrderBuffer."Sales Order Payment Type");
        end;
        if SalesHeader."SO Payment Account No." <> LIFTSalesOrderBuffer."SO Payment Account No." then
            SalesHeader.Validate("SO Payment Account No.", LIFTSalesOrderBuffer."SO Payment Account No.");
        if SalesHeader."In-Hands Date" <> LIFTSalesOrderBuffer."In-Hands Date" then
            SalesHeader.Validate("In-Hands Date", LIFTSalesOrderBuffer."In-Hands Date");
        if SalesHeader."Created At" <> LIFTSalesOrderBuffer."Created At" then
            SalesHeader.Validate("Created At", LIFTSalesOrderBuffer."Created At");
        //SalesHeader.Validate("Sell-to Contact No.", LIFTSalesOrderBuffer."Sell-to Contact No.");
        if SalesHeader."Sell-To Contact No. (Custom)" <> LIFTSalesOrderBuffer."Sell-To Contact No." then begin
            SalesHeader.Validate("Sell-To Contact No. (Custom)", LIFTSalesOrderBuffer."Sell-to Contact No.");
            Contact.Reset();
            if Contact.Get(LIFTSalesOrderBuffer."Sell-To Contact No.") then begin
                if SalesHeader."Sell-to Contact No." <> Contact."No." then
                    SalesHeader.Validate("Sell-to Contact No.", Contact."No.");
                if SalesHeader."Sell-To Contact Name (Custom)" <> Contact.Name then
                    SalesHeader.Validate("Sell-To Contact Name (Custom)", Contact.Name);
                if SalesHeader."Sell-to Contact" <> Contact.Name then
                    SalesHeader.Validate("Sell-to Contact", Contact.Name);
                if SalesHeader."Sell-To Phone No. (Custom)" <> Contact."Phone No." then
                    SalesHeader.Validate("Sell-To Phone No. (Custom)", Contact."Phone No.");
                if SalesHeader."Sell-to Phone No." <> Contact."Phone No." then
                    SalesHeader.Validate("Sell-to Phone No.", Contact."Phone No.");
                if SalesHeader."Sell-To Email (Custom)" <> Contact."E-Mail" then
                    SalesHeader.Validate("Sell-To Email (Custom)", Contact."E-Mail");
                if SalesHeader."Sell-to E-Mail" <> Contact."E-Mail" then
                    SalesHeader.Validate("Sell-to E-Mail", Contact."E-Mail");
                if SalesHeader."Bill-to Contact No." <> Contact."No." then
                    SalesHeader.Validate("Bill-to Contact No.", Contact."No.");
                if SalesHeader."Bill-to Contact" <> Contact.Name then
                    SalesHeader.Validate("Bill-to Contact", Contact.Name);
            end;
        end;
        //SalesHeader.Validate("Sell-to Contact", LIFTSalesOrderBuffer."Sell-to Contact");
        if SalesHeader."Your Reference" <> LIFTSalesOrderBuffer."Your Reference" then
            SalesHeader.Validate("Your Reference", LIFTSalesOrderBuffer."Your Reference");
        SalesHeader."ORB Lift Order" := true;
    end;

    procedure PropagateOnSalesLineInsert(var LIFTSalesLineBuffer: Record "ORB LIFT Sales Line Buffer")
    var
        SalesLineRecLcl: Record "Sales Line";
        LineNo: Integer;
    begin
        if LIFTSalesLineBuffer."No." = '' then
            exit;
        SalesLine.Reset();
        SalesLine.SetRange("Document Type", LIFTSalesLineBuffer."Document Type"::Order);
        SalesLine.SetRange("Document No.", LIFTSalesLineBuffer."Document No.");
        if SalesLine.FindLast() then
            LineNo := SalesLine."Line No." + 10000
        else
            LineNo := 10000;

        SalesLine.Reset();
        SalesLine.SetRange("Document Type", LIFTSalesLineBuffer."Document Type");
        SalesLine.SetRange("Document No.", LIFTSalesLineBuffer."Document No.");
        SalesLine.SetRange("ORB LIFT Line ID", LIFTSalesLineBuffer."LIFT Line ID");
        if not SalesLine.FindLast() then begin
            SalesLine.Init();
            SalesLine.Validate("Document Type", LIFTSalesLineBuffer."Document Type");
            SalesLine.Validate("Document No.", LIFTSalesLineBuffer."Document No.");
            SalesLine.Validate("Line No.", LineNo);
            SalesLine.Insert(true);
        end;

        UpdateSalesLine(LIFTSalesLineBuffer);
    end;

    procedure PropagateOnSalesLineModify(var LIFTSalesLineBuffer: Record "ORB LIFT Sales Line Buffer")
    begin
        SalesLine.Reset();
        SalesLine.SetRange("Document Type", LIFTSalesLineBuffer."Document Type");
        SalesLine.SetRange("Document No.", LIFTSalesLineBuffer."Document No.");
        SalesLine.SetRange("ORB LIFT Line ID", LIFTSalesLineBuffer."LIFT Line ID");
        if SalesLine.FindLast() then
            // if SalesHeader.Get(LIFTSalesLineBuffer."Document Type", LIFTSalesLineBuffer."Document No.") then begin
            //     ArchiveManagement.ArchiveSalesDocument(SalesHeader);
                UpdateSalesLine(LIFTSalesLineBuffer);
    end;

    local procedure UpdateSalesLine(var LIFTSalesLineBuffer: Record "ORB LIFT Sales Line Buffer")
    begin
        ValidateSalesLineFields(SalesLine, LIFTSalesLineBuffer);
        SalesLine.Modify();
        SalesLine.SuspendStatusCheck(false);
    end;

    procedure ValidateSalesLineFields(var SalesLine: Record "Sales Line"; var LIFTSalesLineBuffer: Record "ORB LIFT Sales Line Buffer")
    var
        ItemRecLcl: Record Item;
    begin
        PrevLineDiscount := SalesLine."Line Discount Amount";

        SalesLine.SuspendStatusCheck(true);
        if SalesLine."Sell-to Customer No." <> LIFTSalesLineBuffer."Sell-to Customer No." then
            SalesLine.Validate("Sell-to Customer No.", LIFTSalesLineBuffer."Sell-to Customer No.");
        //SalesLine.Validate(Type, SalesLine.Type::Item);
        IF LIFTSalesLineBuffer.Type = LIFTSalesLineBuffer.Type::Comment then begin
            if SalesLine.Type <> SalesLine.Type::" " then
                SalesLine.Validate(Type, SalesLine.Type::" ");
            if ItemRecLcl.get(LIFTSalesLineBuffer."No.") then begin
                if SalesLine.Description <> ItemRecLcl.Description then
                    SalesLine.Description := ItemRecLcl.Description;
                if SalesLine."Description 2" <> ItemRecLcl."Description 2" then
                    SalesLine."Description 2" := ItemRecLcl."Description 2";
                if SalesLine."ORB LIFT Line ID" <> LIFTSalesLineBuffer."LIFT Line ID" then
                    SalesLine."ORB LIFT Line ID" := LIFTSalesLineBuffer."LIFT Line ID";
            end;
        end else begin
            IF LIFTSalesLineBuffer.Type = LIFTSalesLineBuffer.Type::Resource then begin
                if SalesLine.Type <> SalesLine.Type::Resource then begin
                    SalesLine.Validate(Type, SalesLine.Type::Resource)
                end;
            end
            else
                if SalesLine.Type <> SalesLine.Type::Item then
                    SalesLine.Validate(Type, SalesLine.Type::Item);
            if SalesLine."No." <> LIFTSalesLineBuffer."No." then
                SalesLine.Validate("No.", LIFTSalesLineBuffer."No.");
            //SalesLine.Validate("Location Code", LIFTSalesLineBuffer."Location Code");
            if SalesLine.Quantity <> LIFTSalesLineBuffer.Quantity then
                SalesLine.Validate(Quantity, LIFTSalesLineBuffer.Quantity);
            //SalesLine.Validate("Shortcut Dimension 1 Code", LIFTSalesLineBuffer."Shortcut Dimension 1 Code");
            if SalesLine."Shortcut Dimension 2 Code" <> LIFTSalesLineBuffer."Shortcut Dimension 2 Code" then
                SalesLine.Validate("Shortcut Dimension 2 Code", LIFTSalesLineBuffer."Shortcut Dimension 2 Code");
            if SalesLine."Variant Code" <> LIFTSalesLineBuffer."Variant Code" then
                SalesLine.Validate("Variant Code", LIFTSalesLineBuffer."Variant Code");
            if SalesLine."Unit of Measure Code" <> LIFTSalesLineBuffer."Unit of Measure Code" then
                SalesLine.Validate("Unit of Measure Code", LIFTSalesLineBuffer."Unit of Measure Code");
            if SalesLine."Requested Delivery Date" <> LIFTSalesLineBuffer."Requested Delivery Date" then
                SalesLine.Validate("Requested Delivery Date", LIFTSalesLineBuffer."Requested Delivery Date");
            if SalesLine."Promised Delivery Date" <> LIFTSalesLineBuffer."Promised Delivery Date" then
                SalesLine.Validate("Promised Delivery Date", LIFTSalesLineBuffer."Promised Delivery Date");
            if SalesLine."Planned Delivery Date" <> LIFTSalesLineBuffer."Planned Delivery Date" then
                SalesLine.Validate("Planned Delivery Date", LIFTSalesLineBuffer."Planned Delivery Date");
            if SalesLine."Planned Shipment Date" <> LIFTSalesLineBuffer."Planned Shipment Date" then
                SalesLine.Validate("Planned Shipment Date", LIFTSalesLineBuffer."Planned Shipment Date");
            if SalesLine."Shipment Date" <> LIFTSalesLineBuffer."Shipment Date" then
                SalesLine.Validate("Shipment Date", LIFTSalesLineBuffer."Shipment Date");
            if SalesLine.Width <> LIFTSalesLineBuffer.Width then
                SalesLine.Validate(Width, LIFTSalesLineBuffer.Width);
            if SalesLine.Height <> LIFTSalesLineBuffer.Height then
                SalesLine.Validate(Height, LIFTSalesLineBuffer.Height);
            if SalesLine."Hardware Price" <> LIFTSalesLineBuffer."Hardware Price" then
                SalesLine.Validate("Hardware Price", LIFTSalesLineBuffer."Hardware Price");
            if SalesLine."Graphics Price" <> LIFTSalesLineBuffer."Graphics Price" then
                SalesLine.Validate("Graphics Price", LIFTSalesLineBuffer."Graphics Price");
            //SalesLine.Validate("Line Discount %", LIFTSalesLineBuffer."Line Discount %");
            //Calculate "Discount Grp Code Discount" on Net Jnit Price coming from LIFT start
            if SalesLine."Unit Price" <> LIFTSalesLineBuffer."Unit Price" then
                SalesLine.Validate("Unit Price", LIFTSalesLineBuffer."Unit Price");

            //Check if there is a change in discount
            if PrevLineDiscount <> SalesLine."Line Discount Amount" then
                BCOriginalDiscount := SalesLine."Line Discount Amount"
            else
                BCOriginalDiscount := SalesLine."Line Discount Amount" - SalesLine."ORB LIFT Discount Amount";

            // BCOriginalDiscount := SalesLine."Line Discount Amount";

            //Calculate "Discount Grp Code Discount" on Net Jnit Price coming from LIFT End
            if SalesLine."Unit Price" <> LIFTSalesLineBuffer."Original Unit Price" then
                SalesLine.Validate("Unit Price", LIFTSalesLineBuffer."Original Unit Price");
            //SalesLine.Validate("Line Discount Amount", LIFTSalesLineBuffer."Line Discount Amount");
            //BCLineDiscount := SalesLine."Line Discount Amount";
            if SalesLine."ORB LIFT Discount Amount" <> LIFTSalesLineBuffer."Line Discount Amount" then
                SalesLine.Validate("ORB LIFT Discount Amount", LIFTSalesLineBuffer."Line Discount Amount");
            //SalesLine.Validate("Line Discount Amount", (BCLineDiscount + SalesLine."ORB LIFT Discount Amount"));
            if SalesLine."Line Discount Amount" <> (BCOriginalDiscount + SalesLine."ORB LIFT Discount Amount") then
                SalesLine.Validate("Line Discount Amount", (BCOriginalDiscount + SalesLine."ORB LIFT Discount Amount"));
            if SalesLine."ORB LIFT Line ID" <> LIFTSalesLineBuffer."LIFT Line ID" then
                SalesLine."ORB LIFT Line ID" := LIFTSalesLineBuffer."LIFT Line ID";
            if SalesLine."ORB LIFT Step No." <> LIFTSalesLineBuffer."ORB LIFT Step No." then
                SalesLine.Validate("ORB LIFT Step No.", LIFTSalesLineBuffer."ORB LIFT Step No.");
        end
    end;

    procedure PropagateOnSalesLineDelete(LIFTSalesLineBuffer: Record "ORB LIFT Sales Line Buffer")
    begin
        SalesLine.Reset();
        SalesLine.SetRange("Document Type", LIFTSalesLineBuffer."Document Type");
        SalesLine.SetRange("Document No.", LIFTSalesLineBuffer."Document No.");
        SalesLine.SetRange("ORB LIFT Line ID", LIFTSalesLineBuffer."LIFT Line ID");
        if SalesLine.FindLast() then
            // if SalesHeader.Get(LIFTSalesLineBuffer."Document Type", LIFTSalesLineBuffer."Document No.") then begin
            //     ArchiveManagement.ArchiveSalesDocument(SalesHeader);
            SalesLine.Delete();
    end;

    procedure UpdateDShipPackageOptions(var DShipPackOptions: Record "DSHIP Package Options"; var LIFTSalesOrderBuffer: Record "ORB LIFT Sales Order Buffer")
    begin
        ValidateDShipPackOptionFields(DShipPackOptions, LIFTSalesOrderBuffer);
        DShipPackOptions.Modify();
    end;

    procedure ValidateDShipPackOptionFields(var DShipPackOptions: Record "DSHIP Package Options"; var LIFTSalesOrderBuffer: Record "ORB LIFT Sales Order Buffer")
    begin
        if LIFTSalesOrderBuffer."Sales Order Payment Type" = LIFTSalesOrderBuffer."Sales Order Payment Type"::"3rd Party" then begin
            DShipPackOptions.Validate("Payment Type", SalesHeader."Sales Order Payment Type"::"Third Party");
            if LIFTSalesOrderBuffer."SO Payment Account No." <> '' then
                DShipPackOptions.Validate("Payment Account No.", LIFTSalesOrderBuffer."SO Payment Account No.");
            if LIFTSalesOrderBuffer."Payment Postal Code" <> '' then
                DShipPackOptions.Validate("Payment Postal Code", LIFTSalesOrderBuffer."Payment Postal Code");
            if LIFTSalesOrderBuffer."Payment Province" <> '' then
                DShipPackOptions.Validate("Payment Province", LIFTSalesOrderBuffer."Payment Province");
            if LIFTSalesOrderBuffer."Payment Country Code" <> '' then
                DShipPackOptions.Validate("Payment Country Code", LIFTSalesOrderBuffer."Payment Country Code");
        end
        else if LIFTSalesOrderBuffer."Sales Order Payment Type" = LIFTSalesOrderBuffer."Sales Order Payment Type"::Free then begin
            DShipPackOptions.Validate("Payment Type", SalesHeader."Sales Order Payment Type"::Collect);
            ClearDSPaymentDetails(DShipPackOptions);
        end
        else if LIFTSalesOrderBuffer."Sales Order Payment Type" = LIFTSalesOrderBuffer."Sales Order Payment Type"::None then begin
            DShipPackOptions.Validate("Payment Type", LIFTSalesOrderBuffer."Sales Order Payment Type"::None);
            ClearDSPaymentDetails(DShipPackOptions);
        end;
    end;

    local procedure ReOpenSalesOrder(var SalesHeader: Record "Sales Header")
    var
        ReleaseSalesDocument: Codeunit "Release Sales Document";
    begin
        ReleaseSalesDocument.PerformManualReopen(SalesHeader);
        //SalesHeader.PerformManualReopen(SalesHeader);
    end;

    // local procedure ReleaseSalesOrder(var SalesHeader: Record "Sales Header")
    // var
    //     ReleaseSalesDocument: Codeunit "Release Sales Document";
    // begin
    //     ReleaseSalesDocument.PerformManualRelease(SalesHeader);
    //     //SalesHeader.PerformManualRelease(SalesHeader);
    // end;

    local procedure ClearDSPaymentDetails(var DShipPackOptions: Record "DSHIP Package Options")
    begin
        DShipPackOptions.Validate("Payment Account No.", '');
        DShipPackOptions.Validate("Payment Postal Code", '');
        DShipPackOptions.Validate("Payment Province", '');
        DShipPackOptions.Validate("Payment Country Code", '');
    end;

    procedure PropagateOnSalesOrderDelete(var LIFTSalesOrderBuffer: Record "ORB LIFT Sales Order Buffer")
    var
        CancelledSalesOrderError: Label 'Sales Order %1 is already cancelled';
        SalesHeaderArchiveLcl: Record "Sales Header Archive";
    begin
        SalesHeader.Reset();
        SalesHeader.SetRange("Document Type", LIFTSalesOrderBuffer."Document Type");
        SalesHeader.SetRange("No.", LIFTSalesOrderBuffer."No.");
        if SalesHeader.FindLast() then begin
            SalesHeader.Validate("ORB Order Cancelled", true);
            SalesHeader.Validate("External Document No.", LIFTSalesOrderBuffer."External Document No.");
            SalesHeader.Modify();
            // ArchiveManagement.ArchiveSalesDocument(SalesHeader);
            SalesHeader.Delete(true);
        end
        else begin
            SalesHeaderArchiveLcl.Reset();
            SalesHeaderArchiveLcl.SetRange("No.", LIFTSalesOrderBuffer."No.");
            if SalesHeaderArchiveLcl.FindLast() then
                Error(StrSubstNo(CancelledSalesOrderError, LIFTSalesOrderBuffer."No."));
        end;
    end;

    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        BCLineDiscount: Decimal;
        BCOriginalDiscount: Decimal;
        PrevLineDiscount: Decimal;
        ArchiveManagement: Codeunit ArchiveManagement;
        LineNo: Integer;
        OrderStatusReopen: Boolean;
}