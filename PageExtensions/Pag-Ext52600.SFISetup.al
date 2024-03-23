//This for testing
pageextension 52600 "ORB SFI Setup" extends "SFI Setup"
{
    layout
    {
        addafter(General)
        {
            group("ORB AutoPost")
            {
                Caption = 'Extension - Auto-Post';
                InstructionalText = 'Create a job queue entry for codeunit 52600, and make sure the job queue is running.  The job queue will then automatically post any output or consumption journal.   Auto-posting will not auto-post time on time cards.';
                field("ORB IWX Auto Post Output"; Rec."ORB IWX Auto Post Output")
                {
                    ApplicationArea = All;
                    ToolTip = 'Whether or not to auto-post output.';
                }
                field("ORB IWX Auto Post Consumption"; Rec."ORB IWX Auto Post Consumption")
                {
                    ApplicationArea = All;
                    ToolTip = 'Whether or not to auto-post consumption.';
                }
            }
        }
    }
}
