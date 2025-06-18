pageextension 52615 "ORB Sales Order" extends "Sales Order"
{
    layout
    {
        addlast(General)
        {
            field("ORB Tax ID"; Rec."ORB Tax ID")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Tax ID of Sales';
            }
            field("ORB Declared Value"; Rec."ORB Declared Value")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Declared Value of Sales';
            }
            field("ORB International Contact"; Rec."ORB International Contact")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the International Contact of Sales';
            }
            field("Magento Order #"; Rec."ORB Magento Order #")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Magento Order # of Sales';
            }
            // field("ORB Magento Artwork Job ID"; Rec."ORB Magento Artwork Job ID")
            // {
            //     ApplicationArea = all;
            //     ToolTip = 'Specifies the Magento Artwork Job ID of Sales';
            // }
            field("ORB Magento CC 4 Digits"; Rec."ORB Magento CC 4 Digits")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Magento CC 4 Digits of Sales';
            }
            field("ORB On Hold"; Rec."On Hold")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies if the document was put on hold when it was posted, for example because payment of the resulting customer ledger entries is overdue.';
            }
            field("ORB Require Review"; Rec."ORB Require Review")
            {
                ApplicationArea = All;
            }
            field("ORB Magento Location Code"; Rec."ORB Magento Location Code")
            {
                ApplicationArea = All;
                Editable = false;
                Visible = false;
            }
            field("ORB RUSH"; Rec."ORB RUSH")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the value of the RUSH field.';
            }
            field("ORB Escalation Reason"; Rec."ORB Escalation Reason Code")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the reasons for escalation';
            }
            field("ORB Resolved By"; Rec."ORB Resolved By")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the user who resolved escalated issue';
            }
            field("ORB Original Promised Ship Dt."; Rec."ORB Original Promised Ship Dt.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies Original Ship. Date';
                Editable = false;
            }

            field("ORB Delayed Ship Reason Code"; Rec."ORB Delayed Ship Reason Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies reasons for delayed shipment';

            }
            field("ORB Delayed Ship Sub-Reason"; Rec."ORB Delayed Ship Sub-Reason")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the sub-reason code for Shipment Delay';
            }
            field("ORB Your Reference(CS)"; Rec."ORB Your Reference(CS)")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies your Reference';
            }
        }
        modify("Payment Terms Code")
        {
            trigger OnBeforeValidate()
            var
                UserSetupRecLcl: Record "User Setup";
                AccessNotallowedlbl: Label '%1 does not have the permission to access';
            begin
                if UserSetupRecLcl.get(UserId) then begin
                    if UserSetupRecLcl."ORB PT on SO Not allowed" then
                        Error(AccessNotallowedlbl, UserId);
                end;
            end;
        }
        modify("Your Reference")
        {
            Caption = 'Versapay ID';
            Editable = false;
        }
        addfirst(factboxes)
        {
            part(ORBSalesLineAddFieldsFB; "ORB Sales Line Add. Fields FB")
            {
                ApplicationArea = Suite;
                Provider = SalesLines;
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Line No." = field("Line No.");
            }
        }
        modify("Order Status")
        {
            trigger OnAfterValidate()
            begin
                if Xrec."Order Status" = Xrec."Order Status"::Draft then
                    Message('Please Do not forgot to Send Order Confirmation Email');
                CurrPage.Update(true);
            end;
        }
        addafter("Order Status")
        {
            field("ORB Send Order Confirmation Email"; SendOrderConfirmationEmailLbl)
            {
                ApplicationArea = All;
                Editable = false;
                ShowCaption = false;
                Style = StrongAccent;
                StyleExpr = true;
                ToolTip = 'Click this to Send Order Confirmation Email';

                trigger OnDrillDown()
                begin
                    if Rec."Location Code" = '' then
                        Error(LocationNotFoundlbl, Rec."No.");

                    OrbusFunctions.SendOrderConfirmationEmailItem(Rec, false);
                end;
            }
        }
        addafter("Sell-to Customer Name")
        {
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
        modify("Campaign No.")
        {
            Editable = false;
        }
    }
    actions
    {
        modify(Release)
        {
            trigger OnBeforeAction()
            var
                EFTTransactionRecLcl: Record "EFT Transaction -CL-";
                PaymentMethodLbl: label 'CREDITCARD';
                NoValidCreditCardErrorLbl: Label 'No Valid Credit Card Authorization Charged, Please Authorize Valid Credit Card to Release Sales Order.';
            begin
                // rec.CalcFields("Amount Including VAT");
                // if rec."Amount Including VAT" > 0 then
                //     if rec."Payment Method Code" = PaymentMethodLbl then begin
                //         EFTTransactionRecLcl.Reset();
                //         EFTTransactionRecLcl.SetRange("Document Type", rec."Document Type");
                //         EFTTransactionRecLcl.SetRange("Document No.", rec."No.");
                //         //Charge|Settle|Capture|Refund|Credit|Return Settle|Authorize|Return Authorize|Voice Authorize

                //         EFTTransactionRecLcl.SetFilter("Method Type", '%1|%2|%3|%4|%5|%6|%7|%8|%9', EFTTransactionRecLcl."Method Type"::Charge, EFTTransactionRecLcl."Method Type"::Settle,
                //         EFTTransactionRecLcl."Method Type"::Capture, EFTTransactionRecLcl."Method Type"::Refund, EFTTransactionRecLcl."Method Type"::Credit, EFTTransactionRecLcl."Method Type"::"Return Settle",
                //         EFTTransactionRecLcl."Method Type"::Authorize, EFTTransactionRecLcl."Method Type"::"Return Authorize", EFTTransactionRecLcl."Method Type"::"Voice Authorize");

                //         EFTTransactionRecLcl.Setfilter("Transaction Status", '%1|%2|%3', EFTTransactionRecLcl."Transaction Status"::Queued, EFTTransactionRecLcl."Transaction Status"::Batched,
                //         EFTTransactionRecLcl."Transaction Status"::Approved);
                //         EFTTransactionRecLcl.SetFilter("Expiration Filter", '<%1', WorkDate());
                //         EFTTransactionRecLcl.CalcSums("Transaction Amount");

                //         if EFTTransactionRecLcl."Transaction Amount" <= 0 then
                //             Error(NoValidCreditCardErrorLbl);
                //     end;
                OrbusFunctions.RestrictZeroTransactionAmountforCreditCardPayment(rec);
            end;
        }
        modify("Release & Pick")
        {
            Visible = true;
            trigger OnBeforeAction()
            var
                EFTTransactionRecLcl: Record "EFT Transaction -CL-";
                PaymentMethodLbl: label 'CREDITCARD';
                NoValidCreditCardErrorLbl: Label 'No Valid Credit Card Authorization Charged, Please Authorize Valid Credit Card to Release Sales Order.';
            begin
                // rec.CalcFields("Amount Including VAT");
                // if rec."Amount Including VAT" > 0 then
                //     if rec."Payment Method Code" = PaymentMethodLbl then begin
                //         EFTTransactionRecLcl.Reset();
                //         EFTTransactionRecLcl.SetRange("Document Type", rec."Document Type");
                //         EFTTransactionRecLcl.SetRange("Document No.", rec."No.");
                //         //Charge|Settle|Capture|Refund|Credit|Return Settle|Authorize|Return Authorize|Voice Authorize

                //         EFTTransactionRecLcl.SetFilter("Method Type", '%1|%2|%3|%4|%5|%6|%7|%8|%9', EFTTransactionRecLcl."Method Type"::Charge, EFTTransactionRecLcl."Method Type"::Settle,
                //         EFTTransactionRecLcl."Method Type"::Capture, EFTTransactionRecLcl."Method Type"::Refund, EFTTransactionRecLcl."Method Type"::Credit, EFTTransactionRecLcl."Method Type"::"Return Settle",
                //         EFTTransactionRecLcl."Method Type"::Authorize, EFTTransactionRecLcl."Method Type"::"Return Authorize", EFTTransactionRecLcl."Method Type"::"Voice Authorize");

                //         EFTTransactionRecLcl.Setfilter("Transaction Status", '%1|%2|%3', EFTTransactionRecLcl."Transaction Status"::Queued, EFTTransactionRecLcl."Transaction Status"::Batched,
                //         EFTTransactionRecLcl."Transaction Status"::Approved);
                //         EFTTransactionRecLcl.SetFilter("Expiration Filter", '<%1', WorkDate());
                //         EFTTransactionRecLcl.CalcSums("Transaction Amount");

                //         if EFTTransactionRecLcl."Transaction Amount" <= 0 then
                //             Error(NoValidCreditCardErrorLbl);
                //     end;

                OrbusFunctions.RestrictZeroTransactionAmountforCreditCardPayment(rec);
            end;
        }
        modify("Create &Warehouse Shipment")
        {
            trigger OnBeforeAction()
            var
                OrbusEventSubscribers: Codeunit "ORB Orbus Event & Subscribers";
            begin
                OrbusFunctions.RestrictZeroTransactionAmountforCreditCardPayment(rec);
            end;
        }
        modify("Create Inventor&y Put-away/Pick")
        {
            trigger OnBeforeAction()
            var
                OrbusEventSubscribers: Codeunit "ORB Orbus Event & Subscribers";
            begin
                OrbusFunctions.RestrictZeroTransactionAmountforCreditCardPayment(rec);
            end;
        }
        addafter("Release & Pick")
        {
            action("ORB Release & Inventory Pick")
            {
                Caption = 'Release & Pick(Inventory Picks)';
                ApplicationArea = all;
                Image = CreateWarehousePick;

                trigger OnAction()
                var
                    SalesHeaderRecLcl: Record "Sales Header";
                    EFTTransactionRecLcl: Record "EFT Transaction -CL-";
                    PaymentMethodLbl: label 'CREDITCARD';
                    NoValidCreditCardErrorLbl: Label 'No Valid Credit Card Authorization Charged, Please Authorize Valid Credit Card to Release Sales Order.';
                begin
                    CurrPage.SetSelectionFilter(SalesHeaderRecLcl);
                    SalesHeaderRecLcl.MarkedOnly(true);
                    IF SalesHeaderRecLcl.FindSet() then
                        repeat
                            OrbusFunctions.RestrictZeroTransactionAmountforCreditCardPayment(SalesHeaderRecLcl);
                            /*
                                if (SalesHeaderRecLcl."Shipping Agent Code" = '') and (SalesHeaderRecLcl."Shipping Agent Service Code" = '') then
                                    Error('Shipping Agent Code and Shipping Agent Service have a value of "blank". Both fields need a value other than "blank"');
                                if (SalesHeaderRecLcl."Shipping Agent Code" = '') then
                                    Error('Shipping Agent Code cannot have a value of "blank"');
                                if SalesHeaderRecLcl."Shipping Agent Service Code" = '' then
                                    Error('Shipping Agent Service Code cannot have a value of "blank"');
                            */
                            OrbusFunctions.CheckForShippingAgentCode(SalesHeaderRecLcl);
                            OrbusFunctions.CheckForShippingCollect(SalesHeaderRecLcl);
                            OrbusFunctions.CheckForSenderReceiverPaymentType(SalesHeaderRecLcl);
                        Until SalesHeaderRecLcl.Next() = 0;
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
        addafter("Release & Pick_Promoted")
        {
            actionref("Release & Inventory Pick_Promoted"; "ORB Release & Inventory Pick")
            {
            }
        }
        addafter("S&hipments")
        {
            action("ORB Sales Header Additional Fields")
            {
                Caption = 'Additional Fields';
                Image = RelatedInformation;
                ApplicationArea = all;
                RunObject = page "ORB Sales Header Add. Fields";
                RunPageLink = "Document Type" = field("Document Type"), "No." = field("No.");
            }
        }
        addfirst(processing)
        {
            action("ORB Update Versapay ID")
            {
                Caption = 'Update Versapay ID';
                Image = Edit;
                ApplicationArea = all;
                trigger OnAction()
                var
                    SalesOrderUpdate: Page "ORB Sales Order - Update";
                    UserSetupRec: Record "User Setup";
                    IsAuthorized: Boolean;
                begin
                    if UserSetupRec.Get(UserId) then
                        if UserSetupRec."ORB Versapay ID Edit Allowed" then begin
                            SalesOrderUpdate.LookupMode := true;
                            SalesOrderUpdate.SetRec(Rec);
                            SalesOrderUpdate.RunModal();
                        end else
                            Error('You do not have permission to edit the Versapay ID.');
                end;

            }
            action("ORB Post LIFT Inventory Transactions")
            {
                Image = Order;
                ApplicationArea = all;
                Caption = 'Post Inventory Transactions';

                trigger OnAction()
                var
                    SalesHeaderRecLcl: Record "Sales Header";
                begin
                    SalesHeaderRecLcl.Reset();
                    SalesHeaderRecLcl.SetRange("Document Type", rec."Document Type");
                    SalesHeaderRecLcl.SetRange("No.", Rec."No.");
                    if SalesHeaderRecLcl.FindFirst() then
                        Report.RunModal(Report::"ORB Post LIFT Transactions", true, false, SalesHeaderRecLcl);

                end;
            }
            action("ORB Get & Post LIFT Inventory Transactions")
            {
                Image = Order;
                ApplicationArea = all;
                Caption = 'Get & Post Inventory Transactions';
                Visible = false;

                trigger OnAction()
                var
                    LIFTSalesOrderInvTrans: Codeunit "LIFT Sales Order Inv. Trans";
                begin
                    if UserId <> 'BCADMIN' then
                        Error('Unauthorized access');

                    if not Confirm('Do you want to Proceed?', false) then
                        exit;

                    //Get all Inventory Transactions from LIFTERP
                    ClearLastError();
                    if not Codeunit.Run(Codeunit::"ORB LIFT Read Inv.Transactions") then;

                    Commit();


                    //Register Warehouse Item journals specific to Sales order
                    Codeunit.Run(Codeunit::"ORB LIFT Register Whse. Jnl.", rec);
                end;
            }
            action("ORB Run LIFT Warehouse Adjustments")
            {
                ApplicationArea = All;
                Caption = 'Run LIFT Warehouse Adjustments';
                Image = CalculateWarehouseAdjustment;
                Visible = false;

                trigger OnAction()
                var
                    LIFTCalcWhseAdjmt: Report "ORB LIFT Calculate Whse. Adj";
                    ItemJnlRecLcl: Record "Item Journal Line";
                    ItemNoLcl: Code[1024];
                    SalesLineRecLcl: Record "Sales Line";
                    ItemRecLcl: Record Item;
                    ItemRecTempLcl: Record Item temporary;
                    WarehouseEntryRecLcl: Record "Warehouse Entry";
                begin
                    if UserId <> 'BCADMIN' then
                        Error('Unauthorized access');

                    if not Confirm('Do you want to Proceed?', false) then
                        exit;

                    // Execute LIFT Calculate Warehouse Adjustment
                    Codeunit.Run(Codeunit::"ORB LIFT Calculate Whse. Adj.", rec);


                    // Post Warehouse Adjustments (Item journals)
                    Codeunit.Run(Codeunit::"ORB LIFT Post Adjustment Jnl.", rec);
                end;
            }
        }

    }

    var
        OrbusFunctions: Codeunit "ORB Functions";
        ORBCreateInventoryPick: Codeunit "ORB Create Inventory Pick";
        SendOrderConfirmationEmailLbl: Label 'Send Order Confirmation Email';
        LocationNotFoundlbl: Label 'Location is missing for this order: %1';
}