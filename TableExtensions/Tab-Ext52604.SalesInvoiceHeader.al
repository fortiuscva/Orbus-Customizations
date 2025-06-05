tableextension 52604 "ORB Sales Invoice Header" extends "Sales Invoice Header"
{
    fields
    {
        field(52600; "ORB Email Sent by JQ"; Boolean)
        {
            Caption = 'Email Sent by JQ';
            DataClassification = CustomerContent;
        }
        field(52601; "ORB Last Email Sent DT"; DateTime)
        {
            Caption = 'Last JQ Email Sent Date & Time';
            DataClassification = CustomerContent;
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

        //field(52633 ; used on sales header.
        //field(52634 ; used on sales header.
        field(52653; "ORB Ship-to Contact Name (API)"; text[100])
        {
            Caption = 'Ship-to Contact Name (API)';
        }
        field(52654; "ORB Your Reference(CS)"; Text[41])
        {
            Caption = 'Your Reference(CS)';
            DataClassification = ToBeClassified;
        }
        field(52656; "ORB Customer Support"; Code[20])
        {
            Caption = 'Customer Support';
            DataClassification = CustomerContent;
            Editable = false;

        }
        field(52657; "ORB Business Development"; Code[20])
        {
            Caption = 'Business Development';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(52658; "ORB Order Status"; Enum OrderStatus)
        {
            Caption = 'Order Status';
            Editable = false;
            FieldClass = FlowField;
            calcformula = Lookup("Sales Header"."Order Status" where("No." = field("No.")));
        }
    }
}