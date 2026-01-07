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
                    ApplicationArea = All;
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