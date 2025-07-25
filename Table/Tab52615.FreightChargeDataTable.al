table 52615 "ORB FreightChargeDataTable"
{
    Caption = 'FreightChargeDataTable';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; RowNo; Integer)
        {
            Caption = 'Row No';
            DataClassification = ToBeClassified;
            //AutoIncrement = true;
        }
        field(2; Invoice; Code[20])
        {
            Caption = 'Invoice';
            DataClassification = ToBeClassified;
        }
        field(3; "Customer No"; Code[20])
        {
            Caption = 'Customer No';
            DataClassification = ToBeClassified;
        }
        field(4; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            DataClassification = ToBeClassified;
        }
        field(5; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = ToBeClassified;
        }
        field(6; "Order No"; Code[20])
        {
            Caption = 'Order No';
            DataClassification = ToBeClassified;
        }
        field(7; LocationCode; Code[10])
        {
            Caption = 'Location Code';
            DataClassification = ToBeClassified;
        }
        field(8; "Shipping Agent"; code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Shipping Agent Service"; Code[10])
        {
            Caption = 'Shipping Agent Service';
            DataClassification = ToBeClassified;
        }
        field(10; Package_Tracking_No_; code[30])
        {
            Caption = 'Package Tracking';
            DataClassification = ToBeClassified;
        }
        field(11; Case_No_; text[150])
        {
            Caption = 'Case No';
            DataClassification = ToBeClassified;
        }
        field(12; Invoiced_FRT_Charge; Decimal)
        {
            Caption = 'Invoiced FRT Charge';
            DataClassification = ToBeClassified;
        }
        field(13; LP_EasyPostFreightCost; Decimal)
        {
            Caption = 'LP EasyPostFreightCost';
            DataClassification = ToBeClassified;
        }
        field(14; Sales_Order_Payment_Type; text[35])
        {
            Caption = 'Sales Order Payment Type';
            DataClassification = ToBeClassified;
        }
        field(15; LicensepaymentType; text[35])
        {
            Caption = 'License Plate PaymentType';
            DataClassification = ToBeClassified;
        }
        field(16; LicenseplateFreightOption; text[35])
        {
            Caption = 'Licenseplate Freight Option';
            DataClassification = ToBeClassified;
        }
        field(17; Order_CreatedBy; text[35])
        {
            Caption = 'Order CreatedBy';
            DataClassification = ToBeClassified;
        }
        field(18; LicensePlate_ShipmentDate; text[35])
        {
            Caption = 'LicensePlate Shipment Date';
            DataClassification = ToBeClassified;
        }
        field(19; Your_Reference; text[45])
        {
            Caption = 'Your Reference';
            DataClassification = ToBeClassified;
        }
        field(20; ORB_Magento_Order; text[20])
        {
            Caption = 'Magento Order';
            DataClassification = ToBeClassified;
        }
        field(21; Handling; decimal)
        {
            Caption = 'Handling';
            DataClassification = ToBeClassified;
        }
        field(22; LicensePlateCount; Integer)
        {
            Caption = 'No of LicensePlates';
            DataClassification = ToBeClassified;
        }
        field(23; AccountNo; text[100])
        {
            Caption = 'AccountNo';
            DataClassification = ToBeClassified;
        }
        field(24; CreatedDate; datetime)
        {
            Caption = 'Created Date';
            DataClassification = ToBeClassified;
        }
        field(25; "No of License Plates"; Integer)
        {
            Caption = 'No of License Plates';
            DataClassification = ToBeClassified;
        }
        field(26; "Mark up%"; Decimal)
        {
            Caption = 'Mark up%';
            DataClassification = ToBeClassified;
        }
        field(27; "Markup Amount"; Decimal)
        {
            Caption = 'Markup Amount';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(Key1; RowNo)
        {
            Clustered = true;
        }
    }


}
