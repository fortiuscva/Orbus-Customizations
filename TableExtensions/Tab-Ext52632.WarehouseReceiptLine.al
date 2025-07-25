tableextension 52632 "ORB WarehouseReceiptLine" extends "Warehouse Receipt Line"
{
    fields
    {
        field(52600; "ORB Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
            DataClassification = ToBeClassified;
        }
        modify("Item No.")
        {
            trigger OnAfterValidate()
            var
                ItemRecLcl: Record Item;
            begin
                if ItemRecLcl.get(Rec."Item No.") then
                    "ORB Unit Cost" := ItemRecLcl."Unit Cost";
            end;
        }
    }
}