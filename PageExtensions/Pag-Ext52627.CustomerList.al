pageextension 52627 "ORB Customer List" extends "Customer List"
{
    layout
    {
        addlast(Control1)
        {
            field("ORB Ship-toStreetAddress"; StreetAddressVarGbl)
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Customer Street Address';
                Caption = 'Ship-to Street Address';

            }
            field("ORB Ship-to State"; Rec."ORB Ship-to State")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Filter By State';
                Caption = 'Ship-to State';

            }

            field("ORB Ship-to Zip"; ShiptoZipcodeVarGbl)
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Customer Street Address';
                Caption = 'Ship-to Street Address';

            }
            field("ORB Customer Support"; Rec."ORB Customer Support")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Customer Support';
                Caption = 'Customer Support';
            }
            field("ORB Regional Sales Executive"; Rec."ORB Regional Sales Executive")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Regional Sales Executive';
                Caption = 'Regional Sales Executive';
            }
            field("ORB Business Development"; Rec."ORB Business Development")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Business Development';
                Caption = 'Business Development';
            }
            field("ORB Key/National Account Manager"; Rec."Salesperson Code")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Key/National Account Manager refers to SalesPerson';
                Caption = 'Key/National Account Manager';
            }
            field("ORB Payment Terms Code"; Rec."Payment Terms Code")
            {
                Caption = 'Payment Terms Code';
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Payment Terms Code field.', Comment = '%';
            }
            field("ORB Tax Liable"; Rec."Tax Liable")
            {
                Caption = 'Tax Liable';
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Tax Liable field.', Comment = '%';
            }
            field("ORB Needs_Approval"; Rec.Needs_Approval)
            {
                Caption = 'Needs Approval';
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Needs Approval field.', Comment = '%';
            }
            field("ORB UPS Account Number"; Rec."UPS Account Number")
            {
                Caption = 'UPS Account Number';
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the UPS Account Number field.', Comment = '%';
            }
            field("ORB FedEx Account Number"; Rec."FedEx Account Number")
            {
                Caption = 'FedEx Account Number';
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the FedEx Account Number field.', Comment = '%';
            }
            field("ORB Channel Code"; Rec."Shortcut Dimension 5 Code")
            {
                Caption = 'Channel Code';
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Channel Code field.', Comment = '%';
            }
            field("ORB Customer Posting Group"; Rec."Customer Posting Group")
            {
                Caption = 'Customer Posting Group';
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Customer Posting Group field.', Comment = '%';
            }
            field("ORB Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
            {
                Caption = 'Gen. Bus. Posting Group';
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Gen. Bus. Posting Group field.', Comment = '%';
            }
            field("ORB Auto Send Email"; Rec."ORB Auto Send Email")
            {
                Caption = 'Auto Send Email';
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies Auto Send Email from JQ for the customer';
            }
            field("ORB First Invoice Date"; Rec."First Invoice Date")
            {
                Caption = 'First Invoice Date';
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'First Invoice Date';
            }
            field("ORB Needs Magento ID"; Rec."Needs Magento ID")
            {
                Caption = 'Needs Magento ID';
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Needs Magento ID field.', Comment = '%';
            }
            field("ORB Magento ID"; Rec."Magento ID")
            {
                Caption = 'Magento ID';
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Magento ID field.', Comment = '%';
            }
            field("ORB Magento Contact No."; Rec."Magento Contact No.")
            {
                Caption = 'Magento Contact No.';
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Magento Contact No. field.', Comment = '%';
            }
            field("ORB Magento Contact Name"; Rec."Magento Contact Name")
            {
                Caption = 'Magento Contact Name';
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Magento Contact Name field.', Comment = '%';
            }
            field("ORB Magento Contact Email"; Rec."Magento Contact Email")
            {
                Caption = 'Magento Contact Email';
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Magento Contact Email field.', Comment = '%';
            }
            field("ORB Last Invoice Date"; Rec."Last Invoice Date")
            {
                Caption = 'Last Invoice Date';
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Last Invoice Date';
            }
            field("ORB Document Sending Profile"; Rec."Document Sending Profile")
            {
                Caption = 'Document Sending Profile';
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Document Sending Profile field.', Comment = '%';
            }
        }
        addafter("Sales (LCY)")
        {
            field("ORB Total Sales - Fiscal Year"; Rec."ORB Total Sales - Fiscal Year")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Total Sales($) Year to date';
                Caption = 'Total Sales - Fiscal Year';
            }
            field("ORB Previous Year Sales"; Rec."ORB Previous Year Sales")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Previous Year Sales($)';
                Caption = 'Previous Year - Sales';
            }

        }

    }
    actions
    {
        addafter("Bank Accounts")
        {
            action("ORB Process LIFT Customers")
            {
                Image = Order;
                ApplicationArea = all;
                Caption = 'Process LIFT Customers';
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
                    LIFTIntegrationDataLogRecLcl.SetRange("Source Type", Database::Customer);
                    LIFTIntegrationDataLogRecLcl.SetRange("Source subtype", 0);
                    if LIFTIntegrationDataLogRecLcl.FindLast() then
                        LIFTIntegration.ParseData(LIFTERPSetupRecLcl."Customers API" + '&p1=' + LIFTIntegrationDataLogRecLcl."Source No.", LIFTAPICodes.GetCustomersAPICode())
                    else
                        LIFTIntegration.ParseData(LIFTERPSetupRecLcl."Customers API", LIFTAPICodes.GetCustomersAPICode());
                end;
            }
        }
    }

    Var
        StreetAddressVarGbl: Text;
        ShiptoZipcodeVarGbl: Text;

    trigger OnOpenPage()
    var
        FirstDayOfYearVarLcl: Date;
        PreYearStartDateLcl: Date;
        PreYearEndDateLcl: Date;

    begin
        FirstDayOfYearVarLcl := CALCDATE('<-CY>', today);
        PreYearStartDateLcl := DMY2Date(1, 1, Date2DMY(today(), 3) - 1);
        PreYearEndDateLcl := DMY2Date(31, 12, Date2DMY(today(), 3) - 1);
        Rec.SetRange("ORB Year To Date Filter", FirstDayOfYearVarLcl, Today);
        REc.SetRange("ORB Previous Year Date Filter", PreYearStartDateLcl, PreYearEndDateLcl);
        clear(IsLIFTERPFunctionEnabled);
        if LiftFunctions.IsLIFTERPSetupEnabled() and (LiftFunctions.IsGetCustomersAllowed()) then
            IsLIFTERPFunctionEnabled := true;
    end;

    trigger OnAfterGetRecord()
    Var
        ShiptoAddressRecLcl: Record "Ship-to Address";
    begin
        ShiptoAddressRecLcl.Reset();
        ShiptoAddressRecLcl.SetRange("Customer No.", Rec."No.");
        ShiptoAddressRecLcl.SetRange(Code, Rec."Ship-to Code");
        If ShiptoAddressRecLcl.FindFirst() then begin
            StreetAddressVarGbl := ShiptoAddressRecLcl.Address;
            ShiptoZipcodeVarGbl := ShiptoAddressRecLcl."Post Code";
        end else begin
            StreetAddressVarGbl := '';
            ShiptoZipcodeVarGbl := '';
        end;
    end;

    var
        LiftFunctions: Codeunit "ORB LIFT Functions";
        IsLIFTERPFunctionEnabled: Boolean;

}
