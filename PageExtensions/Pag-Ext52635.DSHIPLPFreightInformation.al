pageextension 52635 "DSHIP LP Freight Information" extends "DSHIP LP Freight Information"
{
    layout
    {
        modify(Cost)
        {
            Caption = 'Orbus Freight Cost';
        }
        addafter(Cost)
        {
            field("ORB Handling"; Rec."ORB Handling")
            {
                ApplicationArea = all;
                ToolTip = 'Handling Price';
            }
            field("ORB Freight Quote"; Rec."ORB Freight Quote")
            {
                ApplicationArea = all;
                ToolTip = 'Freight Quote';
            }
        }
    }
}
