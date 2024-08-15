pageextension 52632 "ORB IWX License Plate List" extends "IWX License Plate List"
{
    layout
    {
        addlast(Group)
        {
            field("ORB DS Payment Type"; Rec."ORB DS Payment Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the DS Payment Type field.', Comment = '%';
            }
            field("ORB Posted Sales Invoice No."; Rec."ORB Posted Sales Invoice No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Posted Sales Invoice No. field.', Comment = '%';
            }
        }
    }
}
