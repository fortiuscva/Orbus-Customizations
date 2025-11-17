query 53405 "ORB LIFT BinAvail Item Variant"
{
    Caption = 'Bin Availability Item Variant';
    QueryType = API;
    APIPublisher = 'Orbus';
    APIGroup = 'Orbus';
    APIVersion = 'v2.0';
    EntityName = 'LiftBinAvailabilityItemVariant';
    EntitySetName = 'LiftBinAvailabilityItemVariant';

    elements
    {
        dataitem(BinContent; "Bin Content")
        {
            DataItemTableFilter =
                "Variant Code" = filter(<> '');

            column(Item_No; "Item No.") { }
            column(Location_Code; "Location Code") { }
            column(Unit_of_Measure_Code; "Unit of Measure Code")
            { }

            column(Location_Id; "ORB Location Id") { }
            column(Bin_Location_Id; "ORB Bin Location Id") { }
            column(Material_Id; "ORB Item Material Id") { }
            column(Storage_Type_Id; "ORB Item Storage Type Id") { }
            column(Item_Var__Storage_Type_Id; "ORB Item Var. Storage Type Id") { }
            column(Quantity; "Quantity (Base)") { Method = Sum; }
            column(Qty_Conversion; "ORB Qty Conversion") { }

        }
    }
}
