pageextension 52645 "ORB Posted Sales Credit Memo" extends "Posted Sales Credit Memo"
{
    layout
    {
        addafter("Posting Date")
        {

            field("ORB Your Reference(CS)"; Rec."ORB Your Reference(CS)")
            {
                Caption = 'Your Reference(CS)';
                ApplicationArea = All;
                Tooltip = 'Specifies Your Reference';
                Editable = False;
            }
        }
        modify("Your Reference")
        {

            Caption = 'Versapay ID';
            Editable = False;
        }
        addafter("Work Description")
        {
            group("ORB ProductionNote")
            {
                Caption = 'Production Note';
                field("ORB GetProductionNote"; Rec.GetProductionNote())
                {
                    ApplicationArea = All;
                    Editable = false;
                    Importance = Additional;
                    MultiLine = true;
                    ShowCaption = false;
                    ToolTip = 'Specifies the value of the Production Note field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    // trigger OnAfterGetRecord()
    // begin
    //     ProductionNote := Rec.GetProductionNote();
    // end;

    // var
    //     ProductionNote: Text;
}