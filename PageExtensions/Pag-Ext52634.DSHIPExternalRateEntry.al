pageextension 52634 "ORB DSHIP External Rate Entry" extends "DSHIP External Rate Entry"
{
    layout
    {
        modify(Rate)
        {
            Caption = 'Orbus Freight Cost';
            trigger OnAfterValidate()
            var
                SingleInstance: Codeunit "ORB Orbus Single Instance";
            begin
                SingleInstance.SetFrieghtPrice(Rec.Rate);
            end;
        }

        addafter(Rate)
        {
            field("ORB Freight Quote"; Rec."ORB Freight Quote")
            {
                ApplicationArea = all;
                ToolTip = 'Freight Quote';
                trigger OnValidate()
                var
                    SingleInstance: Codeunit "ORB Orbus Single Instance";
                begin
                    SingleInstance.SetFreightQuote(Rec."ORB Freight Quote");
                end;
            }
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
