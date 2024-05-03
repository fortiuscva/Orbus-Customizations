page 52614 "ORB Magento Sal. Hdr. Adl. Det"
{
    UsageCategory = Lists;
    APIGroup = 'orbus';
    APIPublisher = 'orbus';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'MagentoSalesHeaderAddlDetails';
    DelayedInsert = true;
    EntityName = 'MagentosalesHeaderAddlDetailsAPI';
    EntitySetName = 'MagentosalesHeaderAddlDetailsAPI';
    PageType = API;
    ModifyAllowed = true;
    DeleteAllowed = true;
    InsertAllowed = true;
    SourceTable = "Sales Header Additional Fields";
    Permissions = tabledata "Sales Header Additional Fields" = rmid;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(DocumentType; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field(No; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(DirecttoshowLabel; Rec."Direct to show Label")
                {
                    ToolTip = 'Specifies the value of the Direct to show Label field.';
                }
                field(Productiontimeline; Rec."Production timeline")
                {
                    ToolTip = 'Specifies the value of the Production timeline field.';
                }
                field(PaymentType; Rec."ORB Payment Type")
                {
                    ToolTip = 'Specifies the value of the Payment Type field.';
                }
                field(PaymentAccountNo; Rec."ORB Payment Account No.")
                {
                    ToolTip = 'Specifies the value of the Payment Account No. field.';
                }
                field(PaymentProvince; Rec."ORB Payment Province")
                {
                    ToolTip = 'Specifies the value of the Payment Province field.';
                }
                field(PaymentState; Rec."ORB Payment Province")
                {
                    ToolTip = 'Specifies the value of the Payment Province field.';
                }
                field(PaymentPostalCode; Rec."ORB Payment Postal Code")
                {
                    ToolTip = 'Specifies the value of the Payment Postal Code field.';
                }
                field(PaymentCountryCode; Rec."ORB Payment Country Code")
                {
                    ToolTip = 'Specifies the value of the Payment Country Code field.';
                }

            }
        }
    }
}
