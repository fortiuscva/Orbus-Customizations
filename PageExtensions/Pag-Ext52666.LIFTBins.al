pageextension 52666 "LIFT Bins" extends Bins
{
    layout
    {
        addlast(Control1)
        {
            field("ORB Bin Location Id"; Rec."ORB Bin Location Id")
            {

                ApplicationArea = all;
            }
        }
    }
}
