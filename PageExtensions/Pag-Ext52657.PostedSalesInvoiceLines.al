pageextension 52657 "ORB Posted Sales Invoice Lines" extends "Posted Sales Invoice Lines"
{
    layout
    {
        addafter("Location Code")
        {
            // field("ORB Order Status"; Rec."ORB Order Status")
            // {
            //     ApplicationArea = All;
            // }
            field("ORB ProductLine Dim"; rec."ORB ProductLine Dim")
            {
                ApplicationArea = All;
            }
            field("ORB Custom"; Rec."ORB Custom")
            {
                ApplicationArea = All;
            }
        }
    }
}
