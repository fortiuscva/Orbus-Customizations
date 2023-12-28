page 52604 "ORB APISalesHeaderDetailsV2"
{
    APIGroup = 'orbus';
    APIPublisher = 'orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'orbapiSalesHeaderDetailsV2';
    DelayedInsert = true;
    EntityName = 'salesHeaderDetailsv2API';
    EntitySetName = 'salesHeaderDetailsv2API';
    ODataKeyFields = SystemId;
    PageType = API;
    SourceTable = "Sales Header";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(systemId; Rec.SystemId)
                {
                    Caption = 'systemId', Locked = true;
                }
                field(documentType; Rec."Document Type")
                {
                    Caption = 'documentType', Locked = true;
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(sellToCustomerName; Rec."Sell-to Customer Name")
                {
                    Caption = 'Sell-to Customer Name';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }
                field(approvalDeadline; ApprovalDeadlineTxt)
                {
                    Caption = 'Approval Deadline';
                }
                field(inHandsDate; InHandsDateTxt)
                {
                    Caption = 'In-Hands Date';
                }
                field(externalDocumentNo; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
                }
                field(yourReference; Rec."Your Reference")
                {
                    Caption = 'Your Reference';
                }
                field(assignedUserID; Rec."Assigned User ID")
                {
                    Caption = 'Assigned User ID';
                }
                field(needsApproval; Rec.Needs_Approval)
                {
                    Caption = 'Needs Approval';
                }
                field(artEmail; Rec."Art Email")
                {
                    Caption = 'Art Email';
                }
                field(graphicsOnly; Rec."Graphics Only")
                {
                    Caption = 'Graphics Only';
                }
                field(custom; Rec.Custom)
                {
                    Caption = 'Custom';
                }
                field(rush; Rec.Rush)
                {
                    Caption = 'Rush';
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }
                field(shipmentDate; ShipmentDateTxt)
                {
                    Caption = 'Shipment Date';

                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Clear(ApprovalDeadline);
        Clear(InHandsDate);
        clear(ShipmentDate);

        Evaluate(ApprovalDeadline, Format(rec."Approval Deadline", 0, '<Month,2>/<Day,2>/<Year4>'));
        Evaluate(InHandsDate, Format(rec."In-Hands Date", 0, '<Month,2>/<Day,2>/<Year4>'));
        Evaluate(ShipmentDate, Format(rec."Shipment Date", 0, '<Month,2>/<Day,2>/<Year4>'));
        Evaluate(ApprovalDeadlineTxt, Format(rec."Approval Deadline", 0, '<Month,2>/<Day,2>/<Year4>'));
        Evaluate(InHandsDateTxt, Format(rec."In-Hands Date", 0, '<Month,2>/<Day,2>/<Year4>'));
        Evaluate(ShipmentDateTxt, Format(rec."Shipment Date", 0, '<Month,2>/<Day,2>/<Year4>'));

    end;

    var
        ApprovalDeadline: Date;
        InHandsDate: Date;
        ShipmentDate: Date;
        ApprovalDeadlineTxt: text;
        InHandsDateTxt: text;
        ShipmentDateTxt: text;


}
