pageextension 53413 "ORB Create Order From Sales" extends "Create Order From Sales"
{
    layout
    {
        modify(OrderType)
        {
            Editable = false;
        }
    }

    trigger OnOpenPage()
    begin
        SetParameters(
            Enum::"Create Production Order Status"::"Firm Planned",
            Enum::"Create Production Order Type"::ProjectOrder);
    end;

}
