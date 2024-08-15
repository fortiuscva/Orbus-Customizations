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
        }
        addlast(Control1)
        {
            field("ORB DS Payment Account No."; Rec."ORB DS Payment Account No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Payment Account No. field.', Comment = '%';
            }

            field("ORB DS Payment Type"; Rec."ORB DS Payment Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Payment Type field.', Comment = '%';
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
