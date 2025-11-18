page 54345 "ORB .Inventory Movement"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Warehouse Activity Header";

    layout
    {
        area(Content)
        {
            cuegroup(InventoryMovement)
            {
                field(MovementCountVarLcl; MovementCountVarLcl)
                {
                    Caption = 'Inventory Movements';
                    ApplicationArea = All;
                }

            }
        }
    }
    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        MovementCountVarLcl := REc.Count;
    end;

    var
        MovementCountVarLcl: Integer;

}