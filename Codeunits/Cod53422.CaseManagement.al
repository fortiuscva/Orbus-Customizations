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
        end else
            UpdateCaseCard(ORBCaseBuffer);
    end;

    procedure PropagateOnCaseCardModify(var ORBCaseBuffer: Record "ORB Case Buffer")
    begin

    end;

    procedure UpdateCaseCard(var ORBCaseBuffer: Record "ORB Case Buffer")
    begin
        ValidateCaseCardFields(CaseWSG, ORBCaseBuffer);
        CaseWSG.Modify(true);
    end;

    procedure ValidateCaseCardFields(var CaseWSG: Record "Case WSG"; var ORBCaseBuffer: Record "ORB Case Buffer")
    begin
        CaseWSG.Validate("Lookup Type", ORBCaseBuffer."Document Type");
        if ORBCaseBuffer."Document Type" = ORBCaseBuffer."Document Type"::"Posted Sales Invoice" then
            CaseWSG.Validate("Sales Invoice Header No.", ORBCaseBuffer."Document No.")
        else if ORBCaseBuffer."Document Type" = ORBCaseBuffer."Document Type"::"Sales Order" then
            CaseWSG.Validate("Sales Header No.", ORBCaseBuffer."Document No.");
        CaseWSG.Validate("Entity Type", ORBCaseBuffer."Entity Type");
        CaseWSG.Validate("Entity No.", ORBCaseBuffer."Entity No.");
        CaseWSG.Validate("Entity Name", ORBCaseBuffer."Entity Name");
        CaseWSG.Validate("Contact Name", ORBCaseBuffer."Contact Name");
        CaseWSG.Validate("External Doc No.", ORBCaseBuffer."External Document No.");
        CaseWSG.Validate("Location Code", ORBCaseBuffer."Location Code");
        CaseWSG.Validate("SalesPerson Code", ORBCaseBuffer."Salesperson Code");
        CaseWSG.Validate("Customer Complaint", ORBCaseBuffer."Customer Complaint");
        CaseWSG.Validate("Customer Expectation", ORBCaseBuffer."Customer Expectation");
        CaseWSG.Validate("Must Arrive Date", ORBCaseBuffer."Must Arrive Date");
    end;

    var
        CaseWSG: Record "Case WSG";
}
