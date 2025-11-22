pageextension 53403 "ORB Work Center Groups" extends "Work Center Groups"
{
    layout
    {
        addlast(Control1)
        {
            field("ORB Fast Solutions"; Rec."ORB Fast Solutions")
            {
                ApplicationArea = all;
            }
        }
    }
}
