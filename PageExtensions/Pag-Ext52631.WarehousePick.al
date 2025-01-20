pageextension 52631 "ORB Warehouse Pick" extends "Warehouse Pick"
{
    actions
    {
        addafter("Delete Qty. to Handle")
        {
            action("ORB Update TAKE Zone")
            {
                ApplicationArea = Warehouse;
                Caption = 'Update TAKE Zone';
                Image = DeleteQtyToHandle;

                trigger OnAction()
                begin
                end;
            }
        }
    }

    procedure UpdateTakeZone()
    begin



    end;
}
