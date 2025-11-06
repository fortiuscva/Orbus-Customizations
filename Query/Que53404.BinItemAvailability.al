query 53404 "ORB Bin Item Availability"
{
    Caption = 'Bin Item Availability';
    QueryType = API;

    APIPublisher = 'Orbus';
    APIGroup = 'Orbus';
    APIVersion = 'v2.0';
    EntityName = 'BinItemAvailability';
    EntitySetName = 'BinItemAvailability';

    elements
    {
        dataitem(Item; Item)
        {
            column(Item_No; "No.") { }
            column(Item_Description; Description) { }

            dataitem(ItemVariant; "Item Variant")
            {
                DataItemLink = "Item No." = Item."No.";
                column(Variant_Code; Code) { }

                dataitem(BinContent; "Bin Content")
                {
                    DataItemLink = "Item No." = Item."No.",
                                   "Variant Code" = ItemVariant.Code;

                    column(Location_Code; "Location Code") { }
                    column(Bin_Code; "Bin Code") { }
                    column(Quantity; Quantity) { Method = Sum; }

                    dataitem(Location; Location)
                    {
                        DataItemLink = Code = BinContent."Location Code";
                        column(Location_Name; Name) { }
                    }
                }
            }
        }
    }
}
