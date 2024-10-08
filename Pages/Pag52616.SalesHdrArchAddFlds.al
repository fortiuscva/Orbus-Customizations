page 52616 "ORB Sales Hdr Arch. Add. Flds"
{
    ApplicationArea = All;
    Caption = 'Sales Header Arch. Additional Fields';
    PageType = Document;
    SourceTable = "ORB Sales Hdr. Arch. Add. Flds";
    UsageCategory = Documents;
    Editable = false;

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
                field("Payment Type"; Rec."Payment Type")
                {
                    ToolTip = 'Specifies the value of the Payment Type field.';
                }
                field("Payment Account No."; Rec."Payment Account No.")
                {
                    ToolTip = 'Specifies the value of the Payment Account No. field.';
                }
                field("Payment Province"; Rec."Payment Province")
                {
                    ToolTip = 'Specifies the value of the Payment Province field.';
                }

                field("Payment Postal Code"; Rec."Payment Postal Code")
                {
                    ToolTip = 'Specifies the value of the Payment Postal Code field.';
                }
                field("Payment Country Code"; Rec."Payment Country Code")
                {
                    ToolTip = 'Specifies the value of the Payment Country Code field.';
                }
                field("Job URL"; Rec."Job URL")
                {
                    ToolTip = 'Specifies the value of the Job URL field.', Comment = '%';
                }
                field("Polaraid URL"; Rec."Polaraid URL")
                {
                    ToolTip = 'Specifies the value of the Polaraid URL field.', Comment = '%';
                }
            }
        }
    }
}
