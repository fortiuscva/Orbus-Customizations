pageextension 52655 "Posted Sales Invoice Subform" extends "Posted Sales Invoice Subform"
{
    layout
    {
        addlast(Control1)
        {
            field("ORB Magento Artwork Job ID"; Rec."ORB Magento Artwork Job ID")
            {
                ApplicationArea = All;
                Caption = 'Magento Art ID';
                Tooltip = 'Specifies the value of the Magento Artwork Job ID field.';
                Editable = false;
            }
            field("ORB LIFT Step No."; Rec."ORB LIFT Step No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the LIFT Step No. field.', Comment = '%';
                Editable = false;
            }
        }
    }

}