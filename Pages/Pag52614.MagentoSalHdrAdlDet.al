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
            }
        }
    }
}
