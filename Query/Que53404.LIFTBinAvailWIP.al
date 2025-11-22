query 53404 "ORB LIFT BinAvail WIP"
{
    Caption = 'BinAvail WIP';
    QueryType = API;
    APIPublisher = 'Orbus';
    APIGroup = 'Orbus';
    APIVersion = 'v2.0';
    EntityName = 'LiftBinAvailWip';
    EntitySetName = 'LiftBinAvailWips';

    elements
    {
        dataitem(BinContent; "Bin Content")
        {
            DataItemTableFilter =
                "Variant Code" = filter('');

            column(Item_No; "Item No.") { }
            column(Location_Code; "Location Code") { }

            column(Location_Id; "ORB Location Id") { }
            column(Material_Id; "ORB Item Material Id") { }
            column(Storage_Type_Id; "ORB Item Storage Type Id") { }
            column(Quantity; Quantity) { Method = Sum; }

        }
    }
}
