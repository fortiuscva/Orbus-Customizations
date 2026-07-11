query 53409 "ORB Modified Sales Prices"
{
    Caption = 'ORB Modified Sales Prices';
    QueryType = Normal;

    elements
    {
        dataitem(PriceListLine; "Price List Line")
        {
            DataItemTableFilter = "Price Type" = const(Sale);
            column(ItemNo; "Asset No.")
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