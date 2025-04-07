pageextension 52607 "ORB Customer Card" extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here

        addafter("Salesperson Code")
        {
            field("ORB Regional Sales Executive"; Rec."ORB Regional Sales Executive")
            {
                ApplicationArea = all;
                Tooltip = 'Specifies Orbus Regional Sales Executive';
            }

            field("ORB Customer Support"; Rec."ORB Customer Support")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies Orbus Customer Support';
            }
            field("ORB Business Development"; Rec."ORB Business Development")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies Orbus Business Development';
            }
        }
        addlast(General)
        {
            field("ORB Auto Send Email"; Rec."ORB Auto Send Email")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies Auto Send Email from JQ for the customer';
            }
            field("ORB LIFT Customer"; Rec."ORB LIFT Customer")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies Orbus LIFT Customer';
            }
            field("ORB ThisYearSales"; Rec."ORB This Year Sales")
            {
                ApplicationArea = all;
            }
            field("ORB PreviousYearSales"; Rec."ORB Prev Year Sales")
            {
                ApplicationArea = all;
            }
            field("ORB LTMSales"; Rec."ORB LTM Sales")
            {
                ApplicationArea = all;
            }
            field("ORB LifetimeSalesTotal"; Rec."ORB Lifetime Sales Total")
            {
                ApplicationArea = all;
            }
            field("ORB ThisYearSalesCrMemo"; Rec."ORB ThisYearSalesCrMemo")
            {
                ApplicationArea = all;
            }
            field("ORB PreviousYearSalesCrMemo"; Rec."ORB PreviousYearSalesCrMemo")
            {
                ApplicationArea = all;
            }
            field("ORB LTMSalesCrMemo"; Rec."ORB LTMSalesCrMemo")
            {
                ApplicationArea = all;
            }
            field("ORB LifetimeSalesTotalCrMemo"; Rec."ORB LifetimeSalesTotalCrMemo")
            {
                ApplicationArea = all;
            }
            field("ORB Is Core Team"; Rec."ORB Is Core Team")
            {
                ApplicationArea = all;
            }
        }


        modify("Salesperson Code")
        {
            Caption = 'Key/National Account Manager';
        }
        modify("Tax Liable")
        {
            trigger OnBeforeValidate()
            var
                UserSetupRecLcl: Record "User Setup";
            begin
                if UserSetupRecLcl.get(UserId) then begin
                    if not UserSetupRecLcl."ORB Tax Liable Edit Allowed" then
                        Error(AccessNotallowedlbl, UserId);
                end;
            end;

        }
    }
    actions
    {
        addlast(processing)
        {
            action("ORB Send Email")
            {
                Image = Email;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = all;
                Caption = 'Send Invoices Email';

                trigger OnAction()
                var
                    CustomerRecLcl: Record Customer;
                begin
                    CustomerRecLcl.Reset();
                    CustomerRecLcl.SetRange("No.", Rec."No.");
                    if CustomerRecLcl.FindFirst() then
                        report.RunModal(52602, true, false, CustomerRecLcl);

                end;
            }
            action("ORB Export Invoice Email Setup Issues")
            {
                Image = Email;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = all;
                Caption = 'Export Invoice Email Setup Issues';
                RunObject = report "Exp. Inv. Email Setup Issues";
            }
        }
    }
    /*
    trigger OnAfterGetRecord()
    var
        FunctionsCU: Codeunit "ORB Functions";
    begin
        FunctionsCU.CalculateSalesTotals(ThisYearSales, PreviousYearSales, LTMSales, Rec."ORB Lifetime Sales Total", Rec."No.");
        FunctionsCU.CalculateCreditMemoTotals(ThisYearSalesCrMemo, PreviousYearSalesCrMemo, LTMSalesCrMemo, LifetimeSalesCrMemo, Rec."No.");

    end;
    */

    var
        AccessNotallowedlbl: Label '%1 is not allowed to edit Tax Liable';
        EditNotAllowedlbl: Label '%1 cannot edit this field';
        UserSetupRecGbl: Record "User Setup";
        IsCoreTeam: Boolean;
}