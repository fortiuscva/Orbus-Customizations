query 53405 "ORB LIFT BinAvail Non-WIP"
{
    Caption = 'BinAvail Non-WIP';
    QueryType = API;
    APIPublisher = 'Orbus';
    APIGroup = 'Orbus';
    APIVersion = 'v2.0';
    EntityName = 'LiftBinAvailNonWip';
    EntitySetName = 'LiftBinAvailNonWips';

    elements
    {
        dataitem(BinContent; "Bin Content")
        {
            DataItemTableFilter =
                "Variant Code" = filter(''),
                "Bin Code" = filter('..LIFF|LIFU..');

            column(Item_No; "Item No.") { }
            column(Location_Code; "Location Code") { }
            column(Quantity; Quantity) { Method = Sum; }

            dataitem(Item; Item)
            {
                DataItemLink = "No." = BinContent."Item No.";
                column(Material_Id; "ORB Material Id") { }
                column(Storage_Type_Id; "ORB Stroage Type Id") { }

                dataitem(Location; Location)
                {
                    DataItemLink = Code = BinContent."Location Code";
                    DataItemTableFilter = "ORB Location Id" = filter(<> 0);
                    column(Location_Id; "ORB Location Id") { }
                }
            }
        }
    }
}
