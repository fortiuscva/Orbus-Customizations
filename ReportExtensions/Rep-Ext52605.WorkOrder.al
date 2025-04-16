reportextension 52605 "ORB Work Order" extends "Work Order"
{
    RDLCLayout = './Reports/Layouts/OrbusWorkOrder-CS.rdl';

    dataset
    {
        add("Sales Header")
        {
            column(ORB_Customer_Support; "ORB Customer Support")
            {

            }
        }
    }
}