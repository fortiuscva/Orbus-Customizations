page 52656 "ORB Orbus Setup"
{
    ApplicationArea = All;
    Caption = 'Orbus Setup';
    PageType = Card;
    SourceTable = "ORB Orbus Setup";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Enable User Pick Zone"; Rec."Enable User Pick Zone")
                {
                    ToolTip = 'Specifies the value of the Enable User Pick Zone field.', Comment = '%';
                }
                field("Enable Auto Print Pick"; Rec."Enable Auto Print Pick")
                {
                    ApplicationArea = all;
                }
            }
            group("Address Validation")
            {
                Caption = 'Address Validation';
                field("Enable Auto Address Validation"; Rec."Enable Auto Address Validation")
                {
                    ToolTip = 'Specifies the value of the Enable Auto Address Validation on Sales Order Release field.', Comment = '%';
                }
            }
            group("Price Integration")
            {
                Caption = 'Price Integration';
                field("Last Sync DateTime"; Rec."Last Sync DateTime")
                {
                    ToolTip = 'Specifies the value of the Last Sync DateTime field.', Comment = '%';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
