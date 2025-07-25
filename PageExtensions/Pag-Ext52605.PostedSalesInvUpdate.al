pageextension 52605 "ORB Posted Sales Inv. - Update" extends "Posted Sales Inv. - Update"
{
    layout
    {
        modify("Sell-to Customer Name")
        {
            Editable = true;
        }
        addafter("Sell-to Customer Name")
        {
            field("ORB Email Sent by JQ"; Rec."ORB Email Sent by JQ")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Email Sent by JQ for the invoice';
            }
            field("ORB Bill-to Name"; Rec."Bill-to Name")
            {
                ApplicationArea = All;
                Editable = true;
                ToolTip = 'Specifies the name of the customer that the invoice was sent to.';
            }

            field("ORB Ship-to Name"; Rec."Ship-to Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the name of the customer that the items were shipped to.';
            }
            field("ORB Sell-to E-Mail"; Rec."Sell-to E-Mail")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Email field.';
            }
            field("ORB External Document No."; Rec."External Document No.")
            {
                ApplicationArea = all;
            }
            field("ORB Delayed Ship Reason Code"; Rec."ORB Delayed Ship Reason Code")
            {
                ApplicationArea = All;
                Editable = true;
                ToolTip = 'Specifies reasons for delayed shipment';
            }
            field("ORB Delayed Ship Sub-Reason"; Rec."ORB Delayed Ship Sub-Reason")
            {
                ApplicationArea = All;
                Editable = true;
                ToolTip = 'Specifies the sub-reason code for Shipment Delay';
            }
            field("ORB Sell-to Contact"; Rec."Sell-to Contact")
            {
                ApplicationArea = all;
                Caption = 'Contact Name';
            }
            field("ORB Bill-to Contact"; Rec."Bill-to Contact")
            {
                ApplicationArea = all;
                Caption = 'Bill-to Contact';
            }
            field("ORB Sell-To Contact Name (Custom)"; Rec."Sell-To Contact Name (Custom)")
            {
                ApplicationArea = all;
                Caption = 'Sell-To Contact Name';
            }
            field("ORB WorkDescription"; WorkDescription)
            {
                ApplicationArea = all;
                MultiLine = true;
                Caption = 'Work Description';

                trigger OnValidate()
                begin
                    SetWorkDescription(WorkDescription);
                end;
            }
        }
    }
    trigger OnAfterGetRecord()
    var
        SalesInvHdr: Record "Sales Invoice Header";
    begin
        if SalesInvHdr.get(rec."No.") then
            WorkDescription := SalesInvHdr.GetWorkDescription();
    end;

    var
        WorkDescription: Text;

    procedure SetWorkDescription(NewWorkDescription: Text)
    var
        OutStream: OutStream;
    begin
        Clear(rec."Work Description");
        rec."Work Description".CreateOutStream(OutStream, TEXTENCODING::UTF8);
        OutStream.WriteText(NewWorkDescription);
        rec.Modify();
    end;
}
