codeunit 53422 "ORB Case Management"
{
    procedure PropagateOnCaseCardInsert(var ORBCaseBuffer: Record "ORB Case Buffer")
    var
        CaseSetupWSG: Record "Case Setup WSG";
        NoSeries: Codeunit "No. Series";
    begin
        CaseSetupWSG.Get();
        CaseSetupWSG.TestField("Case Nos.");
        CaseWSG.Init();
        CaseWSG."No." := NoSeries.GetNextNo(CaseSetupWSG."Case Nos.", WorkDate(), false);
        CaseWSG.Insert(true);

    end;

    var
        CaseWSG: Record "Case WSG";
}
