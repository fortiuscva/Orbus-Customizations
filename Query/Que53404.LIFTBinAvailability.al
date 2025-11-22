query 53404 "ORB LIFT Bin Availability"
{
    Caption = 'Bin Availability';
    QueryType = API;
    APIPublisher = 'Orbus';
    APIGroup = 'Orbus';
    APIVersion = 'v2.0';
    EntityName = 'LiftBinAvailability';
    EntitySetName = 'LiftBinAvailability';

    elements
    {
        dataitem(BinContent; "Bin Content")
        {
            DataItemTableFilter =
                "Variant Code" = filter('');

            column(Item_No; "Item No.") { }
            column(Location_Code; "Location Code") { }
            column(Unit_of_Measure_Code; "Unit of Measure Code")
            { }

            column(Location_Id; "ORB Location Id") { }
            column(Material_Id; "ORB Item Material Id") { }
            column(Storage_Type_Id; "ORB Item Storage Type Id") { }
            column(Bin_Location_Id; "ORB Bin Location Id")
            { }
            column(Quantity; "Quantity (Base)") { Method = Sum; }
            column(Qty_Conversion; "ORB Qty Conversion") { }

        }
    }
}
