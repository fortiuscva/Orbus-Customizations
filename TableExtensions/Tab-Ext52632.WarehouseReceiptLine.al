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

    trigger OnInsert()
    var
        ItemRecLcl: Record Item;
    begin
        if ItemRecLcl.get("No.") then
            "ORB Unit Cost" := ItemRecLcl."Unit Cost";
    end;
}