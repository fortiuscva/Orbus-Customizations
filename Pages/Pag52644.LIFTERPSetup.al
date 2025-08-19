page 52644 "ORB LIFT ERP Setup"
{
    ApplicationArea = All;
    Caption = 'LIFT ERP Setup';
    PageType = Card;
    SourceTable = "ORB LIFT ERP Setup";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Lift ERP Integration Active"; Rec."Lift ERP Integration Active")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Lift ERP Integration Active field.', Comment = '%';
                }

                field("Sales Orders API"; Rec."Sales Orders API")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Sales Orders API field.', Comment = '%';
                }
                field("Customers API"; Rec."Customers API")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Customers API field.', Comment = '%';
                }
                field("Items API"; Rec."Items API")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Items API field.', Comment = '%';
                }
                field("Inventory Journal API"; Rec."Inventory Journal API")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Inventory Journal API field.', Comment = '%';
                }
                field("JQ Error Notification Email"; Rec."JQ Error Notification Email")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Job Queue Error Notification Email Field', Comment = '%';
                }
            }
            group(Posting)
            {
                Caption = 'Posting';

                group(InvPick)
                {
                    Caption = 'Inventory Pick';
                    field("Inv. Pick Post. Jnl. Template"; Rec."Inv. Pick Post. Jnl. Template")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Inv. Pick Posting Jnl. Template Name field.', Comment = '%';
                    }
                    field("Inv. Pick Post. Jnl. Batch"; Rec."Inv. Pick Post. Jnl. Batch")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Inv. Pick Posting Jnl. Template Name field.', Comment = '%';
                    }
                    field("Inv. Pick Pst. Jnl. Batch(Ord)"; Rec."Inv. Pick Pst. Jnl. Batch(Ord)")
                    {
                        ToolTip = 'Specifies the value of the Inv. Pick Posting Jnl. Batch Name (Order) field.', Comment = '%';
                    }
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
