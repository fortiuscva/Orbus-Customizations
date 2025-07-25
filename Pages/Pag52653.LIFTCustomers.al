page 52653 "ORB LIFT Customers"
{
    APIGroup = 'orbus';
    APIPublisher = 'orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'lIFTCustomers';
    DelayedInsert = true;
    EntityName = 'lIFTCustomersv2API';
    EntitySetName = 'lIFTCustomersv2API';
    PageType = API;
    SourceTable = "ORB LIFT Customers";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(customerNo; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }
            }
        }
    }
}
