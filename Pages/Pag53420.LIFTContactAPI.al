page 53420 "ORB LIFT Contact API"
{
    APIGroup = 'Orbus';
    APIPublisher = 'Orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'liftContactAPI';
    DelayedInsert = true;
    EntityName = 'LIFTContactAPI';
    EntitySetName = 'LIFTContactAPI';
    PageType = API;
    SourceTable = "ORB LIFT Contact";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(customerNo; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                }
                field(customerName; Rec."Customer Name")
                {
                    Caption = 'Customer Name';
                }
                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                }
                field(eMail; Rec."E-Mail")
                {
                    Caption = 'E-Mail';
                }
                field(firstName; Rec."First Name")
                {
                    Caption = 'First Name';
                }
                field(lastName; Rec."Last Name")
                {
                    Caption = 'Last Name';
                }
                field(type; Rec."Type")
                {
                    Caption = 'Type';
                }
                field(mobilePhoneNumber; Rec."Mobile Phone No.")
                {
                    Caption = 'Mobile Phone No.';
                }
                field(Active; Rec.Active)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        LIFTContactMgmt.PropagateOnContactInsert(Rec);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        LIFTContactMgmt.PropagateOnContactModify(Rec);
    end;

    var
        LIFTContactMgmt: Codeunit "ORB LIFT Contact Mgmt";
}
