
pageextension 52661 "DSHIP Quick Label Worksheet" extends "DSHIP Quick Label Worksheet"
{
    // Commenting this to Test Address Validation Setups as per DSHIP(Matthew's Suggestion), 10-03-2025
    actions
    {
        modify(GetLabel)
        {

            trigger OnAfterAction()
            var
                SalesHeaderRec: Record "Sales Header";
                DshipQuickLabel: Page "DSHIP Quick Label Worksheet";
            begin
                if rec."Source Document" = rec."Source Document"::"Sales Order" then begin
                    CurrPage.Close();
                    if SalesHeaderRec.Get(SalesHeaderRec."Document Type"::Order, rec."Source No.") then
                        SetOrderBuffer(SalesHeaderRec);
                end;
            end;
        }
    }

    internal procedure SetOrderBuffer(currentOrder: Record "Sales Header")
    var
        DshipQuickLabel: Page "DSHIP Quick Label Worksheet";
        newOrderBuffer: Record "DSHIP Package Order Buffer" temporary;
    begin
        newOrderBuffer.Init();
        newOrderBuffer."Document Type" := newOrderBuffer."Document Type"::"Sales Order";
        newOrderBuffer."Document No." := currentOrder."No.";
        newOrderBuffer."Document Subtype" := currentOrder."Document Type";
        newOrderBuffer."Document Subtype" := currentOrder."Document Type".AsInteger();
        newOrderBuffer."Location Code" := currentOrder."Location Code";
        newOrderBuffer."Shipment Method Code" := currentOrder."Shipment Method Code";
        newOrderBuffer."Shipping Agent Code" := currentOrder."Shipping Agent Code";
        newOrderBuffer."Shipping Agent Service Code" := currentOrder."Shipping Agent Service Code";
        newOrderBuffer.Insert(false);
        DshipQuickLabel.SetOrder(newOrderBuffer);
        DshipQuickLabel.RunModal();
    end;

    var
        SingleInstanceCU: Codeunit "ORB Orbus Single Instance";
}
