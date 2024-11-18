pageextension 52643 "ORB Item Journal" extends "Item Journal"
{
    actions
    {
        addlast("F&unctions")
        {
            action("ORB Process Inventory Journal")
            {
                Image = Order;
                ApplicationArea = all;
                Caption = 'Process Inventory Journal';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    LIFTERPSetupRecLcl: Record "ORB LIFT ERP Setup";
                    LIFTIntegrationDataLogRecLcl: Record "ORB LIFT Integration Data Log";
                    LIFTIntegration: Codeunit "ORB LIFT Integration";
                    LIFTAPICodes: Codeunit "ORB LIFT API Codes";
                begin
                    LIFTERPSetupRecLcl.Get();
                    LIFTIntegrationDataLogRecLcl.Reset();
                    LIFTIntegrationDataLogRecLcl.SetCurrentKey("Source Type", "Source Subtype", "Source No.");
                    LIFTIntegrationDataLogRecLcl.SetRange("Source Type", Database::"Item Journal Line");
                    LIFTIntegrationDataLogRecLcl.SetRange("Source subtype", 0);
                    if LIFTIntegrationDataLogRecLcl.FindLast() then
                        LIFTIntegration.ParseData(LIFTERPSetupRecLcl."Inventory Journal API" + '&p1=' + LIFTIntegrationDataLogRecLcl."Source No.", LIFTAPICodes.GetInventoryJournalAPICode())
                    else
                        LIFTIntegration.ParseData(LIFTERPSetupRecLcl."Inventory Journal API", LIFTAPICodes.GetInventoryJournalAPICode());
                end;
            }
        }
    }
}
