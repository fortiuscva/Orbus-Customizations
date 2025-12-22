page 53443 "ORB Inventory Movement"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Warehouse Activity Header";
    SourceTableView = where("No." = FILTER('INVMOV*'));

    layout
    {
        area(Content)
        {
            cuegroup("Inventory Movement")
            {
                field(MovementCountVarLcl; MovementCountVarLcl)
                {
                    Caption = 'Inventory Movements';
                    ApplicationArea = Basic, Suite;

                    trigger OnDrillDown()
                    var
                        InventoryMovementPageLcl: Page "Inventory Movements";
                    begin
                        InventoryMovementPageLcl.run();
                    end;
                }
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        MovementCountVarLcl := Rec.Count;
    end;

    var
        MovementCountVarLcl: Integer;

}