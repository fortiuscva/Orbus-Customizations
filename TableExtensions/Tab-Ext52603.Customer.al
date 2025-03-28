tableextension 52603 "ORB Customer" extends Customer
{
    fields
    {
        field(52600; "ORB Auto Send Email"; Boolean)
        {
            Caption = 'Auto Send Email';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                CustomReportSelectionRecLcl: Record "Custom Report Selection";
                CustomReportLayoutRecLcl: Record "Custom Report Layout";
            begin
                if rec."ORB Auto Send Email" then begin
                    CustomReportSelectionRecLcl.Reset();
                    CustomReportSelectionRecLcl.SetRange("Source Type", Database::Customer);
                    CustomReportSelectionRecLcl.SetRange("Source No.", rec."No.");
                    CustomReportSelectionRecLcl.SetRange(Usage, CustomReportSelectionRecLcl.Usage::"S.Invoice");
                    CustomReportSelectionRecLcl.FindFirst();

                    CustomReportSelectionRecLcl.Reset();
                    CustomReportSelectionRecLcl.SetRange("Source Type", Database::Customer);
                    CustomReportSelectionRecLcl.SetRange("Source No.", rec."No.");
                    CustomReportSelectionRecLcl.SetRange(Usage, CustomReportSelectionRecLcl.Usage::"S.Invoice");
                    if CustomReportSelectionRecLcl.FindSet() then
                        repeat
                            CustomReportSelectionRecLcl.TestField("Send To Email");
                            if CustomReportSelectionRecLcl."Use for Email Body" then begin
                                CustomReportSelectionRecLcl.TestField("Email Body Layout Code");
                                //Make sure layout selected is a Word Layout
                                CustomReportLayoutRecLcl.reset();
                                CustomReportLayoutRecLcl.setrange(Code, CustomReportSelectionRecLcl."Email Body Layout Code");
                                CustomReportLayoutRecLcl.FindFirst();
                                CustomReportLayoutRecLcl.TestField(Type, CustomReportLayoutRecLcl.Type::Word);
                            end;
                        until CustomReportSelectionRecLcl.Next() = 0;

                    //Show Warning if there is no custom layout selected on atlease one invoice document layout 
                    CustomReportSelectionRecLcl.Reset();
                    CustomReportSelectionRecLcl.SetRange("Source Type", Database::Customer);
                    CustomReportSelectionRecLcl.SetRange("Source No.", rec."No.");
                    CustomReportSelectionRecLcl.SetRange(Usage, CustomReportSelectionRecLcl.Usage::"S.Invoice");
                    CustomReportSelectionRecLcl.SetFilter("Custom Report Layout Code", '<>%1');
                    if not CustomReportSelectionRecLcl.FindFirst() then
                        if not Confirm('There is no document layout which is using a custom layout. Do you want still want to proceed?') then
                            Error(ProcessInterruptedLbl);
                end;
            end;
        }
        field(52601; "ORB Ship-to State"; Code[30])
        {
            Caption = 'Default State';
            CalcFormula = lookup("Ship-to Address".County where(Code = Field("Ship-to Code"), "Customer No." = Field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(52602; "ORB Regional Sales Executive"; Code[20])
        {
            Caption = 'Regional Sales Executive';
            TableRelation = "Salesperson/Purchaser" where(Blocked = const(false));
            DataClassification = CustomerContent;

        }
        field(52603; "ORB Customer Support"; Code[20])
        {
            Caption = 'Customer Support';
            TableRelation = "Salesperson/Purchaser" where(Blocked = const(false));
            DataClassification = CustomerContent;
        }

        field(52604; "ORB Business Development"; Code[20])
        {
            Caption = 'Business Development';
            TableRelation = "Salesperson/Purchaser" where(Blocked = const(false));
            DataClassification = CustomerContent;
        }
        field(52605; "ORB Year To Date Filter"; Date)
        {
            Caption = 'Year To Date Filter';
            FieldClass = FlowFilter;
        }
        field(52606; "ORB Total Sales - Fiscal Year"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Total Sales - Fiscal Year';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum("Cust. Ledger Entry"."Sales (LCY)" where("Customer No." = field("No."),
                                                                        "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                        "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                        "Posting Date" = field("ORB Year To Date Filter"),
                                                                         "Currency Code" = field("Currency Filter"),
                                                                         "Document Type" = Filter('Invoice|Credit Memo')));
        }


        field(52610; "ORB LIFT Customer"; boolean)
        {
            Caption = 'LIFT Customer';
            DataClassification = CustomerContent;
        }
        modify("Salesperson Code")
        {
            Caption = 'Key/National Account Manager';
        }
        field(52611; "ORB Previous Year Date Filter"; Date)
        {
            Caption = 'Year To Date Filter';
            FieldClass = FlowFilter;
        }
        field(52612; "ORB Previous Year Sales"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Total Sales - Fiscal Year';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum("Cust. Ledger Entry"."Sales (LCY)" where("Customer No." = field("No."),
                                                                        "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                        "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                        "Posting Date" = field("ORB Previous Year Date Filter"),
                                                                         "Currency Code" = field("Currency Filter"),
                                                                         "Document Type" = Filter('Invoice|Credit Memo')));
        }


    }


    var
        ProcessInterruptedLbl: Label 'Process has been interrupted to respect the warning.';


}