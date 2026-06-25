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
            CreateRelatedorSourceRecord(Database::"Sales Invoice Header", ORBCaseBuffer."Document No.");
            CaseWSG.Validate("Source Table Id", Database::"Sales Invoice Header");
            CaseWSG.Validate("Source Page Id", Page::"Posted Sales Invoice");
            CaseWSG.Validate("Source No.", ORBCaseBuffer."Document No.");
        end
        else if ORBCaseBuffer."Document Type" = ORBCaseBuffer."Document Type"::"Sales Order" then begin
            CaseWSG.Validate("Sales Header No.", ORBCaseBuffer."Document No.");
            PropagateFieldValuesFromSalesHeader(CaseWSG, ORBCaseBuffer);
            CreateRelatedorSourceRecord(Database::"Sales Header", ORBCaseBuffer."Document No.");
            CaseWSG.Validate("Source Table Id", Database::"Sales Header");
            CaseWSG.Validate("Source Page Id", Page::"Sales Order");
            CaseWSG.Validate("Source No.", ORBCaseBuffer."Document No.");
        end;

        if (CaseWSG."Entity Type" <> CaseWSG."Entity Type"::Customer) then
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

        if (CaseWSG.Status <> ORBCaseBuffer.Status) then
            CaseWSG.Validate(Status, ORBCaseBuffer.Status);

        if ((ORBCaseBuffer."Customer Complaint" <> '') and (CaseWSG."Customer Complaint" <> ORBCaseBuffer."Customer Complaint")) then
            CaseWSG.Validate("Customer Complaint", ORBCaseBuffer."Customer Complaint");

        if ((ORBCaseBuffer."Customer Expectation" <> '') and (CaseWSG."Customer Expectation" <> ORBCaseBuffer."Customer Expectation")) then
            CaseWSG.Validate("Customer Expectation", ORBCaseBuffer."Customer Expectation");

        if ((ORBCaseBuffer."Describe Issue" <> '') and (CaseWSG."Describe Issue" <> ORBCaseBuffer."Describe Issue")) then
            CaseWSG.Validate("Describe Issue", ORBCaseBuffer."Describe Issue");

        if ORBCaseBuffer.Link <> '' then
            CaseWSG.AddLink(ORBCaseBuffer.Link, ORBCaseBuffer.Description);

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
            CreateRelatedorSourceRecord(Database::Customer, SalesInvoiceHeader."Sell-to Customer No.");
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
            CreateRelatedorSourceRecord(Database::Customer, SalesHeader."Sell-to Customer No.");
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

    procedure CreateRelatedorSourceRecord(TableID: Integer; Number: Code[20])
    var
        Customer: Record Customer;
        SalesHeader: Record "Sales Header";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        RelatedRecordWSG: Record "Related Record WSG";
    begin
        if TableID = Database::Customer then begin
            Customer.Reset();
            if Customer.Get(Number) then begin
                RelatedRecordWSG.Reset();
                if not RelatedRecordWSG.Get(CaseWSG."No.", Database::Customer, Customer.SystemId) then begin
                    RelatedRecordWSG.Init();
                    RelatedRecordWSG."Case No." := CaseWSG."No.";
                    RelatedRecordWSG."Table Id" := Database::Customer;
                    RelatedRecordWSG."Related SystemId" := Customer.SystemId;
                    RelatedRecordWSG.Insert(true);
                    RelatedRecordWSG.Validate("Case Relation", RelatedRecordWSG."Case Relation"::Related);
                    RelatedRecordWSG.Validate("Document Page Id", Page::"Customer Card");
                    RelatedRecordWSG.Validate("Document No.", Customer."No.");
                    RelatedRecordWSG.Validate("Document Type", RelatedRecordWSG."Document Type"::None);
                    RelatedRecordWSG.Modify(true);
                end;
            end;
        end
        else if TableID = Database::"Sales Invoice Header" then begin
            SalesInvoiceHeader.Reset();
            if SalesInvoiceHeader.Get(Number) then begin
                RelatedRecordWSG.Reset();
                if not RelatedRecordWSG.Get(CaseWSG."No.", Database::"Sales Invoice Header", SalesInvoiceHeader.SystemId) then begin
                    RelatedRecordWSG.Init();
                    RelatedRecordWSG."Case No." := CaseWSG."No.";
                    RelatedRecordWSG."Table Id" := Database::"Sales Invoice Header";
                    RelatedRecordWSG."Related SystemId" := SalesInvoiceHeader.SystemId;
                    RelatedRecordWSG.Insert(true);
                    RelatedRecordWSG.Validate("Case Relation", RelatedRecordWSG."Case Relation"::Source);
                    RelatedRecordWSG.Validate("Document Page Id", Page::"Posted Sales Invoice");
                    RelatedRecordWSG.Validate("Document No.", SalesInvoiceHeader."No.");
                    RelatedRecordWSG.Validate("Document Type", RelatedRecordWSG."Document Type"::Posted);
                    RelatedRecordWSG.Modify(true);
                end;
            end;
        end
        else if TableID = Database::"Sales Header" then begin
            SalesHeader.Reset();
            if SalesHeader.Get(SalesHeader."Document Type"::Order, Number) then begin
                RelatedRecordWSG.Reset();
                if not RelatedRecordWSG.Get(CaseWSG."No.", Database::"Sales Header", SalesHeader.SystemId) then begin
                    RelatedRecordWSG.Init();
                    RelatedRecordWSG."Case No." := CaseWSG."No.";
                    RelatedRecordWSG."Table Id" := Database::"Sales Header";
                    RelatedRecordWSG."Related SystemId" := SalesHeader.SystemId;
                    RelatedRecordWSG.Insert(true);
                    RelatedRecordWSG.Validate("Case Relation", RelatedRecordWSG."Case Relation"::Source);
                    RelatedRecordWSG.Validate("Document Page Id", Page::"Sales Order");
                    RelatedRecordWSG.Validate("Document No.", SalesHeader."No.");
                    RelatedRecordWSG.Validate("Document Type", RelatedRecordWSG."Document Type"::Document);
                    RelatedRecordWSG.Modify(true);
                end;
            end;
        end;
    end;

    procedure CreateRelatedReplacementOrder(CaseNo: Code[20]; SONumber: Code[20])
    var
        RelatedRec: Record "Related Record WSG";
        SOHeader: Record "Sales Header";
    begin
        SOHeader.Reset();
        if SOHeader.Get(SOHeader."Document Type"::Order, SONumber) then begin
            RelatedRec.Reset();
            if not RelatedRec.Get(CaseWSG."No.", Database::"Sales Header", SOHeader.SystemId) then begin
                RelatedRec.Init();
                RelatedRec."Case No." := CaseNo;
                RelatedRec."Table Id" := Database::"Sales Header";
                RelatedRec."Related SystemId" := SOHeader.SystemId;
                RelatedRec.Insert(true);
                RelatedRec.Validate("Case Relation", RelatedRec."Case Relation"::Related);
                RelatedRec.Validate("Document Page Id", Page::"Sales Order");
                RelatedRec.Validate("Document No.", SOHeader."No.");
                RelatedRec.Validate("Document Type", RelatedRec."Document Type"::Document);
                RelatedRec.Modify(true);
            end;
        end;

    end;

    var
        CaseWSG: Record "Case WSG";
}
