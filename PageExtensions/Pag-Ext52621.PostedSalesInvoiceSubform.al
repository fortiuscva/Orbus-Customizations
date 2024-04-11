pageextension 52621 "Posted Sales Invoice Subform" extends "Posted Sales Invoice Subform"
{
    layout
    {
        addlast(Control1)
        {
            field("ORB Magento Artwork Job ID"; Rec."ORB Magento Artwork Job ID")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the Magento Artwork Job ID of Sales';
            }
        }
    }
}
