pageextension 53419 "ORB Case Card WSG" extends "Case Card WSG"
{
    layout
    {
        addafter("Must Arrive Date")
        {

            field("ORB Magento Result ID"; Rec."ORB Magento Result ID")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Magento Result ID field.', Comment = '%';
            }
        }
    }
}
