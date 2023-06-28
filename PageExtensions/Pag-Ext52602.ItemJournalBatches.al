pageextension 52602 "ORB Item Journal Batches" extends "Item Journal Batches"
{
    layout
    {
        addlast(Control1)
        {
            field("ORB Auto Post"; Rec."ORB Auto Post")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Auto Post field.';
            }
        }
    }
}
