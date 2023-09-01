pageextension 52613 "ORB IWX Inventory Count Card" extends "IWX Inventory Count Card"
{
    actions
    {
        addafter(acGenerateSheets)
        {
            action("ORB Generate Count Sheets")
            {
                Caption = 'ORB Generate Count Sheets';
                Image = Insert;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = all;
                trigger OnAction()
                var
                    IWXCountSheetConfigRecLcl: Record "IWX Count Sheet Configuration";
                begin
                    IWXCountSheetConfigRecLcl.Reset();
                    IWXCountSheetConfigRecLcl.SetRange("Count No.", rec."No.");
                    if IWXCountSheetConfigRecLcl.FindFirst() then
                        Report.RunModal(52601, true, false, IWXCountSheetConfigRecLcl);
                end;
            }
        }
    }
}