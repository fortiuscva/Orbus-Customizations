page 52644 "ORB LIFT ERP Setup"
{
    ApplicationArea = All;
    Caption = 'LIFT ERP Setup';
    PageType = CardPart;
    SourceTable = "ORB LIFT ERP Setup";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Sales Orders API"; Rec."Sales Orders API")
                {
                    ToolTip = 'Specifies the value of the Sales Orders API field.', Comment = '%';
                }
                field("Customers API"; Rec."Customers API")
                {
                    ToolTip = 'Specifies the value of the Customers API field.', Comment = '%';
                }
                field("Items API"; Rec."Items API")
                {
                    ToolTip = 'Specifies the value of the Items API field.', Comment = '%';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
