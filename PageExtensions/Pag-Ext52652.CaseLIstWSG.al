pageextension 52652 "ORB Case List WSG" extends "Case List WSG"
{
    layout
    {
        addlast(General)
        {
            field("ORB Status"; Rec.Status)
            {
                Caption = 'Case Status';
                ApplicationArea = All;
                ToolTip = 'Case Status';
            }
        }
    }
}