query 53409 "ORB Modified Sales Prices"
{
    Caption = 'ORB Modified Sales Prices';
    QueryType = Normal;

    elements
    {
        dataitem(SalesPrice; "Sales Price")
        {
            // DataItemTableFilter = "Item No." = filter('BLD-LT-400-1|HOP-2-10X3-S|ONT-800-S-KV');
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
