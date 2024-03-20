query 52601 "ORB GroupPSIByCustomer"
{
    Caption = 'GroupPSIByCustomer';
    QueryType = Normal;

    elements
    {
        dataitem(SalesInvoiceHeader; "Sales Invoice Header")
        {
            column(Sell_to_Customer_No_; "Sell-to Customer No.")
            {

            }
            column(Amount_Including_VAT; "Amount Including VAT")
            {
                Method = Sum;
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
