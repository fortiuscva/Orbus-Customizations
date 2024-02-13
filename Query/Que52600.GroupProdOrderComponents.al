query 52600 "Group Prod Order Components"
{
    Caption = 'Group Prod Order Components';
    QueryType = Normal;

    elements
    {
        dataitem(Prod__Order_Component; "Prod. Order Component")
        {
            filter(Status; Status)
            {

            }
            filter(FilterProd__Order_No_; "Prod. Order No.")
            {

            }
            filter(FilterProd__Order_Line_No_; "Prod. Order Line No.")
            {

            }
            column(Prod__Order_No_; "Prod. Order No.")
            {

            }
            column(Prod__Order_Line_No_; "Prod. Order Line No.")
            {

            }
            filter(BinCode; "Bin Code")
            {

            }
            column(Item_No_; "Item No.")
            {

            }
            column(Bin_Code; "Bin Code")
            {

            }
            column(Variant_Code; "Variant Code")
            {

            }
            column(Quantity; Quantity)
            {
                Method = Sum;
            }
        }
    }
}
