table 53415 "ORB Case Buffer"
{
    Caption = 'Case Buffer';
    LookupPageId = "ORB Case Log";
    DrillDownPageId = "ORB Case Log";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
            DataClassification = CustomerContent;
        }
        field(4; "Document Type"; Enum LookupTypeNew)
        {
            Caption = 'Document Type';
            DataClassification = CustomerContent;
        }
        field(5; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
        }
        field(7; "Case No."; Code[20])
        {
            Caption = 'Case No.';
            DataClassification = CustomerContent;
        }
        field(8; "Entity Type"; Enum "Entity Type WSG")
        {
            Caption = 'Entity Type';
            DataClassification = CustomerContent;
        }
        field(9; "Entity No."; Code[20])
        {
            Caption = 'Entity No.';
            TableRelation = if ("Entity Type" = const(Customer)) Customer else if ("Entity Type" = const(Vendor)) Vendor;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(10; "Entity Name"; Text[100])
        {
            Caption = 'Entity Name';
            DataClassification = CustomerContent;
        }
        field(13; "Contact Name"; Text[100])
        {
            Caption = 'Contact Name';
            DataClassification = CustomerContent;
        }
        field(15; "Contact Email"; Text[80])
        {
            Caption = 'Contact Email';
            DataClassification = CustomerContent;
        }
        field(17; "Contact Phone"; Text[30])
        {
            Caption = 'Contact Phone';
            DataClassification = CustomerContent;
        }
        field(19; "External Document No."; Code[20])
        {
            Caption = 'External Document No.';
            DataClassification = CustomerContent;
        }
        field(21; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(23; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = CustomerContent;
        }
        field(25; "Customer Complaint"; Text[100])
        {
            Caption = 'Customer Complaint';
            TableRelation = CustomerComplaint;
            DataClassification = CustomerContent;
        }
        field(27; "Customer Expectation"; Text[100])
        {
            Caption = 'Customer Expectation';
            TableRelation = CustomerExpectation;
            DataClassification = CustomerContent;
        }
        field(29; "Describe Issue"; Text[2048])
        {
            Caption = 'Describe Issue';
            DataClassification = CustomerContent;
        }
        field(31; Link; Text[2048])
        {
            Caption = 'Link';
            DataClassification = CustomerContent;
        }
        field(32; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(33; "Must Arrive Date"; Date)
        {
            Caption = 'Must Arrive Date';
            DataClassification = CustomerContent;
        }
        field(35; "Ship-to Name"; Text[100])
        {
            Caption = 'Ship-to Name';
            DataClassification = CustomerContent;
        }
        field(37; "Ship-to Contact"; Text[100])
        {
            Caption = 'Ship-to Contact';
            DataClassification = CustomerContent;
        }
        field(39; "Ship-to Address"; Text[100])
        {
            Caption = 'Ship-to Address';
            DataClassification = CustomerContent;
        }
        field(41; "Ship-to Address 2"; Text[50])
        {
            Caption = 'Ship-to Address 2';
            DataClassification = CustomerContent;
        }
        field(43; City; Text[30])
        {
            Caption = 'City';
            DataClassification = CustomerContent;
        }
        field(45; State; Text[30])
        {
            Caption = 'State';
            DataClassification = CustomerContent;
        }
        field(47; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            DataClassification = CustomerContent;
        }
        field(50; "Magento Result ID"; Code[20])
        {
            Caption = 'Magento Result ID';
            DataClassification = CustomerContent;
        }
        field(53; Status; enum "Case Statuses WSG")
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Entry No.", "Case No.", "Entity No.", "Entity Name")
        {

        }
    }
}
