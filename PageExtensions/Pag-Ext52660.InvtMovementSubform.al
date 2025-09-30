pageextension 52660 "ORB Invt. Movement Subform" extends "Invt. Movement Subform"
{
    layout
    {
        addbefore("Bin Code")
        {
            field("ORB Zone Code"; Rec."Zone Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the zone code where the bin on this line is located.';
                Visible = false;
            }
        }
    }
    actions
    {
        // addlast("F&unctions")
        // {
        //     action("ORB ChangeUnitOfMeasure")
        //     {
        //         ApplicationArea = Suite;
        //         Caption = '&Change Unit Of Measure';
        //         Ellipsis = true;
        //         Visible = true;
        //         Image = UnitConversions;
        //         ToolTip = 'Specify which unit of measure you want to change during the warehouse activity, for example, because you want to ship an item in boxes although you store it in pallets.';
        //         trigger OnAction()
        //         begin
        //             ChangeUOM();
        //         end;
        //     }
        // }
    }
    // local procedure ChangeUOM()
    // var
    //     WhseActLine: Record "Warehouse Activity Line";
    //     WhseChangeOUM: Report "Whse. Change Unit of Measure";
    // begin
    //     Rec.TestField("Action Type");
    //     Rec.TestField("Breakbulk No.", 0);
    //     Rec.TestField("Qty. to Handle");
    //     WhseChangeOUM.DefWhseActLine(Rec);
    //     WhseChangeOUM.RunModal();
    //     if WhseChangeOUM.ChangeUOMCode(WhseActLine) then
    //         Rec.ChangeUOMCode(Rec, WhseActLine);
    //     Clear(WhseChangeOUM);
    //     CurrPage.Update(false);
    // end;
}
