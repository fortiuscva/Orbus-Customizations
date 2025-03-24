pageextension 52624 "ORB Sales Order List" extends "Sales Order List"
{
    layout
    {
        addafter("No.")
        {
            field("ORB Magento Order #"; Rec."ORB Magento Order #")
            {
                ApplicationArea = all;
                ToolTip = 'Magento Order #';
            }
            field("ORB Escalation Reason Code"; Rec."ORB Escalation Reason Code")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the issue that is stopping the order release';

            }
            field("ORB Resolved By"; Rec."ORB Resolved By")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the user who resolved the escalated reason';
            }
            /*
            field("ORB Total Payment Amount"; Rec."ORB Total Payment Amount")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Total Payment Amount Field value';
            }
            */
            field("ORB Freight Line"; Rec."ORB Freight Line")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the field Freight Line value';
            }

        }
        addlast(Control1)
        {
            field("ORB DS Payment Account No."; Rec."ORB DS Payment Account No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Payment Account No. field.', Comment = '%';
            }

            field("ORB DS Payment Type"; Rec."ORB DS Payment Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Payment Type field.', Comment = '%';
            }
            field("ORB Original Promised Ship Dt."; Rec."ORB Original Promised Ship Dt.")
            {
                ApplicationArea = ALL;
                ToolTip = 'Specifies the fist warehouse release date for the order';
                Editable = false;
            }
            field("ORB Delayed Ship Reason Code"; Rec."ORB Delayed Ship Reason Code")
            {
                ApplicationArea = ALL;
                ToolTip = 'Specifies the reason for shipment delay';
                Editable = false;
            }
            field("ORB Delayed Ship Sub-Reason"; Rec."ORB Delayed Ship Sub-Reason")
            {
                ApplicationArea = ALL;
                ToolTip = 'Specifies the sub-reason for shipment delay';
                Editable = false;
            }
            field("ORB Your Reference(CS)"; Rec."ORB Your Reference(CS)")
            {
                ApplicationArea = ALL;
                ToolTip = 'Specifies Your Reference';
                Editable = false;
            }
            field("ORB Project No."; Rec."Project No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Project No.';
                Editable = false;
            }
            field("ORB Customer Support"; Rec."ORB Customer Support")
            {
                Caption = 'Customer Support';
                ApplicationArea = All;
                Editable = false;
            }
            field("ORB Business Development"; Rec."ORB Business Development")
            {
                Caption = 'Business Development';
                ApplicationArea = All;
                Editable = false;
            }
        }
    }
    actions
    {
        addlast("O&rder")
        {
            action("ORB Sales Header Additional Fields")
            {
                Caption = 'Additional Fields';
                Image = RelatedInformation;
                ApplicationArea = all;
                RunObject = page "ORB Sales Header Add. Fields";
                RunPageLink = "Document Type" = field("Document Type"), "No." = field("No.");
            }
            action("ORB LIFT Get Sales Orders")
            {
                Image = Order;
                ApplicationArea = all;
                Caption = 'LIFT Get Sales Orders';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = IsLIFTERPFunctionEnabled;
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
                    LIFTIntegrationDataLogRecLcl.SetRange("Source Type", Database::"Sales Header");
                    LIFTIntegrationDataLogRecLcl.SetRange("Source Subtype", 1);
                    if LIFTIntegrationDataLogRecLcl.FindLast() then
                        LIFTIntegration.ParseData(LIFTERPSetupRecLcl."Sales Orders API" + '&p1=' + LIFTIntegrationDataLogRecLcl."Source No.", LIFTAPICodes.GetSalesOrderAPICode())
                    else
                        LIFTIntegration.ParseData(LIFTERPSetupRecLcl."Sales Orders API", LIFTAPICodes.GetSalesOrderAPICode());
                end;
            }

        }
        modify("Release & Pick")
        {
            Visible = false;
            trigger OnBeforeAction()
            var
                SalesHeaderRecLcl: Record "Sales Header";
            begin
                CurrPage.SetSelectionFilter(SalesHeaderRecLcl);
                SalesHeaderRecLcl.MarkedOnly(true);
                IF SalesHeaderRecLcl.FindSet() then
                    repeat
                        OrbusFunctions.RestrictZeroTransactionAmountforCreditCardPayment(SalesHeaderRecLcl);
                    Until SalesHeaderRecLcl.Next() = 0;

            end;
        }
        addafter("Release & Pick")
        {
            action("ORB Release & Inventory Pick")
            {
                Caption = 'Release & Pick';
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Category5;
                Image = CreateWarehousePick;

                trigger OnAction()
                var
                    SalesHeaderRecLcl: Record "Sales Header";
                    //EFTTransactionRecLcl: Record "EFT Transaction -CL-";
                    PaymentMethodLbl: label 'CREDITCARD';
                    NoValidCreditCardErrorLbl: Label 'No Valid Credit Card Authorization Charged, Please Authorize Valid Credit Card to Release Sales Order.';
                begin
                    CurrPage.SetSelectionFilter(SalesHeaderRecLcl);
                    SalesHeaderRecLcl.MarkedOnly(true);
                    IF SalesHeaderRecLcl.FindSet() then
                        repeat
                            OrbusFunctions.RestrictZeroTransactionAmountforCreditCardPayment(SalesHeaderRecLcl);
                        Until SalesHeaderRecLcl.Next() = 0;

                    if (Rec."Shipping Agent Code" = '') and (Rec."Shipping Agent Service Code" = '') then Error('Shipping Agent Code and Shipping Agent Service have a value of "blank". Both fields need a value other than "blank"');
                    if (Rec."Shipping Agent Code" = '') then Error('Shipping Agent Code cannot have a value of "blank"');
                    if Rec."Shipping Agent Service Code" = '' then Error('Shipping Agent Service Code cannot have a value of "blank"');
                    CurrPage.SetSelectionFilter(SalesHeaderRecLcl);
                    SalesHeaderRecLcl.MarkedOnly(true);
                    IF SalesHeaderRecLcl.FindSet() then
                        repeat
                            if not ORBCreateInventoryPick.Run(SalesHeaderRecLcl) then;
                        Until SalesHeaderRecLcl.Next() = 0;
                    CurrPage.Update();
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        clear(IsLIFTERPFunctionEnabled);
        if LiftFunctions.IsLIFTERPSetupEnabled() and (LiftFunctions.IsGetSalesOrdersAllowed()) then
            IsLIFTERPFunctionEnabled := true;
    end;

    var
        OrbusFunctions: Codeunit "ORB Functions";
        LiftFunctions: Codeunit "ORB LIFT Functions";
        ORBCreateInventoryPick: Codeunit "ORB Create Inventory Pick";
        IsLIFTERPFunctionEnabled: Boolean;
}
