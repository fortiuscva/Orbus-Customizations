tableextension 52603 "ORB Customer" extends Customer
{
    fields
    {
        field(52600; "ORB Auto Send Email"; Boolean)
        {
            Caption = 'Auto Send Email';
            DataClassification = CustomerContent;
        }
    }


}