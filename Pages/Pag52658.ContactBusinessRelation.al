page 52658 "ORB Contact Business Relation"
{
    ApplicationArea = All;
    APIGroup = 'Orbus';
    APIPublisher = 'Orbus';
    APIVersion = 'v2.0';
    Caption = 'Contact Business Relation';
    PageType = API;
    EntityName = 'ORBContactBusinessRelation';
    EntitySetName = 'ORBContactBusinessRelation';
    DelayedInsert = true;
    SourceTable = "Contact Business Relation";


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(businessRelationCode; Rec."Business Relation Code")
                {
                    ToolTip = 'Specifies the business relation code.';
                }
                field(businessRelationDescription; Rec."Business Relation Description")
                {
                    ToolTip = 'Specifies the description for the business relation you have assigned to the contact. This field is not editable.';
                }
                field(contactName; Rec."Contact Name")
                {
                    ToolTip = 'Specifies the name of the contact company to which you assign a business relation. This field is not editable.';
                }
                field(contactNo; Rec."Contact No.")
                {
                    ToolTip = 'Specifies the contact number of the company you are assigning a business relation.';
                }
                field(linktoTable; Rec."Link to Table")
                {
                    ToolTip = 'Specifies the name of the table to which the contact is linked. There are four possible options: &lt;blank&gt;, Vendor, Customer, and Bank Account.';
                }
                field(no; Rec."No.")
                {
                    ToolTip = 'Specifies the number assigned to the contact in the Customer, Vendor, or Bank Account table. This field is only valid for contacts recorded as customer, vendor or bank accounts.';
                }
                field(systemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.', Comment = '%';
                }
            }
        }
    }
}
