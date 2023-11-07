reportextension 52602 "ORB Standard Sales - Invoice" extends "Standard Sales - Invoice"
{
    dataset
    {
        add(Header)
        {
            column(ORBShippingAgentCode_Lbl; ShippingAgentCodeLblLcl)
            {

            }
            column(ORBShippingAgentServiceCode_Lbl; ShippingAgentServiceCodeLblLcl)
            {

            }
            column(ORBShipping_Agent_Code; "Shipping Agent Code")
            {

            }
            column(ORBShipping_Agent_Service_Code; ShippingAgentServiceCodeVarGbl)
            {

            }
            column(ORBClick_to_Pay_URL__CL_Url; "Click-to-Pay URL -CL-")
            {

            }
            column(ORBClick_to_Pay_URL__CL_UrlText; 'PAY ONLINE!')
            {

            }
        }
        modify(Header)
        {
            trigger OnAfterAfterGetRecord()
            var
                ValueEntryRecLcl: Record "Value Entry";
                SalesInvLineRecLcl: Record "Sales Invoice Line";
                ItemLedgEntryRecLcl: Record "Item Ledger Entry";
                SalesShptHeader: Record "Sales Shipment Header";
            begin
                SalesInvLineRecLcl.Reset();
                SalesInvLineRecLcl.SetRange("Document No.", Header."No.");
                SalesInvLineRecLcl.SetRange(Type, SalesInvLineRecLcl.Type::Item);
                if SalesInvLineRecLcl.FindSet() then
                    repeat
                        if ShippingAgentServiceCodeVarGbl = '' then begin
                            ValueEntryRecLcl.Reset();
                            ValueEntryRecLcl.SetCurrentKey("Document No.");
                            ValueEntryRecLcl.SetRange("Document No.", SalesInvLineRecLcl."Document No.");
                            ValueEntryRecLcl.SetRange("Document Type", ValueEntryRecLcl."Document Type"::"Sales Invoice");
                            ValueEntryRecLcl.SetRange("Document Line No.", SalesInvLineRecLcl."Line No.");
                            if ValueEntryRecLcl.FindSet() then
                                repeat
                                    ItemLedgEntryRecLcl.Get(ValueEntryRecLcl."Item Ledger Entry No.");
                                    if ItemLedgEntryRecLcl."Document Type" = ItemLedgEntryRecLcl."Document Type"::"Sales Shipment" then
                                        if SalesShptHeader.Get(ItemLedgEntryRecLcl."Document No.") then
                                            ShippingAgentServiceCodeVarGbl := SalesShptHeader."Shipping Agent Service Code";

                                until ValueEntryRecLcl.Next() = 0;
                        end;
                    until SalesInvLineRecLcl.Next() = 0;
            end;
        }
    }
    var
        ShippingAgentServiceCodeVarGbl: Code[10];
        ShippingAgentCodeLblLcl: Label 'Shipping Agent Code';
        ShippingAgentServiceCodeLblLcl: Label 'Shipping Agent Service Code';
}