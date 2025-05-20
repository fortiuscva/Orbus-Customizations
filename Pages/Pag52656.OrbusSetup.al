page 52656 "ORB Orbus Setup"
{
    ApplicationArea = All;
    Caption = 'ORB Orbus Setup';
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
