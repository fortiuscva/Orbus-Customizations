tableextension 52632 "ORB WarehouseReceiptLine" extends "Warehouse Receipt Line"
{
    fields
    {
        field(52600; "ORB Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
            DataClassification = ToBeClassified;
        }
    }

    trigger OnAfterInsert()
    var
        ItemRecLcl: Record Item;
    begin
        if ItemRecLcl.get(Rec."Item No.") then
            "ORB Unit Cost" := ItemRecLcl."Unit Cost";
    end;
}