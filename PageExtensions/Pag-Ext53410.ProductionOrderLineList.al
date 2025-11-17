pageextension 53410 "ORB ProductionOrderLineList" extends "ProductionOrderLineList"
{

    trigger OnOpenPage()
    begin
        Rec.reset;
        Rec.Setrange(Status, Rec.status::Released);
    end;

}