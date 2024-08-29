pageextension 52637 "ORB Sales Order Archives" extends "Sales Order Archives"
{
    layout
    {
        addlast(Control1)
        {
            field("ORB DS Payment Account No."; Rec."ORB DS Payment Account No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Payment Account No. field.', Comment = '%';
            }

            field("ORB DS Payment Type"; Rec."ORB DS Payment Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Payment Type field.', Comment = '%';
            }
            field("ORB Sales Order Payment Type"; Rec."Sales Order Payment Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sales Order Payment Type field.', Comment = '%';
            }
            field("ORB SO Payment Account No."; Rec."SO Payment Account No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sales Order Payment Account No. field.', Comment = '%';
            }
        }
    }
}
