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
            column(ORBLocation_Code; "Location Code")
            {

            }
            column(ORBLocationCodeLblLcl; LocationCodeLblLcl)
            { }
        }
    }
    trigger OnPreReport()
    var
        OrbusSingleInstanceCU: Codeunit "ORB Orbus Single Instance";
    begin
        OrbusSingleInstanceCU.SetRunFromOrderConfirmation(true);
    end;

    trigger OnPostReport()
    var
        OrbusSingleInstanceCU: Codeunit "ORB Orbus Single Instance";
    begin
        OrbusSingleInstanceCU.SetRunFromOrderConfirmation(false);
    end;

    var
        ShippingAgentCodeLblLcl: Label 'Shipping Agent Code';
        ShippingAgentServiceCodeLblLcl: Label 'Shipping Agent Service Code';
        LocationCodeLblLcl: Label 'Location Code';
}