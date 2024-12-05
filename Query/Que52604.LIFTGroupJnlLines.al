query 52604 "ORB LIFT Group Jnl. Lines"
{
    Caption = 'Group Lift Journal Lines';
    QueryType = Normal;

    elements
    {
        dataitem(Item_Journal_Line; "Item Journal Line")
        {
            DataItemTableFilter = "Journal Template Name" = const('ITEM'), "Journal Batch Name" = const('LIFTERP');
            filter(FilterJournal_Template_Name; "Journal Template Name")
            { }
            filter(FilterJournal_Batch_Name; "Journal Batch Name")
            { }
            filter(FilterORB_LIFT_Inv__Transaction_ID; "ORB LIFT Inv. Transaction ID")
            { }
            filter(FilterORB_LIFT_Order_Line_ID; "ORB LIFT Order Line ID")
            { }
            column(Document_No_; "Document No.")
            { }
            column(ORB_LIFT_Inv__Transaction_ID; "ORB LIFT Inv. Transaction ID")
            { }
            column(Quantity; Quantity)
            {
                Method = Sum;
            }
        }
    }
}
