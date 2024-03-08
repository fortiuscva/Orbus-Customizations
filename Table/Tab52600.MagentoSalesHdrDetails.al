table 52600 "ORB Magento SalesHdr Details"
{
    Caption = 'Magento Sales Header Details';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; "Bill-to Contact"; Text[100])
        {
            Caption = 'Bill-to Contact';
        }
        field(3; "Sell-to Customer No."; Code[20])
        {
            Caption = 'Sell-to Customer No.';
            TableRelation = customer;
        }
        field(4; "Sell-to E-Mail"; Text[80])
        {
            Caption = 'Sell-to E-Mail';
        }
        field(5; "Magento Order #"; Text[20])
        {
            Caption = 'Magento Order #';
        }
        field(6; "Item No."; Code[20])
        {
            Caption = 'Item No.';
        }
        field(7; Quantity; Decimal)
        {
            Caption = 'Item No.';
        }
        field(8; "Magento Artwork Job ID"; Text[20])
        {
            Caption = 'Magento Artwork Job ID';
        }
        field(9; "Ship-to Contact"; Text[100])
        {
            Caption = 'Ship-to Contact';
        }
        field(10; "Ship-to Name"; Text[100])
        {
            Caption = 'Ship-to Name';
        }
        field(11; "Ship-to Address"; Text[100])
        {
            Caption = 'Ship-to Address';
        }
        field(12; "Ship-to-Address 2"; Text[50])
        {
            Caption = 'Ship-to-Address 2';
        }
        field(13; "Ship-to City"; Text[30])
        {
            Caption = 'Ship-to City';
            TableRelation = if ("Ship-to Country/Region Code" = const('')) "Post Code".City
            else
            if ("Ship-to Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Ship-to Country/Region Code"));
        }
        field(14; "Ship-to County"; Text[30])
        {
            Caption = 'Ship-to County';
        }
        field(15; "Ship-to Post Code"; Code[20])
        {
            Caption = 'Ship-to Post Code';
            TableRelation = if ("Ship-to Country/Region Code" = const('')) "Post Code"
            else
            if ("Ship-to Country/Region Code" = filter(<> '')) "Post Code" where("Country/Region Code" = field("Ship-to Country/Region Code"));
        }
        field(16; "Ship-to Country/Region Code"; Code[10])
        {
            Caption = 'Ship-to Country/Region Code';
            TableRelation = "Country/Region";

        }
        field(17; "Ship-to Phone No."; Text[30])
        {
            caption = 'Ship-to Phone No.';
        }
        field(18; "Magento CC 4 Digits"; Code[4])
        {
            caption = 'Magento CC 4 Digits';
        }
        field(19; "External Document No."; Code[35])
        {
            caption = 'External Document No.';
        }
        field(20; "In-Hands Date"; Date)
        {
            caption = 'In-Hands Date';
        }
        field(21; "Magento Direct to show Label"; text[100])
        {
            caption = 'Magento Direct to show Label';
        }
        field(22; "Shipping Agent Service Code"; Code[10])
        {
            Caption = 'Shipping Agent Service Code';
            TableRelation = "Shipping Agent Services".Code where("Shipping Agent Code" = field("Shipping Agent Code"));
        }
        field(23; "Shipping Agent Code"; Code[10])
        {
            Caption = 'Shipping Agent Code';
            TableRelation = "Shipping Agent";
        }
        field(24; "Shipment Date"; date)
        {
            Caption = 'Shipment Date';
        }
        field(25; "Location Code"; Code[20])
        {
            Caption = 'Location Code"';
            TableRelation = location;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
