pageextension 53404 "ORB Prod. Order Routing" extends "Prod. Order Routing"
{
    layout
    {
        addlast(Control1)
        {
            field("ORB Fast Solutions"; Rec."ORB Fast Solutions")
            {
                ApplicationArea = all;
            }
            field("ORB Finished Quantity"; Rec."ORB Finished Quantity")
            {
                ApplicationArea = all;
            }
        }
    }
}