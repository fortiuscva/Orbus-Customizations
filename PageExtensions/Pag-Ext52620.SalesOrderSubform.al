pageextension 52623 "ORB Sales Order Subform" extends "Sales Order Subform"
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
