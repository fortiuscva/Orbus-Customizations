reportextension 52600 "ORB Standard Sales-Order Conf." extends "Standard Sales - Order Conf."
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
            column(ORBShipping_Agent_Service_Code; "Shipping Agent Service Code")
            {

            }
        }
    }
    var
        ShippingAgentCodeLblLcl: Label 'Shipping Agent Code';
        ShippingAgentServiceCodeLblLcl: Label 'Shipping Agent Service Code';
}