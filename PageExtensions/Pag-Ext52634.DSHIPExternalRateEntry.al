pageextension 52634 "ORB DSHIP External Rate Entry" extends "DSHIP External Rate Entry"
{
    layout
    {
        modify(Rate)
        {
<<<<<<< HEAD
            Caption = 'Orbus Freight Cost';
=======
>>>>>>> 06fb238 (ORB-013 - Trucking Cost/Price Enhancement Object renumber)
            trigger OnAfterValidate()
            var
                SingleInstance: Codeunit "ORB Orbus Single Instance";
            begin
                SingleInstance.SetFrieghtPrice(Rec.Rate);
            end;
        }
<<<<<<< HEAD

        addbefore(Rate)
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

        }
=======
>>>>>>> 06fb238 (ORB-013 - Trucking Cost/Price Enhancement Object renumber)
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
