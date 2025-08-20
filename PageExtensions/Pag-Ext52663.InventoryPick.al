pageextension 52663 "ORB Inventory Pick" extends "Inventory Pick"
{

    trigger OnOpenPage()
    begin
        Rec.Validate("Posting Date", WorkDate());
        rec.Modify();
    end;
}
