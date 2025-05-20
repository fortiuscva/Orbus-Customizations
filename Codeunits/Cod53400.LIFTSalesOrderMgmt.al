codeunit 53400 "ORB LIFT Sales Order Mgmt"
{
    procedure PropagateOnSalesHeaderInsert(LIFTSalesOrderBuffer: Record "ORB LIFT Sales Order Buffer")
    var
        SalesHeader: Record "Sales Header";
    begin
        if not SalesHeader.Get(LIFTSalesOrderBuffer."Document Type", LIFTSalesOrderBuffer."No.") then begin
            SalesHeader.Init();
            SalesHeader."Document Type" := LIFTSalesOrderBuffer."Document Type";
            SalesHeader."No." := LIFTSalesOrderBuffer."No.";
            SalesHeader.Insert();
        end
    end;

    procedure PropagateOnSalesHeaderModify(LIFTSalesOrderBuffer: Record "ORB LIFT Sales Order Buffer")
    var
        SalesHeader: Record "Sales Header";
    begin
        if SalesHeader.Get(LIFTSalesOrderBuffer."Document Type", LIFTSalesOrderBuffer."No.") then begin
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
            SalesHeader.Validate("Work Description", LIFTSalesOrderBuffer."Work Description");
            SalesHeader.Validate("Sell-to Contact No.", LIFTSalesOrderBuffer."Sell-To Contact No.");
            SalesHeader.Validate("Shipping Advice", LIFTSalesOrderBuffer."Shipping Advice");
            SalesHeader.Validate("Shipping Agent Service Code", LIFTSalesOrderBuffer."Shipping Agent Service Code");
            SalesHeader.Validate("Order Status", LIFTSalesOrderBuffer."Order Status");
            SalesHeader.Validate("Location Override", LIFTSalesOrderBuffer."Location Override");
            SalesHeader.Validate(Created_By, LIFTSalesOrderBuffer.Created_By);
            SalesHeader.Validate(Rush, LIFTSalesOrderBuffer.Rush);
            SalesHeader.Validate("ORB Declared Value", LIFTSalesOrderBuffer."ORB Declared Value");
            SalesHeader.Validate("ORB International Contact", LIFTSalesOrderBuffer."ORB International Contact");
            SalesHeader.Validate("ORB Magento Order #", LIFTSalesOrderBuffer."ORB Magento Order #");
            SalesHeader.Validate("ORB Magento CC 4 Digits", LIFTSalesOrderBuffer."ORB Magento CC 4 Digits");
            SalesHeader.Validate("Sales Order Payment Type", LIFTSalesOrderBuffer."Sales Order Payment Type");
            SalesHeader.Validate("SO Payment Account No.", LIFTSalesOrderBuffer."SO Payment Account No.");
            SalesHeader.Validate("In-Hands Date", LIFTSalesOrderBuffer."In-Hands Date");
            SalesHeader.Validate("Created At", LIFTSalesOrderBuffer."Created At");
            SalesHeader.Modify();
        end;
    end;

    procedure PropagateOnSalesLineInsert(LIFTSalesLineBuffer: Record "ORB LIFT Sales Line Buffer")
    var
        SalesLine: Record "Sales Line";
    begin
        if not SalesLine.Get(LIFTSalesLineBuffer."Document Type", LIFTSalesLineBuffer."Document No.", LIFTSalesLineBuffer."Line No.") then begin
            SalesLine.Init();
            SalesLine."Document Type" := LIFTSalesLineBuffer."Document Type";
            SalesLine."Document No." := LIFTSalesLineBuffer."Document No.";
            SalesLine."Line No." := LIFTSalesLineBuffer."Line No.";
            SalesLine.Insert();
        end;
    end;

    procedure PropagateOnSalesLineModify(LIFTSalesLineBuffer: Record "ORB LIFT Sales Line Buffer")
    var
        SalesLine: Record "Sales Line";
    begin
        if SalesLine.Get(LIFTSalesLineBuffer."Document Type", LIFTSalesLineBuffer."Document No.", LIFTSalesLineBuffer."Line No.") then begin
            SalesLine.Validate("Sell-to Customer No.", LIFTSalesLineBuffer."Sell-to Customer No.");
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
            SalesLine.Modify();
        end;
    end;

    procedure PropagateOnSalesLineDelete(LIFTSalesLineBuffer: Record "ORB LIFT Sales Line Buffer")
    var
        SalesLine: Record "Sales Line";
    begin
        if SalesLine.Get(LIFTSalesLineBuffer."Document Type", LIFTSalesLineBuffer."Document No.", LIFTSalesLineBuffer."Line No.") then
            SalesLine.Delete();
    end;
}
