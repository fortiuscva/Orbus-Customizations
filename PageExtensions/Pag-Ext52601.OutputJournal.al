pageextension 52601 "ORB Output Journal" extends "Output Journal"
{
    layout
    {
        addafter(Description)
        {
            field("ORB IWX AutoPost State"; Rec."ORB IWX AutoPost State")
            {
                Visible = false;
                ApplicationArea = All;
                ToolTip = 'Whether or not this has been errored from the auto-post.';

            }
            field("ORB IWX AutoPost Error DT"; Rec."ORB IWX AutoPost Error DT")
            {
                Visible = false;
                ApplicationArea = All;
                ToolTip = 'The last time this item journal line encountered an error message.';

            }
            field("ORB IWX AutoPost Error Message"; Rec."ORB IWX AutoPost Error Message")
            {
                Visible = false;
                ApplicationArea = All;
                ToolTip = 'The last error message from the auto-post.';

            }
        }
    }
}