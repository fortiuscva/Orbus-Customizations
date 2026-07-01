codeunit 53422 "ORB Case Management"
{
    procedure PropagateOnCaseCardInsert(var ORBCaseBuffer: Record "ORB Case Buffer")
    var
        CaseSetupWSG: Record "Case Setup WSG";
        NoSeries: Codeunit "No. Series";
    begin
        if not CaseWSG.Get(ORBCaseBuffer."Case No.") then begin
            CaseSetupWSG.Get();
            CaseSetupWSG.TestField("Case Nos.");
            CaseWSG.Init();
            CaseWSG."No." := NoSeries.GetNextNo(CaseSetupWSG."Case Nos.", WorkDate(), false);
            CaseWSG.Insert(true);
            UpdateCaseCard(ORBCaseBuffer);
            UpdateCaseNumberinCaseBuffer(CaseWSG, ORBCaseBuffer);
        end else
            UpdateCaseCard(ORBCaseBuffer);
    end;

    procedure PropagateOnCaseCardModify(var ORBCaseBuffer: Record "ORB Case Buffer")
    begin
        if CaseWSG.Get(ORBCaseBuffer."Case No.") then
            UpdateCaseCard(ORBCaseBuffer);
    end;

    procedure UpdateCaseCard(var ORBCaseBuffer: Record "ORB Case Buffer")
    begin
        ValidateCaseCardFields(CaseWSG, ORBCaseBuffer);
        CaseWSG.Modify(true);
    end;

    procedure ValidateCaseCardFields(var CaseWSG: Record "Case WSG"; var ORBCaseBuffer: Record "ORB Case Buffer")
    begin
        if CaseWSG."Lookup Type" <> ORBCaseBuffer."Document Type" then
            CaseWSG.Validate("Lookup Type", ORBCaseBuffer."Document Type");

        if ORBCaseBuffer."Document Type" = ORBCaseBuffer."Document Type"::"Posted Sales Invoice" then begin
            CaseWSG.Validate("Sales Invoice Header No.", ORBCaseBuffer."Document No.");
            PropagateFieldValuesFromSalesInvoiceHeader(CaseWSG, ORBCaseBuffer);
        end
        else if ORBCaseBuffer."Document Type" = ORBCaseBuffer."Document Type"::"Sales Order" then begin
            CaseWSG.Validate("Sales Header No.", ORBCaseBuffer."Document No.");
            PropagateFieldValuesFromSalesHeader(CaseWSG, ORBCaseBuffer);
        end;

        CaseWSG.Validate("Entity Type", ORBCaseBuffer."Entity Type"::Customer);

        if ((ORBCaseBuffer."Entity No." <> '') and (CaseWSG."Entity No." <> ORBCaseBuffer."Entity No.")) then
            CaseWSG.Validate("Entity No.", ORBCaseBuffer."Entity No.");

        if ((ORBCaseBuffer."Entity Name" <> '') and (CaseWSG."Entity Name" <> ORBCaseBuffer."Entity Name")) then
            CaseWSG.Validate("Entity Name", ORBCaseBuffer."Entity Name");

        if ((ORBCaseBuffer."Contact Name" <> '') and (CaseWSG."Contact Name" <> ORBCaseBuffer."Contact Name")) then
            CaseWSG.Validate("Contact Name", ORBCaseBuffer."Contact Name");

        if ((ORBCaseBuffer."Contact Email" <> '') and (CaseWSG."Contact Email 2" <> ORBCaseBuffer."Contact Email")) then
            CaseWSG.Validate("Contact Email 2", ORBCaseBuffer."Contact Email");

        if ((ORBCaseBuffer."Contact Phone" <> '') and (CaseWSG."Contact Phone" <> ORBCaseBuffer."Contact Phone")) then
            CaseWSG.Validate("Contact Phone", ORBCaseBuffer."Contact Phone");

        if ((ORBCaseBuffer."External Document No." <> '') and (CaseWSG."External Doc No." <> ORBCaseBuffer."External Document No.")) then
            CaseWSG.Validate("External Doc No.", ORBCaseBuffer."External Document No.");

        if ((ORBCaseBuffer."Location Code" <> '') and (CaseWSG."Location Code" <> ORBCaseBuffer."Location Code")) then
            CaseWSG.Validate("Location Code", ORBCaseBuffer."Location Code");

        if ((ORBCaseBuffer."Salesperson Code" <> '') and (CaseWSG."SalesPerson Code" <> ORBCaseBuffer."Salesperson Code")) then
            CaseWSG.Validate("SalesPerson Code", ORBCaseBuffer."Salesperson Code");

        if ((ORBCaseBuffer."Customer Complaint" <> '') and (CaseWSG."Customer Complaint" <> ORBCaseBuffer."Customer Complaint")) then
            CaseWSG.Validate("Customer Complaint", ORBCaseBuffer."Customer Complaint");

        if ((ORBCaseBuffer."Customer Expectation" <> '') and (CaseWSG."Customer Expectation" <> ORBCaseBuffer."Customer Expectation")) then
            CaseWSG.Validate("Customer Expectation", ORBCaseBuffer."Customer Expectation");

        if ((ORBCaseBuffer."Describe Issue" <> '') and (CaseWSG."Describe Issue" <> ORBCaseBuffer."Describe Issue")) then
            CaseWSG.Validate("Describe Issue", ORBCaseBuffer."Describe Issue");

        if ORBCaseBuffer.Link <> '' then
            CaseWSG.AddLink(ORBCaseBuffer.Link, Format(ORBCaseBuffer."Document Type") + ' ' + ORBCaseBuffer."Document No." + ' ' + 'URL');

        if ((ORBCaseBuffer."Must Arrive Date" <> 0D) and (CaseWSG."Must Arrive Date" <> ORBCaseBuffer."Must Arrive Date")) then
            CaseWSG.Validate("Must Arrive Date", ORBCaseBuffer."Must Arrive Date");

        if ((ORBCaseBuffer."Ship-to Name" <> '') and (CaseWSG."Ship To Name" <> ORBCaseBuffer."Ship-to Name")) then
            CaseWSG.Validate("Ship To Name", ORBCaseBuffer."Ship-to Name");

        if ((ORBCaseBuffer."Ship-to Contact" <> '') and (CaseWSG."Ship To Contact" <> ORBCaseBuffer."Ship-to Contact")) then
            CaseWSG.Validate("Ship To Contact", ORBCaseBuffer."Ship-to Contact");

        if ((ORBCaseBuffer."Ship-to Address" <> '') and (CaseWSG."Ship To Address" <> ORBCaseBuffer."Ship-to Address")) then
            CaseWSG.Validate("Ship To Address", ORBCaseBuffer."Ship-to Address");

        if ((ORBCaseBuffer."Ship-to Address 2" <> '') and (CaseWSG."Ship To Address 2" <> ORBCaseBuffer."Ship-to Address 2")) then
            CaseWSG.Validate("Ship To Address 2", ORBCaseBuffer."Ship-to Address 2");

        if ((ORBCaseBuffer.City <> '') and (CaseWSG.City <> ORBCaseBuffer.City)) then
            CaseWSG.Validate(City, ORBCaseBuffer.City);

        if ((ORBCaseBuffer.State <> '') and (CaseWSG.State <> ORBCaseBuffer.State)) then
            CaseWSG.Validate(State, ORBCaseBuffer.State);

        if ((ORBCaseBuffer."Post Code" <> '') and (CaseWSG."Post Code" <> ORBCaseBuffer."Post Code")) then
            CaseWSG.Validate("Post Code", ORBCaseBuffer."Post Code");

        if ((ORBCaseBuffer."Magento Result ID" <> '') and (CaseWSG."ORB Magento Result ID" <> ORBCaseBuffer."Magento Result ID")) then
            CaseWSG.Validate("ORB Magento Result ID", ORBCaseBuffer."Magento Result ID");
    end;

    procedure UpdateCaseNumberinCaseBuffer(var CaseWSG: Record "Case WSG"; var ORBCaseBuffer: Record "ORB Case Buffer")
    begin
        ORBCaseBuffer."Case No." := CaseWSG."No.";
    end;

    procedure PropagateFieldValuesFromSalesInvoiceHeader(var CaseWSG: Record "Case WSG"; var ORBCaseBuffer: Record "ORB Case Buffer")
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
    begin
        SalesInvoiceHeader.Reset();
        SalesInvoiceHeader.SetRange("No.", ORBCaseBuffer."Document No.");
        if SalesInvoiceHeader.FindFirst() then begin
            CaseWSG.Validate("Sales Header No.", SalesInvoiceHeader."Order No.");
            CaseWSG.Validate("Location Code", SalesInvoiceHeader."Location Code");
            CaseWSG.Validate("SalesPerson Code", SalesInvoiceHeader."Salesperson Code");
            CaseWSG.Validate("Entity No.", SalesInvoiceHeader."Sell-to Customer No.");
            CaseWSG.Validate("Entity Name", SalesInvoiceHeader."Sell-to Customer Name");
            CaseWSG.Validate("Contact Name", SalesInvoiceHeader."Sell-to Contact");
            CaseWSG.Validate("Contact Phone", SalesInvoiceHeader."Sell-to Phone No.");
            CaseWSG.Validate("Contact Email 2", SalesInvoiceHeader."Sell-to E-Mail");
            CaseWSG.Validate("Ship To Name", SalesInvoiceHeader."Ship-to Name");
            CaseWSG.Validate("Ship To Address", SalesInvoiceHeader."Ship-to Address");
            CaseWSG.Validate("Ship To Address 2", SalesInvoiceHeader."Ship-to Address 2");
            CaseWSG.Validate("Ship To Contact", SalesInvoiceHeader."Ship-to Contact");
            CaseWSG.Validate(City, SalesInvoiceHeader."Ship-to City");
            CaseWSG.Validate("Post Code", SalesInvoiceHeader."Ship-to Post Code");
            CaseWSG.Validate("External Doc No.", SalesInvoiceHeader."External Document No.");
            CaseWSG.Validate("Shipment Date", SalesInvoiceHeader."Shipment Date");
            CaseWSG.Validate(State, SalesInvoiceHeader."Ship-to County");
        end;
    end;

    procedure PropagateFieldValuesFromSalesHeader(var CaseWSG: Record "Case WSG"; var ORBCaseBuffer: Record "ORB Case Buffer")
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.Reset();
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        SalesHeader.SetRange("No.", ORBCaseBuffer."Document No.");
        if SalesHeader.FindFirst() then begin
            CaseWSG.Validate("Location Code", SalesHeader."Location Code");
            CaseWSG.Validate("Entity No.", SalesHeader."Sell-to Customer No.");
            CaseWSG.Validate("Entity Name", SalesHeader."Sell-to Customer Name");
            CaseWSG.Validate("Contact Name", SalesHeader."Sell-to Contact");
            CaseWSG.Validate("Contact Phone", SalesHeader."Sell-to Phone No.");
            CaseWSG.Validate("SalesPerson Code", SalesHeader."Salesperson Code");
            CaseWSG.Validate("Ship To Name", SalesHeader."Ship-to Name");
            CaseWSG.Validate("Ship To Address", SalesHeader."Ship-to Address");
            CaseWSG.Validate("Ship To Address 2", SalesHeader."Ship-to Address 2");
            CaseWSG.Validate("Ship To Contact", SalesHeader."Ship-to Contact");
            CaseWSG.Validate(City, SalesHeader."Ship-to City");
            CaseWSG.Validate("Post Code", SalesHeader."Ship-To Post Code");
            CaseWSG.Validate("External Doc No.", SalesHeader."External Document No.");
            CaseWSG.Validate("Shipment Date", SalesHeader."Shipment Date");
            CaseWSG.Validate(State, SalesHeader."Ship-To County");
        end;
    end;

    var
        CaseWSG: Record "Case WSG";
}
