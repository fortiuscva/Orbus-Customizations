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
            field("ORB ThisYearSales"; ThisYearSales)
            {
                ApplicationArea = all;
                Editable = false;
                Caption = 'This Year Sales Total';
            }
            field("ORB PreviousYearSales"; PreviousYearSales)
            {
                ApplicationArea = all;
                Editable = false;
                Caption = 'Previous Year Sales Total';
            }
            field("ORB LTMSales"; LTMSales)
            {
                ApplicationArea = all;
                Editable = false;
                Caption = 'LTM Sales Total';
            }
            field("ORB LifetimeSalesTotal"; LifetimeSales)
            {
                ApplicationArea = all;
                Editable = false;
                Caption = 'Lifetime Sales Total';
            }
            field("ORB ThisYearSalesCrMemo"; ThisYearSalesCrMemo)
            {
                ApplicationArea = all;
                Editable = false;
                Caption = 'This Year Sales Cr. Memo Total';
            }
            field("ORB PreviousYearSalesCrMemo"; PreviousYearSalesCrMemo)
            {
                ApplicationArea = all;
                Editable = false;
                Caption = 'Previous Year Sales Cr. Memo Total';
            }
            field("ORB LTMSalesCrMemo"; LTMSalesCrMemo)
            {
                ApplicationArea = all;
                Editable = false;
                Caption = 'LTM Sales Cr. Memo Total';
            }
            field("ORB LifetimeSalesTotalCrMemo"; LifetimeSalesCrMemo)
            {
                ApplicationArea = all;
                Editable = false;
                Caption = 'Lifetime Sales Cr. Memo Total';
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
    trigger OnAfterGetRecord()
    var
        FunctionsCU: Codeunit "ORB Functions";
    begin
        FunctionsCU.CalculateSalesTotals(ThisYearSales, PreviousYearSales, LTMSales, LifetimeSales, Rec."No.");
        FunctionsCU.CalculateCreditMemoTotals(ThisYearSalesCrMemo, PreviousYearSalesCrMemo, LTMSalesCrMemo, LifetimeSalesCrMemo, Rec."No.");

    end;

    var
        AccessNotallowedlbl: Label '%1 is not allowed to edit Tax Liable';
        ThisYearSales: Decimal;
        PreviousYearSales: Decimal;
        LTMSales: Decimal;
        LifetimeSales: Decimal;
        ThisYearSalesCrMemo: Decimal;
        PreviousYearSalesCrMemo: Decimal;
        LTMSalesCrMemo: Decimal;
        LifetimeSalesCrMemo: Decimal;
}