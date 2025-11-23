pageextension 53411 "ORB LIFT Assembly BOM" extends "Assembly BOM"
{
    layout
    {
        addlast(Control1)
        {
            field("ORB LIFT Parent Product ID"; Rec."ORB LIFT Parent Product ID")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Parent Product ID field.', Comment = '%';
            }
            field("ORB LIFT Product ID"; Rec."ORB LIFT Product ID")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Product ID field.', Comment = '%';
            }
            field("ORB Do Not Integrate (Sell)"; Rec."ORB Do Not Integrate (Sell)")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Do Not Integrate (Sellable) field.', Comment = '%';
            }
        }
    }
}
