tableextension 52611 "ORB Sales Header" extends "Sales Header"
{
    fields
    {
        modify("Order Status")
        {
            trigger OnAfterValidate()
            var
                salesHeader: Record "Sales Header";
                ORBFunctions: codeunit "ORB Functions";
            begin
                if Rec."Location Code" = '' then
                    Error(LocationNotFoundlbl, Rec."No.");

                if Xrec."Order Status" = Xrec."Order Status"::Draft then begin
                    ORBFunctions.SendOrderConfirmationEmailItem(Rec, false);

                    salesHeader.get(Rec."Document Type"::Order, Rec."No.");
                    salesHeader."Order Status" := Rec."Order Status";
                    Rec := salesHeader;
                end;
            end;
        }

        field(52610; "ORB Tax ID"; Code[20])
        {
            Caption = 'Tax ID';
            DataClassification = ToBeClassified;
        }
        field(52611; "ORB Declared Value"; Text[60])
        {
            Caption = 'Declared Value';
            DataClassification = ToBeClassified;
        }
        field(52612; "ORB International Contact"; Text[50])
        {
            Caption = 'International Contact';
            DataClassification = ToBeClassified;
        }
        field(52620; "ORB Magento Order #"; Text[20])
        {
            Caption = 'Magento Order #';
            DataClassification = ToBeClassified;
        }
        // field(52621; "ORB Magento Artwork Job ID"; Text[20])
        // {
        //     Caption = 'Magento Artwork Job ID';
        //     DataClassification = ToBeClassified;
        // }
        field(52622; "ORB Magento CC 4 Digits"; Code[4])
        {
            Caption = 'Magento CC 4 Digits';
            DataClassification = ToBeClassified;
        }
        field(52623; "ORB Magento Location Code"; Code[10])
        {
            Caption = 'Magento Location Code';
            TableRelation = Location;
            DataClassification = ToBeClassified;
        }
        field(52624; "ORB Require Review"; Boolean)
        {
            Caption = 'Require Review';
            DataClassification = ToBeClassified;
        }
        field(52625; "ORB Last Followup By"; Code[20])
        {
            Caption = 'Last Followup By';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = CustomerContent;
        }
        field(52626; "ORB RUSH"; Text[20])
        {
            Caption = 'RUSH';
            DataClassification = CustomerContent;
            TableRelation = Priority;
        }

        field(52627; "ORB Shipment Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(52628; "ORB Escalation Reason Code"; Code[20])
        {
            Caption = 'Escalation Reason Code';
            DataClassification = CustomerContent;
            TableRelation = "ORB Escalation Reason Codes".Code;
        }
        field(52629; "ORB Resolved By"; Code[20])
        {
            Caption = 'Resolved By';
            DataClassification = CustomerContent;
            TableRelation = User."User Name";
            ValidateTableRelation = false;
            trigger OnValidate()
            var
                UserSelectionCULcl: Codeunit "User Selection";
            begin
                UserSelectionCULcl.ValidateUserName("ORB Resolved By");
            end;
        }
        field(52630; "ORB Original Promised Ship Dt."; Date)
        {
            Caption = 'Original Promised Shipment Date';
            DataClassification = CustomerContent;
        }
        field(52631; "ORB Delayed Ship Reason Code"; Code[20])
        {
            Caption = 'Delayed Shipment Reason Code';
            DataClassification = CustomerContent;
            TableRelation = "Case Reason Code WSG";
            trigger OnValidate()
            begin
                if (xRec."ORB Delayed Ship Reason Code" <> Rec."ORB Delayed Ship Reason Code") then
                    clear(Rec."ORB Delayed Ship Sub-Reason");
            end;
        }
        field(52632; "ORB Delayed Ship Sub-Reason"; Code[100])
        {
            Caption = 'Delayed Shipment Sub-Reason Code';
            DataClassification = CustomerContent;
            trigger OnLookup()
            var
                CaseReasonDetailRecLcl: Record CaseReasonDetail;
            begin
                CaseReasonDetailRecLcl.Reset;
                CaseReasonDetailRecLcl.SetFilter("Reason Code", Rec."ORB Delayed Ship Reason Code");
                if Page.RunModal(Page::CaseReasonDetailList, CaseReasonDetailRecLcl) = Action::LookupOK then
                    Rec."ORB Delayed Ship Sub-Reason" := CaseReasonDetailRecLcl.Code;
            end;

            trigger OnValidate()
            var
                CaseReasonDetailRecLcl: Record CaseReasonDetail;
                SubReasonCodeLbl: Label 'Not a valid sub-reason code  for the selected  reason code';
            begin
                CaseReasonDetailRecLcl.Reset();
                CaseReasonDetailRecLcl.Setfilter("Reason Code", Rec."ORB Delayed Ship Reason Code");
                CaseReasonDetailRecLcl.SetFilter(Code, Rec."ORB Delayed Ship Sub-Reason");
                If not CaseReasonDetailRecLcl.FindFirst() then
                    Error(SubReasonCodeLbl);
            end;

        }
        field(52633; "ORB DS Payment Type"; Option)
        {
            Caption = 'DS Payment Type';
            FieldClass = FlowField;
            CalcFormula = lookup("DSHIP Package Options"."Payment Type" where("Document Type" = filter("Sales Order"), "Document No." = field("No.")));
            OptionMembers = " ",SENDER,THIRD_PARTY,RECEIVER,COLLECT;
            OptionCaption = 'None,Sender,Third Party,Receiver,Collect';
            Editable = false;
        }
        field(52634; "ORB DS Payment Account No."; Text[100])
        {
            Caption = 'DS Payment Account No.';
            FieldClass = FlowField;
            CalcFormula = lookup("DSHIP Package Options"."Payment Account No." where("Document Type" = filter("Sales Order"), "Document No." = field("No.")));
            Editable = false;
        }
        field(52650; "ORB Total Payment Amount"; Decimal)
        {
            Caption = 'Total Payment Amount';
            FieldClass = FlowField;
            CalcFormula = sum("EFT Transaction -CL-"."Total Amount" where("Transaction Status" = filter(Queued | Batched | Approved), "Document Type" = field("Document Type"), "Document No." = field("No."), "Method Type" = filter(Charge | Settle | Capture | Refund | Credit | Authorize | "Return Settle" | "Return Authorize" | "Voice Authorize")));
            Editable = false;
        }
        field(52651; "ORB Freight Line"; Option)
        {
            FieldClass = FlowField;
            CalcFormula = lookup("DSHIP Shipment Options"."Add Freight Line" where("Document Type" = filter("Sales Order"), "Document No." = field("No.")));
            OptionMembers = Automatic,Manual;
            Caption = 'Freight Line';
            Editable = false;
        }
        field(52652; "ORB Lift Order"; Boolean)
        {
            Caption = 'Lift Order';
        }
        field(52653; "ORB Ship-to Contact Name (API)"; text[100])
        {
            Caption = 'Ship-to Contact Name (API)';
        }
        field(52653; "ORB Your Reference(CS)"; Text[41])
        {

            Caption = 'Your Reference(CS)';
            DataClassification = ToBeClassified;

        }
    }

    trigger OnDelete()
    var
        SalesHeaderAdditionalFields: Record "ORB Sales Header Add. Fields";
    begin
        if SalesHeaderAdditionalFields.Get(Rec."Document Type", Rec."No.") then
            SalesHeaderAdditionalFields.Delete(true);
    end;

    trigger OnAfterInsert()
    var
        contactRecLcl: Record Contact;
        ShippinAgenetCode: Code[10];
        ShippingAgentServiceCode: Code[20];

    begin
        if GuiAllowed then
            exit;

        if "ORB Magento Location Code" <> '' then
            Rec.Validate("Location Code", "ORB Magento Location Code");
        if "ORB Shipment Date" <> 0D then
            Rec.Validate("Shipment Date", "ORB Shipment Date");
        ShippinAgenetCode := Rec."Shipping Agent Code";
        ShippingAgentServiceCode := Rec."Shipping Agent Service Code";
        Rec.Validate("Ship-to Code", '');
        Rec.Validate("Ship-to Name", Rec."Ship-to Name (Custom)");
        Rec."Ship-to Address" := Rec."Ship-to Address (Custom)";
        rec."Ship-to Address 2" := Rec."Ship-to Address 2 (Custom)";
        rec."Ship-to City" := Rec."Ship-to City (Custom)";
        Rec."Ship-to Post Code" := Rec."Ship-To Post Code (Custom)";
        Rec."Ship-to County" := Rec."Ship-To County (Custom)";
        Rec."Ship-to Country/Region Code" := Rec."Ship-To CountryRegion (Custom)";
        Rec.Validate("Shipping Agent Code", ShippinAgenetCode);
        Rec.Validate("Shipping Agent Service Code", ShippingAgentServiceCode);

        if "Sell-To Contact No. (Custom)" <> '' then begin
            contactRecLcl.SetRange("No.", "Sell-To Contact No. (Custom)");
            if contactRecLcl.FindFirst() then begin
                Rec."Sell-To Contact No. (Custom)" := contactRecLcl."No.";
                Rec."Sell-to Contact No." := contactRecLcl."No.";
                Rec."Sell-To Email (Custom)" := contactRecLcl."E-Mail";
                Rec."Sell-to E-Mail" := contactRecLcl."E-Mail";
                Rec."Sell-To Phone No. (Custom)" := contactRecLcl."Phone No.";
                Rec."Sell-to Phone No." := contactRecLcl."Phone No.";
                Rec."Sell-To Contact Name (Custom)" := contactRecLcl.Name;
                Rec."Sell-to Contact" := contactRecLcl.Name;
                Rec."Bill-to Contact No." := contactRecLcl."No.";
                Rec."Bill-to Contact" := contactRecLcl.Name;
                Rec."Ship-to Contact" := contactRecLcl.Name;
            end;
        end;
        if (Rec."ORB Ship-to Contact Name (API)" <> '') then
            Rec."Ship-to Contact" := Rec."ORB Ship-to Contact Name (API)";
        Rec.Modify();
    end;

    var
        LocationNotFoundlbl: Label 'Location is missing for this order: %1';
}
