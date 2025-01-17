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
    begin
        FirstDayOfYearVarLcl := CALCDATE('<-CY>', today);
        Rec.SetRange("ORB Year To Date Filter", FirstDayOfYearVarLcl, Today);

        IsLIFTERPFunctionEnabled := true;
        if LiftFunctions.IsLIFTERPSetupEnabled() and (LiftFunctions.IsGetCustomersAllowed()) then
            IsLIFTERPFunctionEnabled := false;
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
