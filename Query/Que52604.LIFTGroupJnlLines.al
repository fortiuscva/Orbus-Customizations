query 52604 "ORB LIFT Group Jnl. Lines"
{
    Caption = 'Group Lift Journal Lines';
    QueryType = Normal;
    OrderBy = ascending(Document_No_);

    elements
    {
        dataitem(Item_Journal_Line;
        "Item Journal Line")
        {
            DataItemTableFilter = "ORB LIFT Inv. Transaction ID" = filter('<> 0');
            filter(FilterJournal_Template_Name; "Journal Template Name")
            { }
            filter(FilterJournal_Batch_Name; "Journal Batch Name")
            { }

            filter(FilterORB_LIFT_Order_Line_ID; "ORB LIFT Order Line ID")
            { }
            column(Document_No_; "Document No.")
            { }
            column(ORB_LIFT_Order_Line_ID; "ORB LIFT Order Line ID")
            { }
            column(Quantity; Quantity)
            {
                Method = Sum;
            }
        }
    }
}
