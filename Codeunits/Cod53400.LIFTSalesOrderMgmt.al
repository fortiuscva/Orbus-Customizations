codeunit 53400 "ORB LIFT Sales Order Mgmt"
{
    procedure PropagateOnSalesHeaderInsert(var LIFTSalesOrderBuffer: Record "ORB LIFT Sales Order Buffer")
    begin
        if not SalesHeader.Get(LIFTSalesOrderBuffer."Document Type", LIFTSalesOrderBuffer."No.") then begin
            SalesHeader.Init();
            SalesHeader.Validate("Document Type", LIFTSalesOrderBuffer."Document Type");
            SalesHeader.Validate("No.", LIFTSalesOrderBuffer."No.");
            SalesHeader.Insert();
        end;

        UpdateSalesHeader(LIFTSalesOrderBuffer, true);
    end;

    procedure PropagateOnSalesHeaderModify(var LIFTSalesOrderBuffer: Record "ORB LIFT Sales Order Buffer")
    begin
        if SalesHeader.Get(LIFTSalesOrderBuffer."Document Type", LIFTSalesOrderBuffer."No.") then begin
            ArchiveManagement.ArchiveSalesDocument(SalesHeader);
            UpdateSalesHeader(LIFTSalesOrderBuffer, false);
        end;
    end;

    local procedure UpdateSalesHeader(var LIFTSalesOrderBuffer: Record "ORB LIFT Sales Order Buffer"; CreateSO: Boolean)
    begin
        ValidateSalesHeaderFields(SalesHeader, LIFTSalesOrderBuffer, CreateSO);
        SalesHeader.Modify();
    end;

    procedure ValidateSalesHeaderFields(var SalesHeader: Record "Sales Header"; var LIFTSalesOrderBuffer: Record "ORB LIFT Sales Order Buffer"; CreateSO: Boolean)
    begin
        SalesHeader.Validate("Sell-to Customer No.", LIFTSalesOrderBuffer."Sell-to Customer No.");
        SalesHeader.Validate("Bill-to Customer No.", LIFTSalesOrderBuffer."Bill-to Customer No.");
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
        SalesHeader.Validate("Payment Terms Code", LIFTSalesOrderBuffer."Payment Terms Code");
        SalesHeader.Validate("Due Date", LIFTSalesOrderBuffer."Due Date");
        SalesHeader.Validate("Shipment Method Code", LIFTSalesOrderBuffer."Shipment Method Code");
        SalesHeader.Validate("Location Code", LIFTSalesOrderBuffer."Location Code");
        SalesHeader.Validate("Shortcut Dimension 1 Code", LIFTSalesOrderBuffer."Shortcut Dimension 1 Code");
        SalesHeader.Validate("Shortcut Dimension 2 Code", LIFTSalesOrderBuffer."Shortcut Dimension 2 Code");
        SalesHeader.Validate("Customer Price Group", LIFTSalesOrderBuffer."Customer Price Group");
        SalesHeader.Validate("Salesperson Code", LIFTSalesOrderBuffer."Salesperson Code");
        SalesHeader.Validate("Sell-to Contact", LIFTSalesOrderBuffer."Sell-to Contact");
        SalesHeader.Validate("Ship-to Post Code", LIFTSalesOrderBuffer."Ship-to Post Code");
        SalesHeader.Validate("Ship-to County", LIFTSalesOrderBuffer."Ship-to County");
        SalesHeader.Validate("Ship-to Country/Region Code", LIFTSalesOrderBuffer."Ship-to Country/Region Code");
        SalesHeader.Validate("Document Date", LIFTSalesOrderBuffer."Document Date");
        SalesHeader.Validate("External Document No.", LIFTSalesOrderBuffer."External Document No.");
        SalesHeader.Validate("Payment Method Code", LIFTSalesOrderBuffer."Payment Method Code");
        SalesHeader.Validate("Shipping Agent Code", LIFTSalesOrderBuffer."Shipping Agent Code");
        SalesHeader.SetWorkDescription(LIFTSalesOrderBuffer."Work Description");
        SalesHeader.Validate("Sell-to Contact No.", LIFTSalesOrderBuffer."Sell-to Contact No.");
        //SalesHeader.Validate("Shipping Advice", LIFTSalesOrderBuffer."Shipping Advice");
        SalesHeader.Validate("Shipping Agent Service Code", LIFTSalesOrderBuffer."Shipping Agent Service Code");
        if CreateSO then
            SalesHeader.Validate("Order Status", LIFTSalesOrderBuffer."Order Status");
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
    end;

    procedure PropagateOnSalesLineInsert(var LIFTSalesLineBuffer: Record "ORB LIFT Sales Line Buffer")
    var
        LineNo: Integer;
    begin
        SalesLine.SetRange("Document Type", LIFTSalesLineBuffer."Document Type"::Order);
        SalesLine.SetRange("Document No.", LIFTSalesLineBuffer."Document No.");
        if SalesLine.FindLast() then
            LineNo := SalesLine."Line No." + 10000
        else
            LineNo := 10000;

        if not SalesLine.Get(LIFTSalesLineBuffer."Document Type", LIFTSalesLineBuffer."Document No.", LineNo) then begin
            SalesLine.Init();
            SalesLine.Validate("Document Type", LIFTSalesLineBuffer."Document Type");
            SalesLine.Validate("Document No.", LIFTSalesLineBuffer."Document No.");
            SalesLine.Validate("Line No.", LineNo);
            SalesLine.Insert();
        end;

        UpdateSalesLine(LIFTSalesLineBuffer);
    end;

    procedure PropagateOnSalesLineModify(var LIFTSalesLineBuffer: Record "ORB LIFT Sales Line Buffer")
    begin
        if SalesLine.Get(LIFTSalesLineBuffer."Document Type", LIFTSalesLineBuffer."Document No.", LIFTSalesLineBuffer."Line No.") then begin
            if SalesHeader.Get(LIFTSalesLineBuffer."Document Type", LIFTSalesLineBuffer."Document No.") then begin
                ArchiveManagement.ArchiveSalesDocument(SalesHeader);
                UpdateSalesLine(LIFTSalesLineBuffer);
            end;
        end;
    end;

    local procedure UpdateSalesLine(var LIFTSalesLineBuffer: Record "ORB LIFT Sales Line Buffer")
    begin
        ValidateSalesLineFields(SalesLine, LIFTSalesLineBuffer);
        SalesLine.Modify();
    end;

    procedure ValidateSalesLineFields(var SalesLine: Record "Sales Line"; var LIFTSalesLineBuffer: Record "ORB LIFT Sales Line Buffer")
    begin
        SalesLine.Validate("Sell-to Customer No.", LIFTSalesLineBuffer."Sell-to Customer No.");
        if LIFTSalesLineBuffer.Type = LIFTSalesLineBuffer.Type::Comment then
            SalesLine.Validate(Type, SalesLine.Type::" ")
        else
            SalesLine.Validate(Type, LIFTSalesLineBuffer.Type);
        SalesLine.Validate("No.", LIFTSalesLineBuffer."No.");
        SalesLine.Validate("Location Code", LIFTSalesLineBuffer."Location Code");
        SalesLine.Validate("Shipment Date", LIFTSalesLineBuffer."Shipment Date");
        SalesLine.Validate(Quantity, LIFTSalesLineBuffer.Quantity);
        SalesLine.Validate("Unit Price", LIFTSalesLineBuffer."Unit Price");
        SalesLine.Validate("Line Discount %", LIFTSalesLineBuffer."Line Discount %");
        SalesLine.Validate("Line Discount Amount", LIFTSalesLineBuffer."Line Discount Amount");
        SalesLine.Validate("Shortcut Dimension 1 Code", LIFTSalesLineBuffer."Shortcut Dimension 1 Code");
        SalesLine.Validate("Shortcut Dimension 2 Code", LIFTSalesLineBuffer."Shortcut Dimension 2 Code");
        SalesLine.Validate("Variant Code", LIFTSalesLineBuffer."Variant Code");
        SalesLine.Validate("Unit of Measure Code", LIFTSalesLineBuffer."Unit of Measure Code");
        SalesLine.Validate("Requested Delivery Date", LIFTSalesLineBuffer."Requested Delivery Date");
        SalesLine.Validate("Promised Delivery Date", LIFTSalesLineBuffer."Promised Delivery Date");
        SalesLine.Validate("Planned Delivery Date", LIFTSalesLineBuffer."Planned Delivery Date");
        SalesLine.Validate("Planned Shipment Date", LIFTSalesLineBuffer."Planned Shipment Date");
        SalesLine.Validate(Width, LIFTSalesLineBuffer.Width);
        SalesLine.Validate(Height, LIFTSalesLineBuffer.Height);
        SalesLine.Validate("Hardware Price", LIFTSalesLineBuffer."Hardware Price");
        SalesLine.Validate("Graphics Price", LIFTSalesLineBuffer."Graphics Price");
    end;

    procedure PropagateOnSalesLineDelete(LIFTSalesLineBuffer: Record "ORB LIFT Sales Line Buffer")
    begin
        if SalesLine.Get(LIFTSalesLineBuffer."Document Type", LIFTSalesLineBuffer."Document No.", LIFTSalesLineBuffer."Line No.") then begin
            if SalesHeader.Get(LIFTSalesLineBuffer."Document Type", LIFTSalesLineBuffer."Document No.") then begin
                ArchiveManagement.ArchiveSalesDocument(SalesHeader);
                SalesLine.Delete();
            end;
        end;
    end;

    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        ArchiveManagement: Codeunit ArchiveManagement;
        LineNo: Integer;
}