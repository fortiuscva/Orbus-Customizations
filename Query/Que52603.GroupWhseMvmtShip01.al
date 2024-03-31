query 52603 "ORB Group Whse. Mvmt. Ship01"
{
    Caption = 'Group Whse. Mvmt. Ship01';
    QueryType = Normal;

    elements
    {
        dataitem(Warehouse_Entry; "Warehouse Entry")
        {
            DataItemTableFilter = "Reference Document" = filter(Movement), "Bin Code" = const('SHIP01');
            filter(Registering_Date_Filter; "Registering Date")
            {
            }
            column(Item_No_; "Item No.")
            {
            }
            column(Variant_Code; "Variant Code")
            {
            }
            column(Location_Code; "Location Code")
            {
            }
            column(Bin_Code; "Bin Code")
            {
            }
            column(Qty___Base_; "Qty. (Base)")
            {
                Method = Sum;
                ReverseSign = true;
            }
        }
    }
}
