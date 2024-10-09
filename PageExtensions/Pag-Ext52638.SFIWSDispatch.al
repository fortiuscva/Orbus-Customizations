pageextension 52638 "ORB SFI WS - Dispatch" extends "SFI WS - Dispatch"
{
    layout
    {
        addafter("Run Time")
        {
            field("ORB PrdLn Dimension"; Rec."ORB PrdLn Dimension")
            {
                ApplicationArea = all;
                ToolTip = 'PrdLn Dimension';
            }
            field("ORB Material Dimension"; Rec."ORB Material Dimension")
            {
                ApplicationArea = all;
                ToolTip = 'Material Dimension';
            }
        }
    }
    trigger OnAfterGetRecord()
    var
        ProdOrderLine: Record "Prod. Order Line";
        prod: Page "Released Prod. Order Lines";
        DimensionSetID: Record "Dimension Set Entry";
    begin

    end;

}
