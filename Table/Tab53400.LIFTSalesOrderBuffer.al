table 53400 "ORB LIFT Sales Order Buffer"
{
    Caption = 'LIFT Sales Order Buffer';
    ReplicateData = false;
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Enum "Sales Document Type")
        {
            Caption = 'Document Type';
        }
        field(2; "Sell-to Customer No."; Code[20])
        {
            Caption = 'Sell-to Customer No.';
            DataClassification = CustomerContent;
            NotBlank = true;
            TableRelation = Customer;
        }
        field(3; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(4; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
            DataClassification = CustomerContent;
            NotBlank = true;
            TableRelation = Customer;
        }
        field(5; "Bill-to Name"; Text[100])
        {
            Caption = 'Bill-to Name';
            DataClassification = CustomerContent;
            TableRelation = Customer.Name;
            ValidateTableRelation = false;
        }
        field(11; "Your Reference"; Text[35])
        {
            Caption = 'Versapay ID';
            DataClassification = CustomerContent;
        }
        field(12; "Ship-to Code"; Code[10])
        {
            Caption = 'Ship-to Code';
            DataClassification = CustomerContent;
            TableRelation = "Ship-to Address";
        }
        field(13; "Ship-to Name"; Text[100])
        {
            Caption = 'Ship-to Name';
        }
        field(14; "Ship-to Name 2"; Text[50])
        {
            Caption = 'Ship-to Name 2';
        }
        field(15; "Ship-to Address"; Text[100])
        {
            Caption = 'Ship-to Address';
        }
        field(16; "Ship-to Address 2"; Text[50])
        {
            Caption = 'Ship-to Address 2';
        }
        field(17; "Ship-to City"; Text[30])
        {
            Caption = 'Ship-to City';
            DataClassification = CustomerContent;
            TableRelation = if ("Ship-to Country/Region Code" = const('')) "Post Code".City
            else
            if ("Ship-to Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Ship-to Country/Region Code"));
            ValidateTableRelation = false;
        }
        field(18; "Ship-to Contact"; Text[100])
        {
            Caption = 'Ship-to Contact';
        }
        field(19; "Order Date"; Date)
        {
            Caption = 'Order Date';
        }
        field(20; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(21; "Shipment Date"; Date)
        {
            Caption = 'Shipment Date';
        }
        field(23; "Payment Terms Code"; Code[10])
        {
            Caption = 'Payment Terms Code';
            DataClassification = CustomerContent;
            TableRelation = "Payment Terms";
        }
        field(24; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(27; "Shipment Method Code"; Code[10])
        {
            Caption = 'Shipment Method Code';
            DataClassification = CustomerContent;
            TableRelation = "Shipment Method";
        }
        field(28; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            DataClassification = CustomerContent;
            TableRelation = Location;
        }
        field(29; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1),
                                                          Blocked = const(false));
        }
        field(30; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          Blocked = const(false));
        }
        field(34; "Customer Price Group"; Code[10])
        {
            Caption = 'Customer Price Group';
            DataClassification = CustomerContent;
            TableRelation = "Customer Price Group";
        }
        field(43; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser" where(Blocked = const(false));
        }
        field(84; "Sell-to Contact"; Text[100])
        {
            Caption = 'Sell-to Contact';
        }
        field(91; "Ship-to Post Code"; Code[20])
        {
            Caption = 'Ship-to Post Code';
            DataClassification = CustomerContent;
            TableRelation = if ("Ship-to Country/Region Code" = const('')) "Post Code"
            else
            if ("Ship-to Country/Region Code" = filter(<> '')) "Post Code" where("Country/Region Code" = field("Ship-to Country/Region Code"));
            ValidateTableRelation = false;
        }
        field(92; "Ship-to County"; Text[30])
        {
            Caption = 'Ship-to County';
        }
        field(93; "Ship-to Country/Region Code"; Code[10])
        {
            Caption = 'Ship-to Country/Region Code';
            DataClassification = CustomerContent;
            TableRelation = "Country/Region";
        }
        field(99; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(100; "External Document No."; Code[35])
        {
            Caption = 'External Document No.';
        }
        field(104; "Payment Method Code"; Code[10])
        {
            Caption = 'Payment Method Code';
            DataClassification = CustomerContent;
            TableRelation = "Payment Method";
        }
        field(105; "Shipping Agent Code"; Code[10])
        {
            Caption = 'Shipping Agent Code';
            DataClassification = CustomerContent;
            TableRelation = "Shipping Agent";
        }
        field(200; "Work Description"; Text[2048])
        {
            Caption = 'Work Description';
        }
        field(5052; "Sell-To Contact No."; Code[20])
        {
            Caption = 'Sell-To Contact No.';
            DataClassification = CustomerContent;
            TableRelation = Contact;
        }
        field(5750; "Shipping Advice"; Enum "Sales Header Shipping Advice")
        {
            Caption = 'Shipping Advice';
            DataClassification = CustomerContent;
        }
        field(5794; "Shipping Agent Service Code"; Code[10])
        {
            Caption = 'Shipping Agent Service Code';
            DataClassification = CustomerContent;
            TableRelation = "Shipping Agent Services".Code where("Shipping Agent Code" = field("Shipping Agent Code"));
        }
        field(50102; "Order Status"; enum OrderStatus)
        {
            Caption = 'Order Status';
        }
        field(50103; "Location Override"; Boolean)
        {
            Caption = 'Location Override';
        }
        field(50121; Created_By; Text[50])
        {
            Caption = 'Created_By';
        }
        field(50131; Rush; Boolean)
        {
            Caption = 'Rush';
        }
        field(52603; "ORB Customer Support"; Code[20])
        {
            Caption = 'Customer Support';
            TableRelation = "Salesperson/Purchaser" where(Blocked = const(false));
            DataClassification = CustomerContent;
        }
        field(52611; "ORB Declared Value"; Text[60])
        {
            Caption = 'Declared Value';
            DataClassification = CustomerContent;
        }
        field(52612; "ORB International Contact"; Text[50])
        {
            Caption = 'International Contact';
            DataClassification = CustomerContent;
        }
        field(52620; "ORB Magento Order #"; Text[20])
        {
            Caption = 'Magento Order #';
            DataClassification = CustomerContent;
        }
        field(52622; "ORB Magento CC 4 Digits"; Code[4])
        {
            Caption = 'Magento CC 4 Digits';
            DataClassification = ToBeClassified;
        }
        field(53400; "ORB LIFT ART_NOTE"; Text[2048])
        {
            Caption = 'LIFT ART_NOTE';
            DataClassification = CustomerContent;
        }
        field(53401; "ORB LIFT PRODUCTION_NOTE"; Text[2048])
        {
            Caption = 'LIFT PRODUCTION_NOTE';
            DataClassification = CustomerContent;
        }

        field(54102; "Sales Order Payment Type"; Option)
        {
            Caption = 'Sales Order Payment Type';
            DataClassification = CustomerContent;
            OptionCaption = 'None,Sender,Third Party,Receiver,Free';
            OptionMembers = "None","Sender","3rd Party","Receiver","Free";
        }
        field(54103; "SO Payment Account No."; Text[100])
        {
            Caption = 'Sales Order Payment Account No.';
            DataClassification = CustomerContent;
        }
        field(55113; "In-Hands Date"; Date)
        {
            Caption = 'In-Hands Date';
        }
        field(55118; "Created At"; DateTime)
        {
            Caption = 'Created At';
        }
        field(55119; "ORB LIFT Status"; enum "ORB LIFT Status")
        {
            Caption = 'LIFT Status';
            DataClassification = CustomerContent;
        }
        field(55120; "Payment Postal Code"; Code[50])
        {
            Caption = 'Payment Postal Code';
            DataClassification = CustomerContent;
        }
        field(55121; "Payment Province"; Code[50])
        {
            Caption = 'Payment Province';
            DataClassification = CustomerContent;
        }
        field(55122; "Payment Country Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(55123; "ORB LIFT Cancellation Status"; Integer)
        {
            Caption = 'LIFT Cancellation Status';
            DataClassification = CustomerContent;
        }
        field(55124; "ORB LIFT Total Lines Count"; Integer)
        {
            Caption = 'LIFT Total Lines Count';
            DataClassification = CustomerContent;
        }
        field(55125; "ORB LIFT Comment Lines Count"; Integer)
        {
            Caption = 'LIFT Comment Lines Count';
            DataClassification = CustomerContent;
        }
        field(55126; "ORB LIFT Item Lines Count"; Integer)
        {
            Caption = 'LIFT Item Lines Count';
            DataClassification = CustomerContent;
        }
        field(55132; "ORB LIFT Last Updated DateTime"; Text[30])
        {
            Caption = 'LIFT Last Updated DateTime';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Document Type", "No.")
        {
            Clustered = true;
        }
    }
}
