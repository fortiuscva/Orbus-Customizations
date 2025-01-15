query 52605 "ORB LIFT Lot Numbers by Bin"
{
    Caption = 'LIFT Lot Numbers by Bin';
    OrderBy = ascending(Bin_Code);

    elements
    {
        dataitem(Warehouse_Entry; "Warehouse Entry")
        {
            DataItemTableFilter = "ORB LIFT Order Line ID" = filter(> 0);
            column(Location_Code; "Location Code") { }
            column(Item_No; "Item No.") { }
            column(Variant_Code; "Variant Code") { }
            column(Zone_Code; "Zone Code") { }
            column(Bin_Code; "Bin Code") { }
            column(Lot_No; "Lot No.") { }
            column(Serial_No; "Serial No.") { }
            column(Package_No; "Package No.") { }
            column(Unit_of_Measure_Code; "Unit of Measure Code") { }
            column(Sum_Qty_Base; "Qty. (Base)")
            {
                ColumnFilter = Sum_Qty_Base = filter(<> 0);
                Method = Sum;
            }
        }
    }
}

