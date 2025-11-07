query 53407 "ORB LIFT BinAvail Variant"
{
    Caption = 'BinAvail Variant';
    QueryType = API;
    APIPublisher = 'Orbus';
    APIGroup = 'Orbus';
    APIVersion = 'v2.0';
    EntityName = 'BinAvailVLIFT';
    EntitySetName = 'BinAvailVLIFT';

    elements
    {
        dataitem(BinContent; "Bin Content")
        {
            DataItemTableFilter =
                "Variant Code" = filter('<>'),
                "Bin Code" = filter('LIFT*');

            column(Item_No; "Item No.") { }
            column(Variant_Code; "Variant Code") { }
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
