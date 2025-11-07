query 53406 "ORB LIFT BinAvail Variant WIP"
{
    Caption = 'BinAvail Variant WIP';
    QueryType = API;
    APIPublisher = 'Orbus';
    APIGroup = 'Orbus';
    APIVersion = 'v2.0';
    EntityName = 'LIFTBinAvailVariantWIP';
    EntitySetName = 'LIFTBinAvailVariantWIP';

    elements
    {
        dataitem(BinContent; "Bin Content")
        {
            DataItemTableFilter =
                "Variant Code" = filter(<> ''),
                "Bin Code" = filter('LIFT*');

            column(Item_No; "Item No.") { }
            column(Location_Code; "Location Code") { }
            column(Quantity; Quantity) { Method = Sum; }

            dataitem(Item_Variant; "Item Variant")
            {
                DataItemLink = Code = BinContent."Variant Code", "Item No." = BinContent."Item No.";
                DataItemTableFilter = "ORB Material Id" = filter(<> 0), "ORB Storage Type Id" = filter(<> 0);
                column(Material_Id; "ORB Material Id") { }
                column(Storage_Type_Id; "ORB Storage Type Id") { }

                dataitem(Item; Item)
                {
                    DataItemLink = "No." = BinContent."Item No.";
                    column(ItemMaterial_Id; "ORB Material Id") { }

                }
            }

        }
    }
}
