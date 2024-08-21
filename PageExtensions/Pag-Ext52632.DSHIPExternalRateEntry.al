pageextension 52632 "ORB DSHIP External Rate Entry" extends "DSHIP External Rate Entry"
{
    layout
    {
        modify(Rate)
        {
            trigger OnAfterValidate()
            var
                SingleInstance: Codeunit "ORB Orbus Single Instance";
            begin
                SingleInstance.SetFrieghtPrice(Rec.Rate);
            end;
        }
        addafter(Rate)
        {
            field("ORB Handling"; Rec."ORB Handling")
            {
                ApplicationArea = all;
                ToolTip = 'Handling';
                trigger OnValidate()
                var
                    SingleInstance: Codeunit "ORB Orbus Single Instance";
                begin
                    SingleInstance.SetHandlingPrice(Rec."ORB Handling");
                end;
            }
        }
    }
    var
        test: Page "DSHIP Package Worksheet";
}
