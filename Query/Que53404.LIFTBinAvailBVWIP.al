query 53404 "ORB LIFT BinAvail BV WIP"
{
    Caption = 'BinAvail BV WIP';
    QueryType = API;
    APIPublisher = 'Orbus';
    APIGroup = 'Orbus';
    APIVersion = 'v2.0';
    EntityName = 'BinAvailBVWIP';
    EntitySetName = 'BinAvailBVWIP';

    elements
    {
        dataitem(BinContent; "Bin Content")
        {
            DataItemTableFilter =
                "Variant Code" = filter(''),
                "Bin Code" = filter('<>LIFT*');

            column(Item_No; "Item No.") { }
            column(Bin_Code; "Bin Code") { }
            column(Quantity; Quantity) { Method = Sum; }

            dataitem(Item; Item)
            {
                DataItemLink = "No." = BinContent."Item No.";
                column(Material_Id; "ORB Material Id") { }
            }
        }
    }
}
