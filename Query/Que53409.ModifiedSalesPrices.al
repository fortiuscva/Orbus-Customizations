query 53409 "ORB Modified Sales Prices"
{
    Caption = 'ORB Modified Sales Prices';
    QueryType = Normal;

    elements
    {
        dataitem(SalesPrice; "Sales Price")
        {
            column(ItemNo; "Item No.")
            {
            }
            column(MinimumQuantity; "Minimum Quantity")
            {
                Method = Sum;
            }
            filter(SystemModifiedAt; SystemModifiedAt)
            {
            }
        }
    }
}
