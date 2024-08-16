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
            field("ORB Total Payment Amount"; Rec."ORB Total Payment Amount")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Total Payment Amount Field value';
                trigger OnAssistEdit()

                var
                    EFTTransactionCL: Record "EFT Transaction -CL-";
                begin
                    EFTTransactionCL.SetRange("Document Type", Rec."Document Type");
                    EFTTransactionCL.SetRange("Document No.", Rec."No.");
                    EFTTransactionCL.SetFilter("Transaction Status", 'Queued|Batched|Approved');
                    EFTTransactionCL.SetFilter("Method Type", 'Charge|Settle|Capture|Refund|Credit|Return Settle|Authorize|Return Authorize|Voice Authorize');
                    EFTTransactionCL.SetFilter("Expiration Filter", '<%1', WorkDate());
                    Page.RunModal(0, EFTTransactionCL);
                end;
            }
            field("ORB Freight Line"; Rec."ORB Freight Line")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the field Freight Line value';
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

        }
    }
    trigger OnAfterGetCurrRecord()
    var
        DSHIPShipmentOptions: Record "DSHIP Shipment Options";
        EFTTransactionCL: Record "EFT Transaction -CL-";
        TotalAmount: Decimal;
    begin
        if DSHIPShipmentOptions.Get(Rec."Document Type", Rec."No.") then
            Rec."ORB Freight Line" := DSHIPShipmentOptions."Add Freight Line";

        TotalAmount := 0;
        EFTTransactionCL.SetRange("Document Type", Rec."Document Type");
        EFTTransactionCL.SetRange("Document No.", Rec."No.");
        EFTTransactionCL.SetFilter("Transaction Status", 'Queued|Batched|Approved');
        EFTTransactionCL.SetFilter("Method Type", 'Charge|Settle|Capture|Refund|Credit|Return Settle|Authorize|Return Authorize|Voice Authorize');
        EFTTransactionCL.SetFilter("Expiration Filter", '<%1', WorkDate());
        if EFTTransactionCL.FindSet() then
            repeat
                TotalAmount += EFTTransactionCL."Total Amount";
            until EFTTransactionCL.Next() = 0;
        Rec."ORB Total Payment Amount" := TotalAmount;
        Rec.Modify();
    end;

}
