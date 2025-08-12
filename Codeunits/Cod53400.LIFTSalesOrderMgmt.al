codeunit 53400 "ORB LIFT Sales Order Mgmt"
{
    procedure PropagateOnSalesHeaderInsert(var LIFTSalesOrderBuffer: Record "ORB LIFT Sales Order Buffer")
    var
        DShipPackOptions: Record "DSHIP Package Options";
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
    begin
        Clear(OrderStatusReopen);
        OrderStatusReopen := false;
        SalesHeader.Reset();
        SalesHeader.SetRange("Document Type", LIFTSalesOrderBuffer."Document Type");
        SalesHeader.SetRange("No.", LIFTSalesOrderBuffer."No.");
        if SalesHeader.FindFirst() then begin
            //if SalesHeader.Get(LIFTSalesOrderBuffer."Document Type", LIFTSalesOrderBuffer."No.") then begin
            if SalesHeader.Status = SalesHeader.Status::Released then begin
                ReOpenSalesOrder(SalesHeader);
                OrderStatusReopen := true;
            end;
            ArchiveManagement.ArchiveSalesDocument(SalesHeader);
            UpdateSalesHeader(LIFTSalesOrderBuffer, false);
        end;
        DShipPackOptions.RetrievePackageOptions(Enum::"DSHIP Document Type"::"Sales Order", LIFTSalesOrderBuffer."No.", '');
        UpdateDShipPackageOptions(DShipPackOptions, LIFTSalesOrderBuffer);
        if OrderStatusReopen then
            ReleaseSalesOrder(SalesHeader);
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
        SalesHeader.Validate("Sell-to Customer No.", LIFTSalesOrderBuffer."Sell-to Customer No.");
        //SalesHeader.Validate("Bill-to Customer No.", LIFTSalesOrderBuffer."Bill-to Customer No.");
        SalesHeader.Validate("Ship-to Code", LIFTSalesOrderBuffer."Ship-to Code");
        SalesHeader.Validate("Ship-to Name", LIFTSalesOrderBuffer."Ship-to Name");
        SalesHeader.Validate("Ship-to Name 2", LIFTSalesOrderBuffer."Ship-to Name 2");
        SalesHeader.Validate("Ship-to Address", LIFTSalesOrderBuffer."Ship-to Address");
        SalesHeader.Validate("Ship-to Address 2", LIFTSalesOrderBuffer."Ship-to Address 2");
        SalesHeader.Validate("Ship-to City", LIFTSalesOrderBuffer."Ship-to City");
        SalesHeader.Validate("Ship-to Contact", LIFTSalesOrderBuffer."Ship-to Contact");
        SalesHeader.Validate("Order Date", LIFTSalesOrderBuffer."Order Date");
        SalesHeader.Validate("Posting Date", LIFTSalesOrderBuffer."Posting Date");
        SalesHeader.Validate("Shipment Date", LIFTSalesOrderBuffer."Shipment Date");
        if LIFTSalesOrderBuffer."Your Reference" <> '' then
            SalesHeader.Validate("Payment Terms Code", 'CC');
        SalesHeader.Validate("Due Date", LIFTSalesOrderBuffer."Due Date");
        SalesHeader.Validate("Shipment Method Code", LIFTSalesOrderBuffer."Shipment Method Code");
        SalesHeader.Validate("Customer Price Group", LIFTSalesOrderBuffer."Customer Price Group");
        SalesHeader.Validate("Salesperson Code", LIFTSalesOrderBuffer."Salesperson Code");
        SalesHeader.Validate("ORB Customer Support", LIFTSalesOrderBuffer."ORB Customer Support");
        SalesHeader.Validate("Ship-to Post Code", LIFTSalesOrderBuffer."Ship-to Post Code");
        SalesHeader.Validate("Ship-to County", LIFTSalesOrderBuffer."Ship-to County");
        if LIFTSalesOrderBuffer."Ship-to Country/Region Code" <> '' then
            SalesHeader.Validate("Ship-to Country/Region Code", LIFTSalesOrderBuffer."Ship-to Country/Region Code")
        else
            SalesHeader.Validate("Ship-to Country/Region Code", 'US');
        SalesHeader.Validate("Document Date", LIFTSalesOrderBuffer."Document Date");
        SalesHeader.Validate("External Document No.", LIFTSalesOrderBuffer."External Document No.");
        if LIFTSalesOrderBuffer."Your Reference" <> '' then
            SalesHeader.Validate("Payment Method Code", LIFTSalesOrderBuffer."Payment Method Code");
        SalesHeader.Validate("Shipping Agent Code", LIFTSalesOrderBuffer."Shipping Agent Code");
        SalesHeader.SetWorkDescription(LIFTSalesOrderBuffer."ORB LIFT ART_NOTE");
        //SalesHeader.Validate("Shipping Advice", LIFTSalesOrderBuffer."Shipping Advice");
        SalesHeader.Validate("Shipping Agent Service Code", LIFTSalesOrderBuffer."Shipping Agent Service Code");
        if CreateSO then
            SalesHeader.Validate("Order Status", LIFTSalesOrderBuffer."Order Status");
        SalesHeader.Validate("Location Code", LIFTSalesOrderBuffer."Location Code");
        SalesHeader.Validate("Shortcut Dimension 1 Code", LIFTSalesOrderBuffer."Shortcut Dimension 1 Code");
        SalesHeader.Validate("Shortcut Dimension 2 Code", LIFTSalesOrderBuffer."Shortcut Dimension 2 Code");
        SalesHeader.Validate("Location Override", LIFTSalesOrderBuffer."Location Override");
        SalesHeader.Validate("Created_By", LIFTSalesOrderBuffer."Created_By");
        SalesHeader.Validate("Rush", LIFTSalesOrderBuffer."Rush");
        SalesHeader.Validate("ORB Declared Value", LIFTSalesOrderBuffer."ORB Declared Value");
        SalesHeader.Validate("ORB International Contact", LIFTSalesOrderBuffer."ORB International Contact");
        SalesHeader.Validate("ORB Magento Order #", LIFTSalesOrderBuffer."ORB Magento Order #");
        SalesHeader.Validate("ORB Magento CC 4 Digits", LIFTSalesOrderBuffer."ORB Magento CC 4 Digits");
        if LIFTSalesOrderBuffer."Sales Order Payment Type" = LIFTSalesOrderBuffer."Sales Order Payment Type"::"3rd Party" then
            SalesHeader.Validate("Sales Order Payment Type", SalesHeader."Sales Order Payment Type"::"Third Party")
        else if LIFTSalesOrderBuffer."Sales Order Payment Type" = LIFTSalesOrderBuffer."Sales Order Payment Type"::Free then
            SalesHeader.Validate("Sales Order Payment Type", SalesHeader."Sales Order Payment Type"::Collect)
        else
            SalesHeader.Validate("Sales Order Payment Type", LIFTSalesOrderBuffer."Sales Order Payment Type");
        SalesHeader.Validate("SO Payment Account No.", LIFTSalesOrderBuffer."SO Payment Account No.");
        SalesHeader.Validate("In-Hands Date", LIFTSalesOrderBuffer."In-Hands Date");
        SalesHeader.Validate("Created At", LIFTSalesOrderBuffer."Created At");
        //SalesHeader.Validate("Sell-to Contact No.", LIFTSalesOrderBuffer."Sell-to Contact No.");
        SalesHeader.Validate("Sell-To Contact No. (Custom)", LIFTSalesOrderBuffer."Sell-to Contact No.");
        Contact.Reset();
        if Contact.Get(LIFTSalesOrderBuffer."Sell-To Contact No.") then begin
            SalesHeader.Validate("Sell-to Contact No.", Contact."No.");
            SalesHeader.Validate("Sell-To Contact Name (Custom)", Contact.Name);
            SalesHeader.Validate("Sell-to Contact", Contact.Name);
            SalesHeader.Validate("Sell-To Phone No. (Custom)", Contact."Phone No.");
            SalesHeader.Validate("Sell-to Phone No.", Contact."Phone No.");
            SalesHeader.Validate("Sell-To Email (Custom)", Contact."E-Mail");
            SalesHeader.Validate("Sell-to E-Mail", Contact."E-Mail");
            SalesHeader.Validate("Bill-to Contact No.", Contact."No.");
            SalesHeader.Validate("Bill-to Contact", Contact.Name);
        end;
        //SalesHeader.Validate("Sell-to Contact", LIFTSalesOrderBuffer."Sell-to Contact");
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
        SalesLine.SuspendStatusCheck(true);
        SalesLine.Validate("Sell-to Customer No.", LIFTSalesLineBuffer."Sell-to Customer No.");
        //SalesLine.Validate(Type, SalesLine.Type::Item);
        IF LIFTSalesLineBuffer.Type = LIFTSalesLineBuffer.Type::Comment then begin
            SalesLine.Validate(Type, SalesLine.Type::" ");
            if ItemRecLcl.get(LIFTSalesLineBuffer."No.") then begin
                SalesLine.Description := ItemRecLcl.Description;
                SalesLine."Description 2" := ItemRecLcl."Description 2";
            end;
        end else begin
            SalesLine.Validate(Type, SalesLine.Type::Item);
            SalesLine.Validate("No.", LIFTSalesLineBuffer."No.");
            //SalesLine.Validate("Location Code", LIFTSalesLineBuffer."Location Code");

            SalesLine.Validate(Quantity, LIFTSalesLineBuffer.Quantity);
            //SalesLine.Validate("Shortcut Dimension 1 Code", LIFTSalesLineBuffer."Shortcut Dimension 1 Code");
            SalesLine.Validate("Shortcut Dimension 2 Code", LIFTSalesLineBuffer."Shortcut Dimension 2 Code");
            SalesLine.Validate("Variant Code", LIFTSalesLineBuffer."Variant Code");
            SalesLine.Validate("Unit of Measure Code", LIFTSalesLineBuffer."Unit of Measure Code");
            SalesLine.Validate("Requested Delivery Date", LIFTSalesLineBuffer."Requested Delivery Date");
            SalesLine.Validate("Promised Delivery Date", LIFTSalesLineBuffer."Promised Delivery Date");
            SalesLine.Validate("Planned Delivery Date", LIFTSalesLineBuffer."Planned Delivery Date");
            SalesLine.Validate("Planned Shipment Date", LIFTSalesLineBuffer."Planned Shipment Date");
            SalesLine.Validate("Shipment Date", LIFTSalesLineBuffer."Shipment Date");
            SalesLine.Validate(Width, LIFTSalesLineBuffer.Width);
            SalesLine.Validate(Height, LIFTSalesLineBuffer.Height);
            SalesLine.Validate("Hardware Price", LIFTSalesLineBuffer."Hardware Price");
            SalesLine.Validate("Graphics Price", LIFTSalesLineBuffer."Graphics Price");
            //SalesLine.Validate("Line Discount %", LIFTSalesLineBuffer."Line Discount %");
            //Calculate "Discount Grp Code Discount" on Net Jnit Price coming from LIFT start
            SalesLine.Validate("Unit Price", LIFTSalesLineBuffer."Unit Price");
            BCOriginalDiscount := SalesLine."Line Discount Amount";
            //Calculate "Discount Grp Code Discount" on Net Jnit Price coming from LIFT End
            SalesLine.Validate("Unit Price", LIFTSalesLineBuffer."Original Unit Price");
            //SalesLine.Validate("Line Discount Amount", LIFTSalesLineBuffer."Line Discount Amount");
            //BCLineDiscount := SalesLine."Line Discount Amount";
            SalesLine.Validate("ORB LIFT Discount Amount", LIFTSalesLineBuffer."Line Discount Amount");
            //SalesLine.Validate("Line Discount Amount", (BCLineDiscount + SalesLine."ORB LIFT Discount Amount"));
            SalesLine.Validate("Line Discount Amount", (BCOriginalDiscount + SalesLine."ORB LIFT Discount Amount"));
            SalesLine."ORB LIFT Line ID" := LIFTSalesLineBuffer."LIFT Line ID";
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

    local procedure ReleaseSalesOrder(var SalesHeader: Record "Sales Header")
    var
        ReleaseSalesDocument: Codeunit "Release Sales Document";
    begin
        ReleaseSalesDocument.PerformManualRelease(SalesHeader);
        //SalesHeader.PerformManualRelease(SalesHeader);
    end;

    local procedure ClearDSPaymentDetails(var DShipPackOptions: Record "DSHIP Package Options")
    begin
        DShipPackOptions.Validate("Payment Account No.", '');
        DShipPackOptions.Validate("Payment Postal Code", '');
        DShipPackOptions.Validate("Payment Province", '');
        DShipPackOptions.Validate("Payment Country Code", '');
    end;

    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        BCLineDiscount: Decimal;
        BCOriginalDiscount: Decimal;
        ArchiveManagement: Codeunit ArchiveManagement;
        LineNo: Integer;
        OrderStatusReopen: Boolean;
}