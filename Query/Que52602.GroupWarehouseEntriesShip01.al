query 52602 "Group Warehouse Entries Ship01"
{
    Caption = 'Group Warehouse Entries Ship01';
    QueryType = Normal;

    elements
    {
        dataitem(Warehouse_Entry; "Warehouse Entry")
        {
            DataItemTableFilter = "Bin Code" = filter('SHIP01');
            filter(Registering_Date_Filter; "Registering Date")
            {
            }
            filter(Source_No_Filter; "Source No.")
            {
            }
            filter(Reference_No_Filter; "Reference No.")
            {
            }
            column(Source_Document; "Source Document")
            {
            }
            column(Source_No_; "Source No.")
            {
            }
            column(Source_Line_No_; "Source Line No.")
            {
            }
            column(Source_Subline_No_; "Source Subline No.")
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
            }
        }
    }
}
