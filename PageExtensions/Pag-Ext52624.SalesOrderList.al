pageextension 52624 "ORB Sales Order List" extends "Sales Order List"
{
    layout
    {
        addafter("No.")
        {
            field("ORB Magento Order #"; Rec."ORB Magento Order #")
            {
                ApplicationArea = all;
                ToolTip = 'Magento Order #';
            }
            field("ORB Sales Order Payment Type"; Rec."Sales Order Payment Type")
            {
                ApplicationArea = all;
                ToolTip = 'Sales Order Payment Type';
            }
            field("ORB Total Payment Amount($)"; Rec."ORB Total Payment Amount($)")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        addlast("O&rder")
        {
            action("ORB Sales Header Additional Fields")
            {
                Caption = 'Additional Fields';
                Image = RelatedInformation;
                ApplicationArea = all;
                RunObject = page "ORB Sales Header Add. Fields";
                RunPageLink = "Document Type" = field("Document Type"), "No." = field("No.");
            }

        }
    }
}
