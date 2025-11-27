query 53410 "ORB LIFT Sales Prices By Item"
{
    Caption = 'LIFT Sales Prices By Item';
    QueryType = Normal;

    elements
    {
        dataitem(LIFTSalesPrice; "ORB LIFT Sales Price")
        {
            column(ItemNo; "Item No.")
            {
            }
            column(To_Be_Processed; "To Be Processed")
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
