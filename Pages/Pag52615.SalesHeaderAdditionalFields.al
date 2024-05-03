page 52615 "Sales Header Additional Fields"
{
    ApplicationArea = All;
    Caption = 'Sales Header Additional Fields';
    PageType = Document;
    SourceTable = "Sales Header Additional Fields";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Direct to show Label"; Rec."Direct to show Label")
                {
                    ToolTip = 'Specifies the value of the Direct to show Label field.';
                }
                field("Production timeline"; Rec."Production timeline")
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